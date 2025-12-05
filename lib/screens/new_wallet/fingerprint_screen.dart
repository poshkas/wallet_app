import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/app_header.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  bool _fingerprintEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppHeader(title: 'Биометрия'),
                      const SizedBox(height: 48),
                      // Icon
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: _fingerprintEnabled
                                ? Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1)
                                : Theme.of(context)
                                    .colorScheme
                                    .surface
                                    .withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/fingerp.svg',
                              width: 64,
                              height: 64,
                              colorFilter: ColorFilter.mode(
                                _fingerprintEnabled
                                    ? Theme.of(context).colorScheme.primary
                                    : const Color(0xFF8899A6),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 48),
                      // Title and description
                      const Text(
                        'Включить биометрию?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _fingerprintEnabled
                            ? 'Биометрическая аутентификация включена. Вы можете использовать отпечаток пальца или Face ID для быстрого доступа к кошельку.'
                            : 'Используйте отпечаток пальца или Face ID для быстрого и безопасного доступа к кошельку.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8899A6),
                        ),
                      ),
                      const SizedBox(height: 48),
                      // Toggle
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Биометрическая аутентификация',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Быстрый и безопасный вход',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: _fingerprintEnabled,
                                onChanged: (value) {
                                  setState(() {
                                    _fingerprintEnabled = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Info
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Биометрические данные хранятся локально на вашем устройстве и никогда не передаются третьим лицам.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF8899A6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Complete button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Завершение создания кошелька
                    // В реальном приложении здесь должна быть логика сохранения данных
                    context.go('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Завершить настройку'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
