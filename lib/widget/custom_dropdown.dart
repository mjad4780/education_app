import 'package:education/core/extensions/extention_navigator.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<T> items;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final String hintText;
  final String Function(T) displayItem;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.validator,
    this.hintText = 'Select an option',
    required this.displayItem,
  });

  @override
  Widget build(BuildContext context) {
    return
        // Container(
        //   decoration: BoxDecoration(
        //       color: context.color.white, borderRadius: BorderRadius.circular(18)),
        //   child:
        Padding(
      padding: const EdgeInsets.all(2.0),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          hoverColor: context.color.blue,
          labelText: hintText,
          hintText: hintText,
          border: OutlineInputBorder(
            gapPadding: 2,
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        items: items.map((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(displayItem(value)), // Use displayItem to get the text
          );
        }).toList(),
        onChanged: onChanged,
        validator: validator,
      ),
      // ),
    );
  }
}
