class PaymentIntentModel {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final String? application;
  final int? applicationFeeAmount;
  final AutomaticPaymentMethods automaticPaymentMethods;
  final int? canceledAt;
  final String? cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final String? customer;
  final String? description;
  final String? lastPaymentError;
  final String? latestCharge;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String? nextAction;
  final String? onBehalfOf;
  final String? paymentMethod;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String? processing;
  final String? receiptEmail;
  final String? review;
  final String? setupFutureUsage;
  final String? shipping;
  final String? source;
  final String? statementDescriptor;
  final String? statementDescriptorSuffix;
  final String status;
  final String? transferData;
  final String? transferGroup;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    this.customer,
    this.description,
    this.lastPaymentError,
    this.latestCharge,
    required this.livemode,
    required this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    required this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'],
      object: json['object'],
      amount: json['amount'],
      amountCapturable: json['amount_capturable'],
      amountDetails: AmountDetails.fromJson(json['amount_details']),
      amountReceived: json['amount_received'],
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],
      automaticPaymentMethods:
      AutomaticPaymentMethods.fromJson(json['automatic_payment_methods']),
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method'],
      clientSecret: json['client_secret'],
      confirmationMethod: json['confirmation_method'],
      created: json['created'],
      currency: json['currency'],
      customer: json['customer'],
      description: json['description'],
      lastPaymentError: json['last_payment_error'],
      latestCharge: json['latest_charge'],
      livemode: json['livemode'],
      metadata: Map<String, dynamic>.from(json['metadata']),
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodOptions:
      PaymentMethodOptions.fromJson(json['payment_method_options']),
      paymentMethodTypes:
      List<String>.from(json['payment_method_types'] ?? []),
      processing: json['processing'],
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'],
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
  }
}

class AmountDetails {
  final Map<String, dynamic> tip;

  AmountDetails({required this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: Map<String, dynamic>.from(json['tip']),
    );
  }
}

class AutomaticPaymentMethods {
  final bool enabled;

  AutomaticPaymentMethods({required this.enabled});

  factory AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    return AutomaticPaymentMethods(enabled: json['enabled']);
  }
}

class PaymentMethodOptions {
  final CardOptions card;
  final LinkOptions link;

  PaymentMethodOptions({required this.card, required this.link});

  factory PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    return PaymentMethodOptions(
      card: CardOptions.fromJson(json['card']),
      link: LinkOptions.fromJson(json['link']),
    );
  }
}

class CardOptions {
  final dynamic installments;
  final dynamic mandateOptions;
  final dynamic network;
  final String requestThreeDSecure;

  CardOptions({
    this.installments,
    this.mandateOptions,
    this.network,
    required this.requestThreeDSecure,
  });

  factory CardOptions.fromJson(Map<String, dynamic> json) {
    return CardOptions(
      installments: json['installments'],
      mandateOptions: json['mandate_options'],
      network: json['network'],
      requestThreeDSecure: json['request_three_d_secure'],
    );
  }
}

class LinkOptions {
  final dynamic persistentToken;

  LinkOptions({this.persistentToken});

  factory LinkOptions.fromJson(Map<String, dynamic> json) {
    return LinkOptions(persistentToken: json['persistent_token']);
  }
}
