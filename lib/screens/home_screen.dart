import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _streak = 7;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Momentum', style: TextStyle(fontWeight: FontWeight.bold))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final scale = 1.0 + 0.08 * math.sin(_controller.value * math.pi);
                final opacity = 0.7 + 0.3 * _controller.value;
                return Transform.scale(
                  scale: scale,
                  child: Text(
                    'ðŸ”¥',
                    style: TextStyle(
                      fontSize: 100,
                      shadows: [
                        Shadow(color: AppTheme.accent.withOpacity(opacity), blurRadius: 40),
                        Shadow(color: AppTheme.primary.withOpacity(opacity), blurRadius: 60),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text('$_streak Day Streak', style: tt.headlineMedium?.copyWith(color: AppTheme.accent, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Building good habits should feel joyful. Every day you show up, your flame grows stronger.',
                textAlign: TextAlign.center,
                style: tt.bodyMedium?.copyWith(color: Colors.white60),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _streak++),
        icon: const Icon(Icons.check),
        label: const Text('Check In', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
