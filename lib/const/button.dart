import 'package:flutter/material.dart';
import 'package:monkeydosomething/const/colors.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Mybutton({
    super.key,
    required this.text, required Null Function() , required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.orange,borderRadius: BorderRadius.circular(40)
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: AppColor.secondary),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColor.secondary,
            )
          ],
        ),
      ),
    );
  }
}
