class UploadPromotionTransactionModel {
  final dynamic packageId;
  final dynamic itemId;
  final num amount;
  final String paymentChannel;
  final String status;

  UploadPromotionTransactionModel({
    this.packageId,
    this.itemId,
    required this.amount,
    required this.paymentChannel,
    required this.status,
  });

  factory UploadPromotionTransactionModel.fromJson(Map<String, dynamic> json) {
    return UploadPromotionTransactionModel(
      packageId: json['package_id'],
      itemId: json['item_id'],
      amount: json['amount'] ?? 0,
      paymentChannel: json['payment_channel'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'package_id': packageId,
      'item_id': itemId,
      'amount': amount,
      'payment_channel': paymentChannel,
      'status': status,
    };
  }
}
