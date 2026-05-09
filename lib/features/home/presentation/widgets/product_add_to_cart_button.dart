import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/app_text.dart';
import '../cubit/cart_cubit.dart';

class ProductAddToCartButton extends StatelessWidget {
  final CartItem item;

  const ProductAddToCartButton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 156.w,
      height: 32.h,
      child: ElevatedButton(
        onPressed: () {
          context.read<CartCubit>().addToCart(item);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${item.name} added to cart'),
              duration: const Duration(seconds: 1),
              backgroundColor: ColorManager.primary,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.r),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: AppText.addToCart(),
      ),
    );
  }
}
