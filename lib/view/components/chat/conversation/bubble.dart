import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:socko/model/messages.dart';
import 'package:socko/view/components/chat/constants.dart';

class Bubble extends StatelessWidget {
  const Bubble({super.key, required this.message});
  final Message message;

  Widget textMessage() => Text(
        message.text,
        style: const TextStyle(
          color: CupertinoColors.white,
          fontSize: 14,
        ),
      );

  Widget fileMessage(BuildContext context) => Row(
        children: [
          CupertinoButton(
            minSize: iconSize,
            onPressed: () async => await saveFile(context),
            padding: iconPadding,
            child: const Icon(
              CupertinoIcons.paperclip,
              color: CupertinoColors.black,
              size: 14,
            ),
          ),
          Flexible(
            child: Text(
              message.fileName,
              style: const TextStyle(
                color: CupertinoColors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      );

  Widget getBubbleContent(BuildContext context) =>
      message.fileName.isEmpty ? textMessage() : fileMessage(context);

  Future<void> saveFile(BuildContext context) async {
    String? path = await FilePicker.platform.saveFile();

    if (path != null && path.isNotEmpty) {
      File(path).writeAsBytes(List<int>.from(jsonDecode(message.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment alignment;
    Color color;

    if (message.isReceived) {
      alignment = MainAxisAlignment.start;
      color = CupertinoColors.systemGreen;
    } else {
      alignment = MainAxisAlignment.end;
      color = CupertinoColors.systemBlue;
    }

    return Row(
      mainAxisAlignment: alignment,
      children: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.6,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 7.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
            ),
            child: getBubbleContent(context),
          ),
        ),
      ],
    );
  }
}
