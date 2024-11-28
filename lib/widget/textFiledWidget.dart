import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.returncont,
    required this.controller,
    required this.hintText,
  });

  final String returncont;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return returncont;
        }
        return null;
      },
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xfffedf3f5),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 30),
        enabledBorder:UnderlineInputBorder(
          borderRadius: BorderRadius.circular(75),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(75),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
