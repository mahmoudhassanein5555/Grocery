import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:grocery1/core/utils/app_text.dart';
import 'package:grocery1/features/product_details/presentation/view/product_details_screen.dart';

import '../../domain/entity/meal_entity.dart';
import 'deal_banner_item.dart';

class TodayDealsBanner extends StatelessWidget {
  final List<MealEntity> deals;

  const TodayDealsBanner({super.key, required this.deals});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.todaysDeals(),
        SizedBox(height: 12.h),
        CarouselSlider(
          options: CarouselOptions(
            height: 142.h,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.99,
          ),
          items: deals
              .map((meal) => DealBannerItem(
                  meal: meal,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailsScreen(productId: meal.id)))))
              .toList(),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
