import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/utils/app_text.dart';

import 'cart_icon.dart';
import 'location_selector.dart';
import 'notification_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: ColorManager.appbarBackground,
      child: Row(
        children: [
          Image.asset(AppAssets.vector1, width: 30.w, height: 34.h),
          SizedBox(width: 14.w),
          const NotificationIcon(),
          const SizedBox(width: 8),
          const Expanded(child: LocationSelector()),
          SizedBox(width: 20.w),
          const CartIcon(),
        ],
      ),
    );
  }
}
