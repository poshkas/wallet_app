import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_header.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Транзакция завершена',
        'message': 'Вы успешно отправили 120.50 TOC',
        'time': '5 мин назад',
        'read': false,
      },
      {
        'title': 'Получены средства',
        'message': 'Вы получили 500.00 TOC',
        'time': '2 часа назад',
        'read': true,
      },
      {
        'title': 'Обмен выполнен',
        'message': 'Обмен 100 TOC на 0.05 BTC выполнен',
        'time': 'Вчера',
        'read': true,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHeader(
                  title: 'Уведомления',
                  rightAction: TextButton(
                    onPressed: () {},
                    child: const Text('Очистить'),
                  ),
                ),
                const SizedBox(height: 24),
                ...notifications.map((notif) {
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/chat.svg',
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        notif['title'] as String,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    if (!(notif['read'] as bool))
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  notif['message'] as String,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF8899A6),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  notif['time'] as String,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF8899A6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
