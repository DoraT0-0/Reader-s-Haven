import 'package:flutter/material.dart';
import 'package:readershaven_app/router/router.dart';
import 'scripts/createFloader.dart';
void main() {
  runApp(const ReadersHavenApp());
}

class ReadersHavenApp extends StatefulWidget {
  const ReadersHavenApp({super.key});

  @override
  State<ReadersHavenApp> createState() => _ReadersHavenAppState();
}

class _ReadersHavenAppState extends State<ReadersHavenApp> {
  Future<String> pathFolder = createFolderInAppDocDir('books');
  final _router = AppRouter();
  int thememode = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ReadersHaven',
      theme: ThemeData(
        primaryColor: Colors.white70
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.black45,
      ),
      themeMode: thememode == 1 ? ThemeMode.dark : ThemeMode.light,
      routerConfig: _router.config(),
    );
  }
}







