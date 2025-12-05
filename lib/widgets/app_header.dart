import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool showBack;
  final Widget? rightAction;
  final VoidCallback? onBack;

  const AppHeader({
    super.key,
    required this.title,
    this.showBack = true,
    this.rightAction,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        showBack
            ? IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/back.svg',
                  width: 24,
                  height: 24,
                ),
                onPressed: onBack ?? () => context.pop(),
              )
            : const SizedBox(width: 48),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        rightAction ?? const SizedBox(width: 48),
      ],
    );
  }
}


