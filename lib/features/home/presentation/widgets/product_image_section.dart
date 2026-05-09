import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/products_search_entity.dart';

class ProductImageSection extends StatelessWidget {
  final Product meal;
  const ProductImageSection({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 225.h,
        width: 168.w,
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            meal.imageUrl,
            width: 168.w,
            height: 116.h,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                const Icon(Icons.image_not_supported, size: 60),
          ),
        ),
      ),
    );
  }
}
