import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:socko/model/messages.dart';
import '../constants.dart';

const promptString = '''
Enter an IP address to connect to a server or nothing to listen for connections.
''';

class Listen extends StatelessWidget {
  Listen({
    super.key,
  });

  final connectedIcon = CupertinoIcons.bolt_horizontal_circle_fill;
  final disconnectedIcon = CupertinoIcons.bolt_horizontal_circle;
  final dialogController = TextEditingController();

  final RegExp ipPattern = RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$');

  Future<void> connect(BuildContext context, Messages messages) async {
    String input = dialogController.text;
    String output = 'Invalid input';

    if (input == '') {
      messages.listen();
      output = 'Listening on port ${messages.port}';
    } else if (ipPattern.hasMatch(input)) {
      messages.connect(input);
      output = 'Connecting to $input';
    }

    await showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Connection'),
        content: Text(output),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context, 'Discard'),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> showDialog(BuildContext context, Messages messages) async {
    await showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: const Text('Connect'),
          content: Column(
            children: [
              const Text(promptString),
              CupertinoTextField(controller: dialogController),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.pop(context, 'Discard');
                await connect(context, messages);
              },
              child: const Text('Ok'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages = Provider.of<Messages>(context);

    return CupertinoButton(
      minSize: iconSize,
      onPressed: () async => await showDialog(context, messages),
      padding: iconPadding,
      child: Observer(
        builder: (_) => Icon(
          messages.isConnected ? connectedIcon : disconnectedIcon,
          size: iconSize,
        ),
      ),
    );
  }
}
