import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:socko/model/messages.dart';

import 'bubble.dart';

class ChatLog extends StatelessWidget {
  const ChatLog({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context);

    return SizedBox(
      height: double.maxFinite,
      child: Observer(
        builder: (_) => CupertinoScrollbar(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 35.0),
            physics: const ClampingScrollPhysics(),
            itemCount: messages.messages.length,
            itemBuilder: (_, index) =>
                Bubble(message: messages.messages[index]),
          ),
        ),
      ),
    );
  }
}
