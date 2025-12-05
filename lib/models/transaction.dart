class Transaction {
  final String type; // 'send', 'receive', 'swap'
  final String title;
  final String amount;
  final String coin;
  final String? address;
  final String time;
  final String status; // 'completed', 'pending'

  Transaction({
    required this.type,
    required this.title,
    required this.amount,
    required this.coin,
    this.address,
    required this.time,
    required this.status,
  });
}


