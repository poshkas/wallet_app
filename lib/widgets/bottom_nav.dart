import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final String currentPath;

  const BottomNav({
    super.key,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {
        'icon': 'assets/icons/wallet.svg',
        'label': 'Кошелёк',
        'path': '/home',
      },
      {
        'icon': 'assets/icons/activ.svg',
        'label': 'Активность',
        'path': '/activity',
      },
      {
        'icon': 'assets/icons/browser.svg',
        'label': 'Браузер',
        'path': '/browser',
      },
      {
        'icon': 'assets/icons/settings.svg',
        'label': 'Настройки',
        'path': '/settings',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: const Border(
          top: BorderSide(color: Color(0xFF38444D), width: 1),
        ),
      ),
      child: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 375),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: navItems.map((item) {
              final isActive = currentPath == item['path'];
              return GestureDetector(
                onTap: () => context.go(item['path']!),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        item['icon']!,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          isActive
                              ? Theme.of(context).colorScheme.primary
                              : const Color(0xFF8899A6),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label']!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0xFF8899A6),
                      ),
                    ),
                    if (isActive)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


