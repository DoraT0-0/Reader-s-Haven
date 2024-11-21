
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:readershaven_app/router/router.gr.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openPage(int index, TabsRouter tabsRouter){
    tabsRouter.setActiveIndex(index);
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AutoTabsRouter(
        routes: const [
          LibraryRoute(),
          SearchRoute(),
          SettingsRoute()
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: GNav(
              onTabChange: (index) => _openPage(index, tabsRouter),
              selectedIndex: tabsRouter.activeIndex,
              backgroundColor: theme.primaryColor,
              gap: 8,
              tabs: [
                GButton(icon: Icons.library_books, text: "Библиотека", textStyle: TextStyle(fontSize: 14)),
                GButton(icon: Icons.library_add, text: "Поисковик", textStyle: TextStyle(fontSize: 14)),
                GButton(icon: Icons.settings, text: "Настройки", textStyle: TextStyle(fontSize: 14))
              ]
            )
          );
        },
      ),
    );
  }
}