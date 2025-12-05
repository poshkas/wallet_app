import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_header.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: const AppHeader(title: 'Сканер QR-кода'),
            ),
            Expanded(
              child: Center(
                child: Card(
                  margin: const EdgeInsets.all(24),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 256,
                          height: 256,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).colorScheme.primary,
                                      width: 4,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Наведите камеру на QR-код',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8899A6),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // In real app, would open camera
                              context.go('/send');
                            },
                            child: const Text('Начать сканирование'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


