import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/cart/data/models/order_model.dart';
import 'package:grocery1/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:grocery1/features/login/data/local/local_data_source.dart';

class CartItemStatic extends StatefulWidget {
  late Ordersummary orderSummary;
  final String title;
  final int id;
  final double price;
  final double? oldPrice;
  final String image;
  int qty;

  CartItemStatic({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.image,
    required this.qty,
  });

  @override
  State<CartItemStatic> createState() => _CartItemStaticState();
}

class _CartItemStaticState extends State<CartItemStatic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///  IMAGE (full width)
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              widget.image,
              width: double.infinity,
              height: 120.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8.h),

          ///  TITLE + DELETE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  context.read<minacartcubit>().deleteItem(widget.id);
                },
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 6.h),

          // PRICE
          Row(
            children: [
              Text(
                "\$${(widget.price * widget.qty).toStringAsFixed(0)}",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(width: 6.w),
              if (widget.oldPrice != null)
                Text(
                  "\$${widget.oldPrice!.toStringAsFixed(0)}",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                    fontSize: 11.sp,
                  ),
                ),
            ],
          ),

          SizedBox(height: 8.h),

          /// 🔥 QTY CONTROL (centered)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _box("-", () {
                if (widget.qty > 1) {
                  widget.qty--;
                  setState(() {});
                }
              }),
              SizedBox(width: 8.w),
              Text("${widget.qty}", style: TextStyle(fontSize: 13.sp)),
              SizedBox(width: 8.w),
              _box("+", () {
                widget.qty++;
                setState(() {});
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _box(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26.w,
        height: 26.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 13.sp),
          ),
        ),
      ),
    );
  }
}
