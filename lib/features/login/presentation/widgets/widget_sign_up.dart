import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/utils/app_text.dart';
import 'package:grocery1/features/signup/presentation/ui/auth/register_screen.dart';

class WidgetSignUp extends StatelessWidget {
  const WidgetSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.dontHaveAccount(),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ));
          },
          child: AppText.signUp(),
        ),
      ],
    );
  }
}
