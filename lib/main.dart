import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:movies_overview/config/dependencies.dart';
import 'package:movies_overview/routing/router.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = Level.ALL;
  runApp(MultiProvider(
    providers: providersRemote,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      routerConfig: router(context.read()),
    );
  }
}
