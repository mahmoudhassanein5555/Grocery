import 'package:flutter/material.dart';

import '../../../../core/utils/app_text.dart';

class WidgetForgotPassword extends StatelessWidget {
  const WidgetForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Navigator.pushNamed(context, Routes.forgotPassword);
        },
        child: AppText.forgotPassword(),
      ),
    );
  }
}
