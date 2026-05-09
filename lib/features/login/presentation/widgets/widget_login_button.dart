import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/utils/app_text.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class WidgetLoginButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isloading;
  const WidgetLoginButton({super.key, this.onTap, required this.isloading});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 358.w,
          height: 50.h,
          child: CustomElevatedButton(
            isStadiumBorder: false,
            radius: 8.r,
            backgroundColor: ColorManager.primary,
            onTap: onTap,
            child: isloading
                ? SizedBox(
                    height: 50.h,
                    child: CircularProgressIndicator(color: ColorManager.white),
                  )
                : AppText.login(),
          ),
        ),
      ],
    );
  }
}
