import 'package:flutter/cupertino.dart';
import 'input/text.dart';
import 'conversation/log.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const ChatLog(),
        TextInput(),
      ],
    );
  }
}
