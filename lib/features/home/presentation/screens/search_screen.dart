import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/string_constants.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/features/home/presentation/cubit/product_search_cubit.dart';
import 'package:grocery1/features/home/presentation/widgets/home_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductSearchCubit>(
      create: (_) => getIt<ProductSearchCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.black,
              size: 20.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            StringConstants.searchTitle,
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: 18.sp,
              fontFamily: FontConstants.interFontFamily,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: const SafeArea(
            child: HomeSearchBar(),
          ),
        ),
      ),
    );
  }
}
