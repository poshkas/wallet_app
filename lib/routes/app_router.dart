import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/activity_screen.dart';
import '../screens/browser_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/greeting_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/send_screen.dart';
import '../screens/receive_screen.dart';
import '../screens/scan_screen.dart';
import '../screens/coin_detail_screen.dart';
import '../screens/coin_list_screen.dart';
import '../screens/buy_screen.dart';
import '../screens/sell_screen.dart';
import '../screens/swap_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/new_wallet/pin_code_screen.dart';
import '../screens/new_wallet/secret_key_screen.dart';
import '../screens/new_wallet/fingerprint_screen.dart';
import '../screens/connect_wallet_screen.dart';
import '../screens/add_wallet_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/greeting',
      builder: (context, state) => const GreetingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/activity',
      builder: (context, state) => ActivityScreen(),
    ),
    GoRoute(
      path: '/browser',
      builder: (context, state) => const BrowserScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/send',
      builder: (context, state) => const SendScreen(),
    ),
    GoRoute(
      path: '/receive',
      builder: (context, state) => const ReceiveScreen(),
    ),
    GoRoute(
      path: '/scan',
      builder: (context, state) => const ScanScreen(),
    ),
    GoRoute(
      path: '/coin',
      builder: (context, state) => const CoinListScreen(),
      routes: [
        GoRoute(
          path: ':symbol',
          builder: (context, state) {
            final symbol = state.pathParameters['symbol'] ?? 'toc';
            return CoinDetailScreen(symbol: symbol);
          },
          routes: [
            GoRoute(
              path: 'buy',
              builder: (context, state) {
                final symbol = state.pathParameters['symbol'] ?? 'toc';
                return BuyScreen(symbol: symbol);
              },
            ),
            GoRoute(
              path: 'sell',
              builder: (context, state) {
                final symbol = state.pathParameters['symbol'] ?? 'toc';
                return SellScreen(symbol: symbol);
              },
            ),
            GoRoute(
              path: 'swap',
              builder: (context, state) {
                final symbol = state.pathParameters['symbol'] ?? 'toc';
                return SwapScreen(symbol: symbol);
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/new-wallet',
      redirect: (context, state) => '/new-wallet/pin-code',
      routes: [
        GoRoute(
          path: 'pin-code',
          builder: (context, state) => const PinCodeScreen(),
        ),
        GoRoute(
          path: 'secret-key',
          builder: (context, state) => const SecretKeyScreen(),
        ),
        GoRoute(
          path: 'fingerprint',
          builder: (context, state) => const FingerprintScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/connect-wallet',
      builder: (context, state) => const ConnectWalletScreen(),
    ),
    GoRoute(
      path: '/add-wallet',
      builder: (context, state) => const AddWalletScreen(),
    ),
  ],
);

