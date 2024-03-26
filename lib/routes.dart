import 'package:routefly/routefly.dart';

import 'app/(public)/login_page.dart' as a0;
import 'app/(public)/splash_page.dart' as a1;
import 'app/(public)/update_user_page.dart' as a2;
import 'app/(public)/home_page.dart' as a3;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.SplashPage(),
    ),
  ),
  RouteEntity(
    key: '/update-user',
    uri: Uri.parse('/update-user'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.UpdateUserPage(),
    ),
  ),  
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.HomePage(),
    ),
  ),   
];

const routePaths = (
  path: '/',
  login: '/login',
  splash: '/splash',
  updateUser: '/update-user',
  home: '/home',
);