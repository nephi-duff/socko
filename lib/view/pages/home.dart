import 'package:flutter/cupertino.dart';

import 'package:socko/view/components/chat/container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      widthFactor: 0.9,
      heightFactor: 1.0,
      child: ChatContainer(),
    );
  }
}
