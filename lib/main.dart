import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/screen/home.dart';
import 'package:go_router_project/screen/chat_screen.dart';
import 'package:go_router_project/screen/success.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate);
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          name: 'home',
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
          routes: [
            GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) {
                var qpara = Chat.fromMap(state.queryParams);

                return Chat(
                  name: qpara.name,
                  age: qpara.age,
                );
              },
            ),
          ]),
      GoRoute(
        name: 'success',
        path: '/success',
        builder: (BuildContext context, GoRouterState state) {
          return const Success();
        },
      ),
    ],
    debugLogDiagnostics: true,
  );
}
