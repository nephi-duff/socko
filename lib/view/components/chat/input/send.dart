import 'package:flutter/cupertino.dart';
import '../constants.dart';

class Send extends StatelessWidget {
  const Send({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: iconSize,
      onPressed: onPressed,
      padding: iconPadding,
      child: const Icon(
        CupertinoIcons.paperplane,
        size: iconSize,
      ),
    );
  }
}
