import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/app_header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
                      const AppHeader(title: 'Настройки', showBack: false),
                      const SizedBox(height: 24),
                      // Profile Card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Row(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    'W',
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Main Wallet',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '0x7a9f...3b2c',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/change.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Settings sections
                      _buildSettingsSection(
                        context,
                        'Безопасность',
                        [
                          _SettingsItem(
                            icon: 'key',
                            label: 'Секретная фраза',
                            hasArrow: true,
                          ),
                          _SettingsItem(
                            icon: 'reset',
                            label: 'Изменить PIN-код',
                            hasArrow: true,
                          ),
                          _SettingsItem(
                            icon: 'fingerp',
                            label: 'Биометрия',
                            hasSwitch: true,
                            enabled: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildSettingsSection(
                        context,
                        'Кошелёк',
                        [
                          _SettingsItem(
                            icon: 'token',
                            label: 'Управление токенами',
                            hasArrow: true,
                          ),
                          _SettingsItem(
                            icon: 'wallet',
                            label: 'Адреса кошельков',
                            hasArrow: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildSettingsSection(
                        context,
                        'Общие',
                        [
                          _SettingsItem(
                            icon: 'chat',
                            label: 'Уведомления',
                            hasArrow: true,
                          ),
                          _SettingsItem(
                            icon: 'support',
                            label: 'Поддержка',
                            hasArrow: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Logout button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFE0245E),
                            side: const BorderSide(color: Color(0xFFE0245E)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/logout.svg',
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Выйти из кошелька',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Center(
                        child: Text(
                          'Версия 1.0.0',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8899A6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const BottomNav(currentPath: '/settings'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<_SettingsItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8899A6),
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Column(
            children: items.asMap().entries.map((entry) {
              final item = entry.value;
              final isLast = entry.key == items.length - 1;
              return Column(
                children: [
                  ListTile(
                    leading: Container(
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
                          'assets/icons/${item.icon}.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    title: Text(
                      item.label,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: item.hasSwitch
                        ? Switch(
                            value: item.enabled,
                            onChanged: (value) {},
                          )
                        : item.hasArrow
                            ? SvgPicture.asset(
                                'assets/icons/back.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFF8899A6),
                                  BlendMode.srcIn,
                                ),
                              )
                            : null,
                    onTap: item.hasArrow ? () {} : null,
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _SettingsItem {
  final String icon;
  final String label;
  final bool hasArrow;
  final bool hasSwitch;
  final bool enabled;

  _SettingsItem({
    required this.icon,
    required this.label,
    this.hasArrow = false,
    this.hasSwitch = false,
    this.enabled = false,
  });
}


