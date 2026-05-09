import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';

class ProductFavoriteButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isFavorite;

  const ProductFavoriteButton({
    super.key,
    this.onPressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8.h,
      right: 8.w,
      child: Container(
        width: 27.w,
        height: 22.w,
        decoration: BoxDecoration(
          color: ColorManager.colorBg,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.all(4.w),
          constraints: const BoxConstraints(),
          onPressed: onPressed,
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite,
            size: 16.sp,
            color: isFavorite ? ColorManager.red : ColorManager.greyBorder,
          ),
        ),
      ),
    );
  }
}
