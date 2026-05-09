import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/home/presentation/cubit/home_cubit.dart';
import 'package:grocery1/features/cart/presentation/screens/showdrawe.dart';
import 'package:grocery1/features/home/presentation/widgets/cart_drawer.dart';
import '../cubit/cart_cubit.dart';
import '../cubit/category_cubit.dart';
import '../cubit/product_search_cubit.dart';
import '../cubit/recommended_cubit.dart';
import '../widgets/categories_section.dart';
import '../widgets/home_body.dart';
import '../widgets/home_bottom_nav.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/product_card.dart';
import '../widgets/recommended_section.dart';
import '../widgets/todays_deals_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()..getTodayDeals()),
        BlocProvider(
            create: (context) =>
                getIt<RecommendedCubit>()..getRecommendedForYou()),
        BlocProvider(
            create: (context) => getIt<CategoryCubit>()..getAllCategory()),
        // BlocProvider(create: (context) => getIt<CartCubit>()),
        BlocProvider(create: (context) => getIt<ProductSearchCubit>()),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.white,
        endDrawer: Showdrawer(),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorManager.primary,
              ));
            }
            if (state is HomeSuccess) return HomeBody(state: state);
            if (state is HomeError)
              return Center(child: Text(state.errorMessage));
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
