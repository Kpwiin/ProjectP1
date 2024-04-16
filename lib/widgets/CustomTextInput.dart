import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;

  const CustomTextInput({
    Key? key,
    required this.hintText, required bool obscureText, required Function(dynamic value) onSaved, required TextEditingController controller, required TextInputType textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg, // Assuming AppColor is defined
        shape: StadiumBorder(),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.placehodelder, // Assuming AppColor is defined
          ),
          contentPadding: const EdgeInsets.only(left: 40),
        ),
      ),
    );
  }
}