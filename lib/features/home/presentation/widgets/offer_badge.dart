import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class OfferBadge extends StatelessWidget {
  final String offerTitle;

  const OfferBadge({required this.offerTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 30.h,
      padding: EdgeInsets.all(7.w),
      decoration: BoxDecoration(
        color: ColorManager.banar,
        borderRadius: BorderRadius.circular(8.r),
      ),
      alignment: Alignment.center,
      child: Text(
        offerTitle,
        style: getMediumStyle(
          color: ColorManager.primary,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
