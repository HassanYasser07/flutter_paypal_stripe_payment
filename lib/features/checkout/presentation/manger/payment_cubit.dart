import 'dart:nativewrappers/_internal/vm/lib/developer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:flutter_paypal_stripe_payment/features/checkout/data/repos/checkot_repo.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
          (l) => emit(PaymentFailure(errorMessage: l.message)),
        (r)=>emit(PaymentSuccess())


    );
  }
  @override
 void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
