// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Messages on MessagesBase, Store {
  Computed<bool>? _$isConnectedComputed;

  @override
  bool get isConnected =>
      (_$isConnectedComputed ??= Computed<bool>(() => super.isConnected,
              name: 'MessagesBase.isConnected'))
          .value;
  Computed<bool>? _$isServerComputed;

  @override
  bool get isServer => (_$isServerComputed ??=
          Computed<bool>(() => super.isServer, name: 'MessagesBase.isServer'))
      .value;
  Computed<bool>? _$isClientComputed;

  @override
  bool get isClient => (_$isClientComputed ??=
          Computed<bool>(() => super.isClient, name: 'MessagesBase.isClient'))
      .value;

  late final _$serverAtom = Atom(name: 'MessagesBase.server', context: context);

  @override
  Observable<ServerSocket>? get server {
    _$serverAtom.reportRead();
    return super.server;
  }

  @override
  set server(Observable<ServerSocket>? value) {
    _$serverAtom.reportWrite(value, super.server, () {
      super.server = value;
    });
  }

  late final _$clientAtom = Atom(name: 'MessagesBase.client', context: context);

  @override
  Observable<Socket>? get client {
    _$clientAtom.reportRead();
    return super.client;
  }

  @override
  set client(Observable<Socket>? value) {
    _$clientAtom.reportWrite(value, super.client, () {
      super.client = value;
    });
  }

  late final _$controllerAtom =
      Atom(name: 'MessagesBase.controller', context: context);

  @override
  Observable<StreamController<dynamic>>? get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(Observable<StreamController<dynamic>>? value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$messagesAtom =
      Atom(name: 'MessagesBase.messages', context: context);

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('MessagesBase.sendMessage', context: context);

  @override
  Future<void> sendMessage(String data, String fileName) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(data, fileName));
  }

  late final _$listenAsyncAction =
      AsyncAction('MessagesBase.listen', context: context);

  @override
  Future<void> listen() {
    return _$listenAsyncAction.run(() => super.listen());
  }

  late final _$connectAsyncAction =
      AsyncAction('MessagesBase.connect', context: context);

  @override
  Future<void> connect(String ip) {
    return _$connectAsyncAction.run(() => super.connect(ip));
  }

  late final _$MessagesBaseActionController =
      ActionController(name: 'MessagesBase', context: context);

  @override
  void add(String data, [bool isReceived = false, dynamic fileName = '']) {
    final _$actionInfo =
        _$MessagesBaseActionController.startAction(name: 'MessagesBase.add');
    try {
      return super.add(data, isReceived, fileName);
    } finally {
      _$MessagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic Function(Uint8List) listener(Socket socket) {
    final _$actionInfo = _$MessagesBaseActionController.startAction(
        name: 'MessagesBase.listener');
    try {
      return super.listener(socket);
    } finally {
      _$MessagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void messageReceived(Uint8List data) {
    final _$actionInfo = _$MessagesBaseActionController.startAction(
        name: 'MessagesBase.messageReceived');
    try {
      return super.messageReceived(data);
    } finally {
      _$MessagesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
server: ${server},
client: ${client},
controller: ${controller},
messages: ${messages},
isConnected: ${isConnected},
isServer: ${isServer},
isClient: ${isClient}
    ''';
  }
}
