import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/utils/app_text.dart';
import 'package:grocery1/features/product_details/presentation/view/product_details_screen.dart';
import '../../domain/entity/recommended_meal_entity.dart';
import 'product_card.dart';

class RecommendedSection extends StatelessWidget {
  final List<RecommendedMealEntity> meals;
  const RecommendedSection({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.recommendedForYou(),
        SizedBox(height: 8.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.75,
          ),
          itemCount: meals.length,
          itemBuilder: (context, index) => ProductCard(
              meal: meals[index],
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          ProductDetailsScreen(productId: meals[index].id)))),
        ),
      ],
    );
  }
}
