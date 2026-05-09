import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductStarsRow extends StatelessWidget {
  final double rating;
  final int ratingCount;
  const ProductStarsRow({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
            5,
            (i) => Icon(
                  i < rating.floor() ? Icons.star : Icons.star,
                  size: 12,
                  color: ColorManager.orange,
                )),
        SizedBox(width: 2.w),
        Text(
          '($ratingCount)',
          style: getMediumStyle(color: ColorManager.grey, fontSize: 10.sp),
        ),
      ],
    );
  }
}
