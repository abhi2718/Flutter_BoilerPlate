import 'package:flutter/material.dart';
import '../res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPress,
      child: Container(
        width: 200,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.roundButtonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppColor.whiteColor,
                )
              : Text(
                  title,
                  style: const TextStyle(color: AppColor.whiteColor),
                ),
        ),
      ),
    );
  }
}
