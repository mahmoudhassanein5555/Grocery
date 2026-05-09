import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/home/presentation/widgets/product_details_section.dart';
import 'package:grocery1/features/home/presentation/widgets/product_favorite_button.dart';
import 'package:grocery1/features/home/presentation/widgets/product_image_section.dart';
import '../../domain/entity/products_search_entity.dart';

class ProductCard extends StatelessWidget {
  final Product meal;
  final VoidCallback? onTap;
  const ProductCard({super.key, required this.meal, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ProductImageSection(meal: meal),
            ProductFavoriteButton(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ProductDetailsSection(meal: meal),
            ),
          ],
        ),
      ),
    );
  }
}
