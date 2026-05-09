import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../domain/entity/products_search_entity.dart';

class ProductPriceRow extends StatelessWidget {
  final Product meal;
  const ProductPriceRow({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '£${meal.finalPrice.toStringAsFixed(0)}',
          style: getMediumStyle(color: ColorManager.primary, fontSize: 16.sp),
        ),
        if (meal.hasDiscount) ...[
          const SizedBox(width: 6),
          Text(
            '£${meal.price.toStringAsFixed(0)}',
            style: getRegularStyle(
              color: ColorManager.grey,
              fontSize: 14.sp,
            ).copyWith(
              decoration: TextDecoration.lineThrough,
              decorationColor: ColorManager.grey,
            ),
          ),
        ],
      ],
    );
  }
}
