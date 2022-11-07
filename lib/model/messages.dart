import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:mobx/mobx.dart';

part 'messages.g.dart';

class Messages = MessagesBase with _$Messages;

class Message {
  const Message({
    required this.text,
    this.isReceived = false,
    this.fileName = '',
  });

  final String text;
  final String fileName;
  final bool isReceived;
}

abstract class MessagesBase with Store {
  final int port = 3000;
  final RegExp bytesRegex = RegExp(r'\[.*\]');
  List<Socket> clients = [];
  Function(String)? writeTextMessage;
  Future<void> Function(String, String)? writeFileMessage;

  @observable
  Observable<ServerSocket>? server;

  @observable
  Observable<Socket>? client;

  @observable
  Observable<StreamController>? controller;

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  @action
  void add(String data, [bool isReceived = false, fileName = '']) {
    if (!isReceived) {
      sendMessage(data, fileName);
    }

    messages.add(Message(
      text: data,
      isReceived: isReceived,
      fileName: fileName,
    ));
  }

  @action
  Future<void> sendMessage(String data, String fileName) async {
    if (fileName.isEmpty) {
      writeTextMessage?.call(data);
    } else {
      await writeFileMessage?.call(data, fileName);
    }
  }

  @computed
  bool get isConnected => server != null || client != null;

  @computed
  bool get isServer => server != null;

  @computed
  bool get isClient => client != null;

  @action
  Future<void> listen() async {
    server = Observable(await ServerSocket.bind('0.0.0.0', port));
    writeTextMessage = serverWriteTextMessage;
    writeFileMessage = serverWriteFileMessage;
    server?.value.listen(listener);
  }

  @action
  Future<void> connect(String ip) async {
    client = Observable(await Socket.connect(ip, port));
    writeTextMessage = clientWriteTextMessage;
    writeFileMessage = clientWriteFileMessage;
    client?.value.listen(messageReceived);
  }

  @action
  Function(Uint8List) listener(Socket socket) {
    socket.listen(messageReceived);
    clients.add(socket);
    return messageReceived;
  }

  @action
  void messageReceived(Uint8List data) {
    String string = String.fromCharCodes(data);
    if (bytesRegex.hasMatch(string)) {
      add(string, true, 'temp');
    } else {
      add(string, true);
    }
  }

  void serverWriteTextMessage(String data) {
    for (Socket socket in clients) {
      socket.write(data);
    }
  }

  Future<void> serverWriteFileMessage(String data, String fileName) async {
    for (Socket socket in clients) {
      await socket.addStream(ByteStream.fromBytes(utf8.encode(data)));
    }
  }

  void clientWriteTextMessage(String data) {
    client?.value.addStream(ByteStream.fromBytes(utf8.encode(data)));
  }

  Future<void> clientWriteFileMessage(String data, String fileName) async {
    await client?.value.addStream(ByteStream.fromBytes(utf8.encode(data)));
  }
}
