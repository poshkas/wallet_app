import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinDetailScreen extends StatelessWidget {
  final String symbol;

  const CoinDetailScreen({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final upperSymbol = symbol.toUpperCase();
    final coinData = {
      'name': upperSymbol == 'TOC' ? 'TOCcoin' : upperSymbol == 'BTC' ? 'Bitcoin' : 'Ethereum',
      'price': upperSymbol == 'TOC' ? '\$37.25' : upperSymbol == 'BTC' ? '\$45,234.56' : '\$2,345.67',
      'change': upperSymbol == 'TOC' ? '+12.5%' : upperSymbol == 'BTC' ? '-2.3%' : '+5.2%',
      'balance': upperSymbol == 'TOC' ? '1,234.56' : upperSymbol == 'BTC' ? '0.0234' : '1.5678',
      'value': upperSymbol == 'TOC' ? '\$45,678.90' : upperSymbol == 'BTC' ? '\$1,234.56' : '\$2,345.67',
    };

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/back.svg',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () => context.pop(),
                    ),
                    Text(
                      coinData['name']!,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/star.svg',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Price Card
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary.withOpacity(0.2),
                          Theme.of(context).colorScheme.primary.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/logos/coin.svg',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  coinData['price']!,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${coinData['change']!} за 24ч',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: coinData['change']!.startsWith('+')
                                        ? const Color(0xFF00D9A5)
                                        : const Color(0xFFE0245E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Баланс',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF8899A6),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${coinData['balance']!} $upperSymbol',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Стоимость',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF8899A6),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  coinData['value']!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
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
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context.go('/coin/$symbol/buy'),
                        child: const Text('Купить'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.go('/coin/$symbol/sell'),
                        child: const Text('Продать'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.go('/coin/$symbol/swap'),
                        child: const Text('Обменять'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


