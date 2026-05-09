import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../cubit/product_search_cubit.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController controller;

  const SearchInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 354.w,
      height: 42.h,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: ColorManager.search,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: ColorManager.primary, size: 24),
          SizedBox(width: 5.w),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search for any Product',
                hintStyle: getRegularStyle(color: ColorManager.greyBorder),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (value) {
                final cubit = context.read<ProductSearchCubit>();
                if (value.isEmpty) {
                  cubit.clearSearch();
                } else {
                  cubit.getProducts(search: value);
                }
              },
            ),
          ),
          Icon(Icons.qr_code_scanner, size: 24.sp, color: ColorManager.primary),
          const SizedBox(width: 8),
          const Icon(Icons.mic_none, size: 24, color: ColorManager.primary),
        ],
      ),
    );
  }
}
