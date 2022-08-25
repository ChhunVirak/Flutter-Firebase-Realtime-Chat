import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              context.go('/profile');
              // pushNamed(
              //   'profile',
              //   queryParams: const Chat(
              //     name: 'Virak 18',
              //     age: '12',
              //   ).toMap(),
              //   extra: const Chat(
              //     name: 'Virak 189',
              //     age: '12',
              //   ).toMap(),
              // );
            },
            child: const Text('Go Profile')),
      ),
    );
  }
}
