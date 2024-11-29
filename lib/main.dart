import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:readershaven_app/router/router.dart';
import 'scripts/createFloader.dart';
import 'theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme/theme_cubit.dart';
void main() {
  runApp(const ReadersHavenApp());
}

class ReadersHavenApp extends StatefulWidget {
  const ReadersHavenApp({super.key});

  @override
  State<ReadersHavenApp> createState() => _ReadersHavenAppState();
}

class _ReadersHavenAppState extends State<ReadersHavenApp> {
  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
  Future<String> pathFolder = createFolderInAppDocDir('books');
  final _router = AppRouter();
  @override
  void initState(){
    super.initState();
    initFirebase();
  }
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (BuildContext context) => ThemeCubit(), 
    child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) { 
      return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ReadersHaven',
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: state.isSwitched == true ? ThemeMode.dark : ThemeMode.light,
      routerConfig: _router.config(),
    );
  }));
  }
}