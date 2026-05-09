import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';
import 'package:grocery1/features/home/presentation/widgets/product_add_to_cart_button.dart';
import 'package:grocery1/features/home/presentation/widgets/product_name_row.dart';
import 'package:grocery1/features/home/presentation/widgets/product_price_row.dart';
import 'package:grocery1/features/home/presentation/widgets/product_stars_row.dart';
import '../../domain/entity/products_search_entity.dart';
import '../cubit/cart_cubit.dart';

class ProductDetailsSection extends StatelessWidget {
  final Product meal;
  const ProductDetailsSection({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameRow(meal: meal),
          const SizedBox(height: 4),
          ProductStarsRow(rating: meal.rating, ratingCount: meal.ratingCount),
          const SizedBox(height: 6),
          ProductPriceRow(meal: meal),
          const SizedBox(height: 8),
          ProductAddToCartButton(
            item: CartItem(
              id: meal.id.toString(),
              name: meal.title,
              price: meal.finalPrice,
              image: meal.imageUrl,
            ),
          ),
        ],
      ),
    );
  }
}
