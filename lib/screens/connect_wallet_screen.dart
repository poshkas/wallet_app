import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_header.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  final TextEditingController _secretPhraseController = TextEditingController();
  String _selectedMethod = 'phrase'; // 'phrase' or 'key'

  @override
  void dispose() {
    _secretPhraseController.dispose();
    super.dispose();
  }

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
                      const AppHeader(title: 'Подключить кошелёк'),
                      const SizedBox(height: 32),
                      // Title and description
                      const Text(
                        'Подключите существующий кошелёк',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Введите секретную фразу или приватный ключ для восстановления доступа к вашему кошельку',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8899A6),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Method selector
                      Row(
                        children: [
                          Expanded(
                            child: _buildMethodButton(
                              'phrase',
                              'Секретная фраза',
                              Icons.lock_outline,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildMethodButton(
                              'key',
                              'Приватный ключ',
                              Icons.vpn_key_outlined,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Input field
                      if (_selectedMethod == 'phrase') ...[
                        const Text(
                          'СЕКРЕТНАЯ ФРАЗА',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8899A6),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: TextField(
                              controller: _secretPhraseController,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Введите 12 или 24 слова через пробел',
                                hintStyle: TextStyle(
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Никогда не делитесь своей секретной фразой с другими',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        const Text(
                          'ПРИВАТНЫЙ КЛЮЧ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8899A6),
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: TextField(
                              controller: _secretPhraseController,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '0x...',
                                hintStyle: TextStyle(
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Приватный ключ должен начинаться с 0x',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
            // Connect button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_secretPhraseController.text.isNotEmpty) {
                      // Здесь должна быть логика подключения кошелька
                      // Пока просто переходим на главный экран
                      context.go('/home');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Подключить кошелёк'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodButton(String method, String label, IconData icon) {
    final isSelected = _selectedMethod == method;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedMethod = method;
          _secretPhraseController.clear();
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFF38444D),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFF8899A6),
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xFF8899A6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
