import 'package:flutter/material.dart';
import '../widgets/token_card.dart';
import '../models/token.dart';
import '../utils/constants.dart';

class CoinListScreen extends StatelessWidget {
  const CoinListScreen({super.key});

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
      appBar: AppBar(
        title: const Text('Все токены'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: tokens.length,
        itemBuilder: (context, index) {
          return TokenCard(
            token: tokens[index],
            onTap: () {},
          );
        },
      ),
    );
  }
}


