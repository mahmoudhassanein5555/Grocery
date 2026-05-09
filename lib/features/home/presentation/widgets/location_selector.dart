import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/app_text.dart';

class LocationSelector extends StatelessWidget {
  const LocationSelector();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165.w,
      height: 28.h,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.lightGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 18,
            color: ColorManager.primary,
          ),
          SizedBox(width: 3.w),
          Expanded(child: AppText.address()),
          Icon(
            Icons.keyboard_arrow_down,
            size: 20.sp,
            color: ColorManager.grey,
          ),
        ],
      ),
    );
  }
}
