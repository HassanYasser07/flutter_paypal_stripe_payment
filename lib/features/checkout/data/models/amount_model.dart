class PaymentAmount {
  final String total;
  final String currency;
  final PaymentDetails details;

  PaymentAmount({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory PaymentAmount.fromJson(Map<String, dynamic> json) {
    return PaymentAmount(
      total: json['total'] as String,
      currency: json['currency'] as String,
      details: PaymentDetails.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'currency': currency,
      'details': details.toJson(),
    };
  }
}

class PaymentDetails {
  final String subtotal;
  final String shipping;
  final int shippingDiscount;

  PaymentDetails({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      subtotal: json['subtotal'] as String,
      shipping: json['shipping'] as String,
      shippingDiscount: json['shipping_discount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
