import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_header.dart';

class SellScreen extends StatefulWidget {
  final String symbol;

  const SellScreen({super.key, required this.symbol});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String _selectedPaymentMethod = 'card';

  @override
  void dispose() {
    _amountController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _updatePrice() {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    // Примерная цена продажи (в реальном приложении это должно быть из API)
    final pricePerUnit = widget.symbol.toUpperCase() == 'TOC'
        ? 37.25
        : widget.symbol.toUpperCase() == 'BTC'
            ? 45234.56
            : 2345.67;
    final totalPrice = amount * pricePerUnit;
    if (totalPrice > 0) {
      _priceController.text = totalPrice.toStringAsFixed(2);
    } else {
      _priceController.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_updatePrice);
  }

  @override
  Widget build(BuildContext context) {
    final upperSymbol = widget.symbol.toUpperCase();
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
                      AppHeader(title: 'Продать $upperSymbol'),
                      const SizedBox(height: 32),
                      // Amount card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Сумма',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                  Text(
                                    'Доступно: 1,234.56 $upperSymbol',
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
                                      controller: _amountController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0.00',
                                        hintStyle: const TextStyle(
                                          color: Color(0xFF8899A6),
                                        ),
                                        suffixText: upperSymbol,
                                        suffixStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextButton(
                                onPressed: () {
                                  _amountController.text = '1234.56';
                                },
                                child: const Text('MAX'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Price card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Вы получите',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Text(
                                    '\$',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: _priceController,
                                      readOnly: true,
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '0.00',
                                        hintStyle: TextStyle(
                                          color: Color(0xFF8899A6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Payment method
                      const Text(
                        'СПОСОБ ПОЛУЧЕНИЯ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8899A6),
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildPaymentMethodButton('card', 'Карта'),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildPaymentMethodButton('bank', 'Банк'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Info card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.info_outline,
                                size: 20,
                                color: Color(0xFF8899A6),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Комиссия',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Комиссия сети: ~0.001 $upperSymbol',
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sell button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_amountController.text.isNotEmpty &&
                        double.tryParse(_amountController.text) != null &&
                        double.parse(_amountController.text) > 0) {
                      // Здесь должна быть логика продажи
                      // Пока просто возвращаемся назад
                      context.pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Продать $upperSymbol'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodButton(String method, String label) {
    final isSelected = _selectedPaymentMethod == method;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = method;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : const Color(0xFF38444D),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFF8899A6),
            ),
          ),
        ),
      ),
    );
  }
}
