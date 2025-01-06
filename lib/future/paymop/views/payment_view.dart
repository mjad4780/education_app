import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/paymop/logic/paymop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/reponse_body.dart';
import 'mobile_wallet_view.dart';
import 'visa_view.dart';

class PaymentView extends StatelessWidget {
  final VoidCallback onPaymentSuccess;
  final double price;
  final VoidCallback onPaymentError;

  const PaymentView({
    super.key,
    required this.onPaymentSuccess,
    required this.price,
    required this.onPaymentError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PaymopCubit>()..getAuthToken(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor:
              context.read<PaymopCubit>().paymentData.style?.scaffoldColor,
          appBar: _buildAppBar(context),
          body: BlocConsumer<PaymopCubit, PaymopState>(
            listener: (context, state) =>
                listenerButtomConfirmPayment(state, context),
            builder: (context, state) {
              if (state is PaymentAuthLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: context
                            .read<PaymopCubit>()
                            .paymentData
                            .style
                            ?.circleProgressColor ??
                        Colors.blue,
                  ),
                );
              }
              return _buildPaymentOptions(context);
            },
          ),
        );
      }),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:
          context.read<PaymopCubit>().paymentData.style?.appBarBackgroundColor,
      foregroundColor:
          context.read<PaymopCubit>().paymentData.style?.appBarForegroundColor,
      title: const Text('Select Payment Method'),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }

  Widget _buildPaymentOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildPaymentOption(
            context,
            label: 'Pay with Visa',
            icon: Icons.credit_card,
            isSelected: context.read<PaymopCubit>().selectedPaymentMethod ==
                PaymentMethod.visa,
            onTap: () => context
                .read<PaymopCubit>()
                .setPaymentMethod(PaymentMethod.visa),
          ),
          const SizedBox(height: 20),
          _buildPaymentOption(
            context,
            label: 'Pay with Mobile Wallet',
            icon: Icons.phone_android,
            isSelected: context.read<PaymopCubit>().selectedPaymentMethod ==
                PaymentMethod.mobileWallet,
            onTap: () => context
                .read<PaymopCubit>()
                .setPaymentMethod(PaymentMethod.mobileWallet),
          ),
          const SizedBox(height: 30),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: context.read<PaymopCubit>().selectedPaymentMethod ==
                    PaymentMethod.visa
                ? Container()
                : _buildMobileWalletForm(context),
          ),
          const Spacer(),
          _buildConfirmPaymentButton(context),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? context.read<PaymopCubit>().paymentData.style?.primaryColor ??
                    Colors.blue
                : context
                        .read<PaymopCubit>()
                        .paymentData
                        .style
                        ?.unselectedColor ??
                    Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected
                    ? context
                            .read<PaymopCubit>()
                            .paymentData
                            .style
                            ?.primaryColor ??
                        Colors.blue
                    : context
                            .read<PaymopCubit>()
                            .paymentData
                            .style
                            ?.unselectedColor ??
                        Colors.grey),
            const SizedBox(width: 10),
            Text(label,
                style:
                    context.read<PaymopCubit>().paymentData.style?.textStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileWalletForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: context.read<PaymopCubit>().walletMobileNumber,
          keyboardType: TextInputType.number,
          cursorColor:
              context.read<PaymopCubit>().paymentData.style?.primaryColor ??
                  Colors.blue,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.wallet,
                color: context
                        .read<PaymopCubit>()
                        .paymentData
                        .style
                        ?.primaryColor ??
                    Colors.blue),
            hintText: 'Enter your mobile wallet number',
            hintStyle: context.read<PaymopCubit>().paymentData.style?.textStyle,
            border: _inputBorder(),
            focusedBorder: _inputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  OutlineInputBorder _inputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Colors.blue, width: 2),
    );
  }

  Widget _buildConfirmPaymentButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await context.read<PaymopCubit>().getOrderRegistrationId(
                price,
              );
        },
        style: context.read<PaymopCubit>().paymentData.style?.buttonStyle ??
            _defaultButtonStyle(),
        child: const Text('Confirm Payment', style: TextStyle(fontSize: 18)),
      ),
    );
  }

  void listenerButtomConfirmPayment(PaymopState state, BuildContext context) {
    if (state is PaymentRequestSuccess) {
      if (context.read<PaymopCubit>().selectedPaymentMethod ==
          PaymentMethod.mobileWallet) {
        context.read<PaymopCubit>().payWithMobileWallet();
      } else {
        var token = context.read<PaymopCubit>().finalToken;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VisaScreen(
              onError: onPaymentError,
              onFinished: onPaymentSuccess,
              finalToken: token,
            ),
          ),
        );
      }
    } else if (state is PaymentMobileWalletSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MobileWalletScreen(
            onError: onPaymentError,
            onSuccess: onPaymentSuccess,
            redirectUrl: state.redirectUrl,
          ),
        ),
      );
    }
  }

  ButtonStyle _defaultButtonStyle() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }
}
