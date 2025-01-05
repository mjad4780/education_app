// payment_cubit.dart
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:education/core/get_it/get_it.dart';
// import 'package:education/services/dio_helper.dart';
// import 'payment_data.dart';

// enum PaymentMethod { Visa, MobileWallet }

// class PaymentCubit extends Cubit<PaymentState> {
//   final PaymentData paymentData;
//   final double price;

//   PaymentCubit({required this.paymentData, required this.price})
//       : super(PaymentInitial());

//   PaymentMethod _selectedPaymentMethod = PaymentMethod.Visa;
//   String redirectUrl = "";
//   String paymentFirstToken = '';
//   String paymentOrderId = '';
//   String finalToken = '';
//   final TextEditingController walletMobileNumber = TextEditingController();

//   void setPaymentMethod(PaymentMethod method) {
//     _selectedPaymentMethod = method;
//     emit(PaymentMethodChanged(method));
//   }

//   Future<void> getAuthToken() async {
//     emit(PaymentLoading());
//     try {
//       final response = await getIt<DioHelper>().postData(
//         url: 'https://accept.paymob.com/api/auth/tokens',
//         data: {
//           "api_key": paymentData.apiKey,
//         },
//       );
//       paymentFirstToken = response.data['token'];
//       emit(PaymentAuthSuccess());
//     } catch (error) {
//       emit(PaymentAuthFailure(error.toString()));
//     }
//   }

//   Future<void> getOrderRegistrationId() async {
//     emit(PaymentLoading());
//     try {
//       final response = await getIt<DioHelper>().postData(
//         url: 'https://accept.paymob.com/api/ecommerce/orders',
//         data: {
//           "auth_token": paymentFirstToken,
//           "delivery_needed": "false",
//           "amount_cents": (price * 100).toString(),
//           "currency": "EGP",
//           "items": [],
//         },
//       );
//       paymentOrderId = response.data['id'].toString();
//       await getPaymentRequest();
//       emit(PaymentOrderSuccess());
//     } catch (error) {
//       emit(PaymentOrderFailure(error.toString()));
//     }
//   }

//   Future<void> getPaymentRequest() async {
//     emit(PaymentLoading());
//     final requestData = {
//       "auth_token": paymentFirstToken,
//       "amount_cents": (price * 100).toString(),
//       "expiration": 3600,
//       "order_id": paymentOrderId,
//       "billing_data": {
//         "apartment": "NA",
//         "email": paymentData.userData?.email ?? 'NA',
//         "floor": "NA",
//         "first_name": paymentData.userData?.name ?? 'NA',
//         "street": "NA",
//         "building": "NA",
//         "phone_number": paymentData.userData?.phone ?? 'NA',
//         "shipping_method": "NA",
//         "postal_code": "NA",
//         "city": "NA",
//         "country": "NA",
//         "last_name": paymentData.userData?.lastName ?? 'NA',
//         "state": "NA",
//       },
//       "currency": "EGP",
//       "integration_id": _selectedPaymentMethod == PaymentMethod.Visa
//           ? paymentData.integrationCardId
//           : paymentData.integrationMobileWalletId,
//       "lock_order_when_paid": "false",
//     };

//     try {
//       final response = await getIt<DioHelper>().postData(
//         url: 'https://accept.paymob.com/api/acceptance/payment_keys',
//         data: requestData,
//       );
//       finalToken = response.data['token'];
//       emit(PaymentRequestSuccess());
//     } catch (error) {
//       emit(PaymentRequestFailure(error.toString()));
//     }
//   }

//   Future<void> payWithMobileWallet() async {
//     emit(PaymentLoading());
//     final paymentData = {
//       "source": {
//         "identifier": walletMobileNumber.text,
//         "subtype": "WALLET",
//       },
//       "payment_token": finalToken,
//     };

//     try {
//       final response = await getIt<DioHelper>().postData(
//         url: 'https://accept.paymob.com/api/acceptance/payments/pay',
//         data: paymentData,
//       );

//       if (response.data.containsKey('redirect_url')) {
//         redirectUrl = response.data['redirect_url'].toString();
//         emit(PaymentMobileWalletSuccess(redirectUrl));
//       } else {
//         emit(PaymentMobileWalletFailure("No redirect URL found"));
//       }
//     } catch (error) {
//       emit(PaymentMobileWalletFailure(error.toString()));
//     }
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////////
// payment_state.dart
// part of 'payment_cubit.dart';

// abstract class PaymentState {}

// class PaymentInitial extends PaymentState {}

// class PaymentLoading extends PaymentState {}

// class PaymentMethodChanged extends PaymentState {
//   final PaymentMethod method;
//   PaymentMethodChanged(this.method);
// }

// class PaymentAuthSuccess extends PaymentState {}

// class PaymentAuthFailure extends PaymentState {
//   final String error;
//   PaymentAuthFailure(this.error);
// }

// class PaymentOrderSuccess extends PaymentState {}

// class PaymentOrderFailure extends PaymentState {
//   final String error;
//   PaymentOrderFailure(this.error);
// }

// class PaymentRequestSuccess extends PaymentState {}

// class PaymentRequestFailure extends PaymentState {
//   final String error;
//   PaymentRequestFailure(this.error);
// }

// class PaymentMobileWalletSuccess extends PaymentState {
//   final String redirectUrl;
//   PaymentMobileWalletSuccess(this.redirectUrl);
// }

// class PaymentMobileWalletFailure extends PaymentState {
//   final String error;
//   PaymentMobileWalletFailure(this.error);
// }



/////////////////////////////////////////////////////////////////////
// payment_view.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'payment_cubit.dart';
// import 'payment_data.dart';
// import 'mobile_wallet_view.dart';
// import 'visa_view.dart';

// class PaymentView extends StatelessWidget {
//   final VoidCallback onPaymentSuccess;
//   final double price;
//   final VoidCallback onPaymentError;
//   final PaymentData paymentData;

//   const PaymentView({
//     Key? key,
//     required this.onPaymentSuccess,
//     required this.price,
//     required this.onPaymentError,
//     required this.paymentData,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => PaymentCubit(paymentData: paymentData, price: price)
//         ..getAuthToken(),
//       child: Scaffold(
//         backgroundColor: paymentData.style?.scaffoldColor,
//         appBar: _buildAppBar(context),
//         body: BlocBuilder<PaymentCubit, PaymentState>(
//           builder: (context, state) {
//             if (state is PaymentLoading) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: paymentData.style?.circleProgressColor ?? Colors.blue,
//                 ),
//               );
//             }
//             return _buildPaymentOptions(context);
//           },
//         ),
//       ),
//     );
//   }

//   AppBar _buildAppBar(BuildContext context) {
//     return AppBar(
//       backgroundColor: paymentData.style?.appBarBackgroundColor,
//       foregroundColor: paymentData.style?.appBarForegroundColor,
//       title: const Text('Select Payment Method'),
//       leading: IconButton(
//         onPressed: () => Navigator.pop(context),
//         icon: const Icon(Icons.arrow_back_ios_new_outlined),
//       ),
//     );
//   }

//   Widget _buildPaymentOptions(BuildContext context) {
//     final cubit = context.read<PaymentCubit>();
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 20),
//           _buildPaymentOption(
//             context,
//             label: 'Pay with Visa',
//             icon: Icons.credit_card,
//             isSelected: cubit._selectedPaymentMethod == PaymentMethod.Visa,
//             onTap: () => cubit.setPaymentMethod(PaymentMethod.Visa),
//           ),
//           const SizedBox(height: 20),
//           _buildPaymentOption(
//             context,
//             label: 'Pay with Mobile Wallet',
//             icon: Icons.phone_android,
//             isSelected: cubit._selectedPaymentMethod == PaymentMethod.MobileWallet,
//             onTap: () => cubit.setPaymentMethod(PaymentMethod.MobileWallet),
//           ),
//           const SizedBox(height: 30),
//           AnimatedSize(
//             duration: const Duration(milliseconds: 250),
//             child: cubit._selectedPaymentMethod == PaymentMethod.Visa
//                 ? Container()
//                 : _buildMobileWalletForm(context),
//           ),
//           const Spacer(),
//           _buildConfirmPaymentButton(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption(
//     BuildContext context, {
//     required String label,
//     required IconData icon,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     final cubit = context.read<PaymentCubit>();
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected
//                 ? paymentData.style?.primaryColor ?? Colors.blue
//                 : paymentData.style?.unselectedColor ?? Colors.grey,
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           children: [
//             Icon(icon,
//                 color: isSelected
//                     ? paymentData.style?.primaryColor ?? Colors.blue
//                     : paymentData.style?.unselectedColor ?? Colors.grey),
//             const SizedBox(width: 10),
//             Text(label, style: paymentData.style?.textStyle),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileWalletForm(BuildContext context) {
//     final cubit = context.read<PaymentCubit>();
//     return Column(
//       children: [
//         TextFormField(
//           controller: cubit.walletMobileNumber,
//           keyboardType: TextInputType.number,
//           cursorColor: paymentData.style?.primaryColor ?? Colors.blue,
//           decoration: InputDecoration(
//             prefixIcon: Icon(Icons.wallet,
//                 color: paymentData.style?.primaryColor ?? Colors.blue),
//             hintText: 'Enter your mobile wallet number',
//             hintStyle: paymentData.style?.textStyle,
//             border: _inputBorder(),
//             focusedBorder: _inputBorder(),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }

//   OutlineInputBorder _inputBorder() {
//     return OutlineInputBorder(
//       borderRadius: const BorderRadius.all(Radius.circular(16)),
//       borderSide: BorderSide(
//           color: paymentData.style?.primaryColor ?? Colors.blue, width: 2),
//     );
//   }

//   Widget _buildConfirmPaymentButton(BuildContext context) {
//     final cubit = context.read<PaymentCubit>();
//     return Center(
//       child: ElevatedButton(
//         onPressed: () async {
//           await cubit.getOrderRegistrationId();
//           if (cubit._selectedPaymentMethod == PaymentMethod.Visa) {
//             onPaymentSuccess();
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => VisaScreen(
//                   onError: onPaymentError,
//                   onFinished: onPaymentSuccess,
//                   finalToken: cubit.finalToken,
//                   iframeId: paymentData.iframeId,
//                 ),
//               ),
//             );
//           } else {
//             await cubit.payWithMobileWallet();
//             if (cubit.redirectUrl.isNotEmpty) {
//               onPaymentSuccess();
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MobileWalletScreen(
//                     onError: onPaymentError,
//                     onSuccess: onPaymentSuccess,
//                     redirectUrl: cubit.redirectUrl,
//                   ),
//                 ),
//               );
//             }
//           }
//         },
//         style: paymentData.style?.buttonStyle ?? _defaultButtonStyle(),
//         child: const Text('Confirm Payment', style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }

//   ButtonStyle _defaultButtonStyle() {
//     return ElevatedButton.styleFrom(
//       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       backgroundColor: Colors.blue,
//       foregroundColor: Colors.white,
//     );
//   }
// }