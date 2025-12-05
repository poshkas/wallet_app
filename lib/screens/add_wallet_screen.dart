import 'package:flutter/material.dart';

class AddWalletScreen extends StatelessWidget {
  const AddWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подключить кошелёк'),
      ),
      body: const Center(
        child: Text('Add Wallet Screen'),
      ),
    );
  }
}


