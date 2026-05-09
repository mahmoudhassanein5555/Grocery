import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Login with email",
      style: getBoldStyle(color: ColorManager.black, fontSize: 25.sp),
    );
  }
}
