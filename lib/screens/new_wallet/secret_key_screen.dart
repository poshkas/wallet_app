import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_header.dart';

class SecretKeyScreen extends StatefulWidget {
  const SecretKeyScreen({super.key});

  @override
  State<SecretKeyScreen> createState() => _SecretKeyScreenState();
}

class _SecretKeyScreenState extends State<SecretKeyScreen> {
  final List<String> _secretWords = List.generate(12, (index) => '');
  bool _isCopied = false;

  @override
  void initState() {
    super.initState();
    // Генерируем пример секретной фразы (в реальном приложении это должна быть настоящая генерация)
    _secretWords.replaceRange(0, 12, [
      'abandon',
      'ability',
      'able',
      'about',
      'above',
      'absent',
      'absorb',
      'abstract',
      'absurd',
      'abuse',
      'access',
      'accident',
    ]);
  }

  void _copyToClipboard() {
    // В реальном приложении здесь должен быть:
    // final phrase = _secretWords.join(' ');
    // Clipboard.setData(ClipboardData(text: phrase));
    setState(() {
      _isCopied = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isCopied = false;
        });
      }
    });
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
                      const AppHeader(title: 'Секретная фраза'),
                      const SizedBox(height: 32),
                      // Warning
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0245E).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFE0245E).withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Color(0xFFE0245E),
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'Сохраните эту фразу в безопасном месте. Никогда не делитесь ей с другими.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Secret phrase grid
                      const Text(
                        'ВАША СЕКРЕТНАЯ ФРАЗА',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8899A6),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2.5,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: const Color(0xFF38444D),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}. ${_secretWords[index]}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      // Copy button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _copyToClipboard,
                          icon: Icon(
                            _isCopied ? Icons.check : Icons.copy,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          label: Text(
                            _isCopied ? 'Скопировано!' : 'Копировать фразу',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
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
                              'Эта фраза позволяет восстановить доступ к вашему кошельку. Запишите её и храните в безопасном месте.',
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
            // Continue button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.go('/new-wallet/fingerprint');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Продолжить'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
