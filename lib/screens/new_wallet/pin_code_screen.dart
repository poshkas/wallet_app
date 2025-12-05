import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/app_header.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final List<String> _pin = [];
  final int _pinLength = 6;

  void _onNumberPressed(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin.add(number);
      });

      if (_pin.length == _pinLength) {
        // Переход на следующий экран после ввода PIN
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            context.go('/new-wallet/secret-key');
          }
        });
      }
    }
  }

  void _onDeletePressed() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin.removeLast();
      });
    }
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
                      const AppHeader(title: 'PIN-код'),
                      const SizedBox(height: 48),
                      // Title and description
                      const Text(
                        'Создайте PIN-код',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Используйте PIN-код для быстрого доступа к кошельку',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8899A6),
                        ),
                      ),
                      const SizedBox(height: 48),
                      // PIN dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pinLength,
                          (index) => Container(
                            width: 16,
                            height: 16,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index < _pin.length
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color(0xFF38444D),
                              border: Border.all(
                                color: index < _pin.length
                                    ? Theme.of(context).colorScheme.primary
                                    : const Color(0xFF38444D),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 64),
                      // Number pad
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: ['1', '2', '3']
                                .map((num) => _buildNumberButton(num))
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: ['4', '5', '6']
                                .map((num) => _buildNumberButton(num))
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: ['7', '8', '9']
                                .map((num) => _buildNumberButton(num))
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 80, height: 80),
                              _buildNumberButton('0'),
                              _buildDeleteButton(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: () => _onNumberPressed(number),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          elevation: 0,
        ),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return SizedBox(
      width: 80,
      height: 80,
      child: IconButton(
        onPressed: _onDeletePressed,
        icon: const Icon(
          Icons.backspace_outlined,
          color: Colors.white,
          size: 24,
        ),
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
