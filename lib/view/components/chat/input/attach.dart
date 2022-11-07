import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:socko/model/messages.dart';
import '../constants.dart';

class Attachment extends StatelessWidget {
  const Attachment({super.key});

  Future<void> filePrompt(BuildContext context, Messages messages) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String path = result.files.single.path ?? '';
      File file = File(path);
      messages.add(file.readAsBytesSync().toString(), false, file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context);

    return CupertinoButton(
      minSize: iconSize,
      onPressed: () async => await filePrompt(context, messages),
      padding: iconPadding,
      child: const Icon(
        CupertinoIcons.paperclip,
        size: iconSize,
      ),
    );
  }
}
