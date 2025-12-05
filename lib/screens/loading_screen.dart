import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go('/greeting');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF10161F),
              Color(0xFF1A2332),
              Color(0xFF10161F),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/logos/main.svg',
                width: 128,
                height: 128,
              ),
              const SizedBox(height: 32),
              const Text(
                'W-Allet',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(0),
                  const SizedBox(width: 8),
                  _buildDot(200),
                  const SizedBox(width: 8),
                  _buildDot(400),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 32),
        child: Text(
          'Версия ${AppConstants.appVersion}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF8899A6),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildDot(int delay) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: (value + delay / 1000) % 1.0,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}


