import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../widgets/app_header.dart';
import '../utils/constants.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  String selectedToken = 'TOC';

  void _copyAddress() {
    Clipboard.setData(ClipboardData(text: AppConstants.walletAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Адрес скопирован!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppHeader(title: 'Получить'),
                const SizedBox(height: 24),
                // Token selector
                const Text(
                  'ВЫБЕРИТЕ ТОКЕН',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8899A6),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['TOC', 'BTC', 'ETH'].map((token) {
                      final isSelected = selectedToken == token;
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: ChoiceChip(
                          label: Text(token),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              selectedToken = token;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24),
                // QR Code
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: QrImageView(
                            data: AppConstants.walletAddress,
                            version: QrVersions.auto,
                            size: 200,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Адрес кошелька',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8899A6),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            AppConstants.walletAddress,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'monospace',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _copyAddress,
                                icon: SvgPicture.asset(
                                  'assets/icons/file light.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                label: const Text('Копировать'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text('Поделиться'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


