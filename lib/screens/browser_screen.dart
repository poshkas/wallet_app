import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/app_header.dart';

class BrowserScreen extends StatelessWidget {
  const BrowserScreen({super.key});

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
                      const AppHeader(title: 'Браузер', showBack: false),
                      const SizedBox(height: 24),
                      // Search bar
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Поиск DApps...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Categories
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildCategoryChip(context, 'Все', true),
                            const SizedBox(width: 8),
                            _buildCategoryChip(context, 'DeFi', false),
                            const SizedBox(width: 8),
                            _buildCategoryChip(context, 'NFT', false),
                            const SizedBox(width: 8),
                            _buildCategoryChip(context, 'Games', false),
                            const SizedBox(width: 8),
                            _buildCategoryChip(context, 'Tools', false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Популярные DApps',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // DApps grid
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          _buildDAppCard(context, 'Uniswap', 'DeFi'),
                          _buildDAppCard(context, 'OpenSea', 'NFT'),
                          _buildDAppCard(context, 'Aave', 'DeFi'),
                          _buildDAppCard(context, 'Compound', 'DeFi'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const BottomNav(currentPath: '/browser'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : const Color(0xFF8899A6),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDAppCard(BuildContext context, String name, String category) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  name[0],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


