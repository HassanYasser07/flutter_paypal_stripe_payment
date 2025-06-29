class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel({required this.customerId,required this.amount, required this.currency});
  toJson() => {'customer': customerId,'amount': amount, 'currency': currency};
}