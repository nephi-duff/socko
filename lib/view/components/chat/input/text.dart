import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:socko/model/messages.dart';

import 'attach.dart';
import 'listen.dart';
import 'send.dart';

class TextInput extends StatelessWidget {
  TextInput({
    super.key,
  });

  final controller = TextEditingController();
  final focusNode = FocusNode();

  void addMessage(Messages messages) {
    if (controller.text != '') {
      messages.add(controller.text);
      controller.clear();
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: CupertinoTextField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.go,
        onSubmitted: (value) => addMessage(messages),
        suffix: Row(
          children: <Widget>[
            Listen(),
            const Attachment(),
            Send(
              onPressed: () => addMessage(messages),
            ),
          ],
        ),
      ),
    );
  }
}
