import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      cursorColor: Colors.blue,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black38,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black38,
          ),
          filled: true,
          fillColor: const Color(0xff6C6B6B).withOpacity(.1),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red,
          ))),
    );
  }
}
