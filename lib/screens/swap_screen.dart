import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_header.dart';

class SwapScreen extends StatefulWidget {
  final String symbol;

  const SwapScreen({super.key, required this.symbol});

  @override
  State<SwapScreen> createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  String _fromToken = 'TOC';
  String _toToken = 'BTC';
  final TextEditingController _fromAmountController = TextEditingController();
  final TextEditingController _toAmountController = TextEditingController();
  double _exchangeRate = 0.0005; // Примерный курс обмена

  @override
  void initState() {
    super.initState();
    _fromToken = widget.symbol.toUpperCase();
    _fromAmountController.addListener(_updateToAmount);
  }

  @override
  void dispose() {
    _fromAmountController.dispose();
    _toAmountController.dispose();
    super.dispose();
  }

  void _updateToAmount() {
    final fromAmount = double.tryParse(_fromAmountController.text) ?? 0.0;
    final toAmount = fromAmount * _exchangeRate;
    if (toAmount > 0) {
      _toAmountController.text = toAmount.toStringAsFixed(8);
    } else {
      _toAmountController.clear();
    }
  }

  void _swapTokens() {
    setState(() {
      final temp = _fromToken;
      _fromToken = _toToken;
      _toToken = temp;
      _fromAmountController.clear();
      _toAmountController.clear();
    });
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
                      const AppHeader(title: 'Обменять'),
                      const SizedBox(height: 32),
                      // From token card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ОТКУДА',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8899A6),
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _fromAmountController,
                                      keyboardType: TextInputType.number,
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
                                  const SizedBox(width: 16),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      _fromToken,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Доступно: 1,234.56 $_fromToken',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF8899A6),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      _fromAmountController.text = '1234.56';
                                    },
                                    child: const Text('MAX'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Swap button
                      Center(
                        child: IconButton(
                          onPressed: _swapTokens,
                          icon: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF38444D),
                              ),
                            ),
                            child: const Icon(
                              Icons.swap_vert,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // To token card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'КУДА',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8899A6),
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _toAmountController,
                                      keyboardType: TextInputType.number,
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
                                  const SizedBox(width: 16),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      _toToken,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Курс: 1 $_fromToken = ${_exchangeRate.toStringAsFixed(8)} $_toToken',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8899A6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Exchange rate info
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
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
                                      'Комиссия сети',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '~0.001 $_fromToken',
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
            // Swap button
            Container(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_fromAmountController.text.isNotEmpty &&
                        double.tryParse(_fromAmountController.text) != null &&
                        double.parse(_fromAmountController.text) > 0) {
                      // Здесь должна быть логика обмена
                      // Пока просто возвращаемся назад
                      context.pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Обменять'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
