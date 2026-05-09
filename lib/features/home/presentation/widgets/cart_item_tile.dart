import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../cubit/cart_cubit.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const CartItemTile({
    super.key,
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: ColorManager.appbarBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.lightGrey),
      ),
      child: Row(
        children: [
          _CartItemImage(image: item.image),
          SizedBox(width: 10.w),
          Expanded(child: _CartItemInfo(name: item.name, price: item.price)),
          _CartItemQuantityControl(
            quantity: item.quantity,
            onIncrement: onIncrement,
            onDecrement: onDecrement,
          ),
        ],
      ),
    );
  }
}

class _CartItemImage extends StatelessWidget {
  final String image;

  const _CartItemImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        image,
        width: 60.w,
        height: 60.h,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 60.w,
          height: 60.h,
          color: ColorManager.lightGrey,
          child: const Icon(Icons.image_outlined, color: Colors.grey),
        ),
      ),
    );
  }
}

class _CartItemInfo extends StatelessWidget {
  final String name;
  final double price;

  const _CartItemInfo({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 4.h),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 13.sp,
            color: ColorManager.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _CartItemQuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _CartItemQuantityControl({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            width: 26.w,
            height: 26.h,
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.lightGrey),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.remove, size: 14),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text('$quantity', style: TextStyle(fontSize: 13.sp)),
        ),
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            width: 26.w,
            height: 26.h,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.add, size: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
