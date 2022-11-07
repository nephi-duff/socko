import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:socko/model/messages.dart';
import 'pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Messages>(create: (_) => Messages()),
      ],
      child: CupertinoApp(
        title: 'Socko',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
        ),
        home: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: const Home(),
        ),
      ),
    );
  }
}
