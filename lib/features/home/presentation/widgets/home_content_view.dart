import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/home/presentation/widgets/recommended_section.dart';
import 'package:grocery1/features/home/presentation/widgets/todays_deals_banner.dart';

import '../cubit/category_cubit.dart';
import '../cubit/home_cubit.dart';
import '../cubit/recommended_cubit.dart';
import 'categories_section.dart';
import 'home_search_bar.dart';

class HomeContentView extends StatelessWidget {
  final HomeSuccess state;

  const HomeContentView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeSearchBar(),
          TodayDealsBanner(deals: state.meals),
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, categoryState) {
              if (categoryState is CategoryLoading) {
                return Center(
                    child: const CircularProgressIndicator(
                  color: ColorManager.primary,
                ));
              }
              if (categoryState is CategorySuccess) {
                return CategoriesSection(categories: categoryState.categories);
              }
              return const SizedBox();
            },
          ),
          BlocBuilder<RecommendedCubit, RecommendedState>(
            builder: (context, recommendedState) {
              if (recommendedState is RecommendedLoading) {
                return Center(
                    child: const CircularProgressIndicator(
                        color: ColorManager.primary));
              }
              if (recommendedState is RecommendedSuccess) {
                return RecommendedSection(meals: recommendedState.meals);
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
