import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../domain/entity/products_search_entity.dart';

class ProductNameRow extends StatelessWidget {
  final Product meal;
  const ProductNameRow({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            meal.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: 16.8.sp,
            ).copyWith(
              height: 1.18.h,
              letterSpacing: 0,
            ),
          ),
        ),
        SizedBox(width: 6.w),
      ],
    );
  }
}
