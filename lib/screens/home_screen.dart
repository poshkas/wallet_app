import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/token_card.dart';
import '../models/token.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = AppConstants.defaultTokens
        .map((t) => Token(
              name: t['name'] as String,
              symbol: t['symbol'] as String,
              balance: t['balance'] as String,
              value: t['value'] as String,
              change: t['change'] as String,
              logo: t['logo'] as String,
              positive: t['positive'] as bool,
            ))
        .toList();

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
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    'W',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Кошелёк',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                  Text(
                                    'Main Wallet',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => context.go('/notifications'),
                            child: Stack(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/chat.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE0245E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Balance Card
                      Card(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2),
                                Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Общий баланс',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '\$49,259.13',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Text(
                                    '+15.3%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF00D9A5),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'за последние 24ч',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Action buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildActionButton(
                            context,
                            'assets/icons/send.svg',
                            'Отправить',
                            () => context.go('/send'),
                          ),
                          _buildActionButton(
                            context,
                            'assets/icons/reciever.svg',
                            'Получить',
                            () => context.go('/receive'),
                          ),
                          _buildActionButton(
                            context,
                            'assets/icons/exchange.svg',
                            'Обмен',
                            () => context.go('/coin/toc/swap'),
                          ),
                          _buildActionButton(
                            context,
                            'assets/icons/scanner.svg',
                            'Сканер',
                            () => context.go('/scan'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Tokens Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Мои токены',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/coin'),
                            child: const Text(
                              'Все',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF00BFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...tokens.map((token) => TokenCard(
                            token: token,
                            onTap: () =>
                                context.go('/coin/${token.symbol.toLowerCase()}'),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            BottomNav(currentPath: '/home'),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String icon,
    String label,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 20,
                height: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


