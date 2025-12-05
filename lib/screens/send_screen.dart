import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/app_header.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({super.key});

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  String selectedToken = 'TOC';
  final TextEditingController amountController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    addressController.dispose();
    noteController.dispose();
    super.dispose();
  }

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
                      const AppHeader(title: 'Отправить'),
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
                      // Amount input
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Сумма',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                  Text(
                                    'Доступно: 1,234.56 $selectedToken',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Text(
                                    '\$',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: amountController,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0.00',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF8899A6),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    selectedToken,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () {
                                  amountController.text = '1234.56';
                                },
                                child: const Text('MAX'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Address input
                      const Text(
                        'АДРЕС ПОЛУЧАТЕЛЯ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8899A6),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: addressController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0x...',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/scanner.svg',
                                  width: 20,
                                  height: 20,
                                ),
                                onPressed: () => context.go('/scan'),
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
            // Send button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (amountController.text.isNotEmpty &&
                        addressController.text.isNotEmpty) {
                      context.go('/home');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Отправить $selectedToken'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


