import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  RouteType get defaultRouteType => RouteType.material();
  
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: MyHomeRoute.page, path: '/', children: [
      AutoRoute(page: LibraryRoute.page, path: 'library'),
      AutoRoute(page: SearchRoute.page, path: 'shop'),
      AutoRoute(page: SettingsRoute.page, path: 'settings')
    ]),
    AutoRoute(page: ReaderRoute.page, path: '/readerpage'),
    AutoRoute(page: DescriptionRoute.page, path: '/description')
  ];  

  @override
  List<AutoRouteGuard> get guards => [
  ];
}