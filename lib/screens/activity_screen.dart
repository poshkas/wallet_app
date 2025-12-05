import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/app_header.dart';
import '../models/transaction.dart';

class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key});

  final List<Transaction> transactions = [
    Transaction(
      type: 'send',
      title: 'Отправлено',
      amount: '-120.50',
      coin: 'TOC',
      address: '0x7a9f...3b2c',
      time: 'Сегодня, 14:35',
      status: 'completed',
    ),
    Transaction(
      type: 'receive',
      title: 'Получено',
      amount: '+500.00',
      coin: 'TOC',
      address: '0x4b3c...8d1a',
      time: 'Сегодня, 10:20',
      status: 'completed',
    ),
    Transaction(
      type: 'swap',
      title: 'Обменяно',
      amount: '100 TOC → 0.05 BTC',
      coin: '',
      address: null,
      time: 'Вчера, 18:45',
      status: 'completed',
    ),
  ];

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
                      const AppHeader(title: 'Активность', showBack: false),
                      const SizedBox(height: 24),
                      // Filter tabs
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterTab(context, 'Все', true),
                            const SizedBox(width: 8),
                            _buildFilterTab(context, 'Отправлено', false),
                            const SizedBox(width: 8),
                            _buildFilterTab(context, 'Получено', false),
                            const SizedBox(width: 8),
                            _buildFilterTab(context, 'Обменяно', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Transactions
                      ...transactions.map((tx) => _buildTransactionCard(context, tx)),
                    ],
                  ),
                ),
              ),
            ),
            const BottomNav(currentPath: '/activity'),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(BuildContext context, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF8899A6),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTransactionCard(BuildContext context, Transaction tx) {
    String iconPath;
    Color bgColor;
    if (tx.type == 'send') {
      iconPath = 'assets/icons/send.svg';
      bgColor = const Color(0xFFE0245E).withOpacity(0.1);
    } else if (tx.type == 'receive') {
      iconPath = 'assets/icons/reciever.svg';
      bgColor = const Color(0xFF00D9A5).withOpacity(0.1);
    } else {
      iconPath = 'assets/icons/exchange.svg';
      bgColor = const Color(0xFF00BFFF).withOpacity(0.1);
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  iconPath,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  if (tx.address != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      '${tx.type == 'send' ? 'на' : 'от'} ${tx.address}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${tx.amount} ${tx.coin}',
                  style: TextStyle(
                    color: tx.amount.startsWith('+')
                        ? const Color(0xFF00D9A5)
                        : tx.amount.startsWith('-')
                            ? const Color(0xFFE0245E)
                            : Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tx.status == 'completed' ? 'Завершено' : 'В процессе',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
