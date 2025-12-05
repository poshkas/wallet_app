import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/token.dart';

class TokenCard extends StatelessWidget {
  final Token token;
  final VoidCallback? onTap;

  const TokenCard({
    super.key,
    required this.token,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
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
                    token.logo,
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      token.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${token.balance} ${token.symbol}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    token.value,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    token.change,
                    style: TextStyle(
                      color: token.positive
                          ? const Color(0xFF00D9A5)
                          : const Color(0xFFE0245E),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


