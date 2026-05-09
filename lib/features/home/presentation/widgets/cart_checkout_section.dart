import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../cubit/cart_cubit.dart';

class CartCheckoutSection extends StatelessWidget {
  final CartState state;
  final CartCubit cubit;

  const CartCheckoutSection(
      {super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          _CartTotal(total: cubit.total),
          SizedBox(height: 12.h),
          _CheckoutButton(isEmpty: state.items.isEmpty),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final double total;

  const _CartTotal({required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$${total.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorManager.primary,
          ),
        ),
      ],
    );
  }
}

class _CheckoutButton extends StatelessWidget {
  final bool isEmpty;

  const _CheckoutButton({required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: isEmpty ? null : () {},
        child: Text(
          'Proceed to Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
