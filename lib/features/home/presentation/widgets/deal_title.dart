import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class DealTitle extends StatelessWidget {
  final String title;

  const DealTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getSemiBoldStyle(
        color: ColorManager.appbarBackground,
        fontSize: 18.sp,
      ).copyWith(
        height: 1.0,
        letterSpacing: 0,
      ),
    );
  }
}
