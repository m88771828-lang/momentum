import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MomentumApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);

class MomentumApp extends StatelessWidget {
  const MomentumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Momentum',
      theme: AppTheme.theme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
