import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                  'Добро пожаловать в W-Allet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Безопасный и удобный криптовалютный кошелёк для управления вашими цифровыми активами',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8899A6),
                  ),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.go('/new-wallet/pin-code'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Создать новый кошелёк'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.go('/connect-wallet'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: const Text('Подключить кошелёк'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Используя W-Allet, вы соглашаетесь с нашими',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF8899A6),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Условиями использования и Политикой конфиденциальности',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


