import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../widget/custom_dropdown.dart';
import '../logic/cubit/sign_up_cubit.dart';

class CustomPhoneAndGender extends StatelessWidget {
  const CustomPhoneAndGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: context.color.white,
                borderRadius: BorderRadius.circular(15)),
            child: IntlPhoneField(
              controller: context.read<SignUpCubit>().phone,
              disableLengthCheck: true,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              initialCountryCode: 'EG',
              onChanged: (phone) {},
            )),
        const SizedBox(height: 16),
        // Gender Field
        CustomDropdown(
          displayItem: (value) {
            return value;
          },
          onChanged: (value) => context.read<SignUpCubit>().gender = value,
          items: const ['Male', 'Femle'],
          hintText: 'Gender',
        ),
      ],
    );
  }
}
