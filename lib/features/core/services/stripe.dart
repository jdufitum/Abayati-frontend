import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<String?> createPayment() async {
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
          params: const PaymentMethodParams.card(
              paymentMethodData: PaymentMethodData()));
      return paymentMethod.id;
    } catch (e) {
      rethrow;
    }
  }
}
