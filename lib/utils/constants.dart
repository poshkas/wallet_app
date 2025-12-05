class AppConstants {
  // Wallet address
  static const String walletAddress = "0x7a9f3b2c8d1e4f5a6b7c8d9e0f1a2b3c4d5e6f7a";
  
  // App version
  static const String appVersion = "1.0.0";
  
  // Default tokens
  static List<Map<String, dynamic>> defaultTokens = [
    {
      "name": "TOCcoin",
      "symbol": "TOC",
      "balance": "1,234.56",
      "value": "\$45,678.90",
      "change": "+12.5%",
      "logo": "assets/logos/coin.svg",
      "positive": true,
    },
    {
      "name": "Bitcoin",
      "symbol": "BTC",
      "balance": "0.0234",
      "value": "\$1,234.56",
      "change": "-2.3%",
      "logo": "assets/logos/coin.svg",
      "positive": false,
    },
    {
      "name": "Ethereum",
      "symbol": "ETH",
      "balance": "1.5678",
      "value": "\$2,345.67",
      "change": "+5.2%",
      "logo": "assets/logos/coin.svg",
      "positive": true,
    },
  ];
}


