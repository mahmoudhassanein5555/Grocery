import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/cart/data/models/checkout_model.dart';
import 'package:grocery1/features/cart/data/models/data.dart';
import 'package:grocery1/features/cart/presentation/screens/checkoutscreen.dart';

class CartBottomBarStatic extends StatelessWidget {
  final int totalPrice;
  final bool isEmpty;
  final Data_ data;
  const CartBottomBarStatic(
      {required this.data,
      required this.isEmpty,
      required this.totalPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🔥 TOTAL ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${totalPrice}",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          /// 🔥 BUTTON FULL WIDTH
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: isEmpty
                  ? null
                  : () {
                      final items = data.items.map((e) {
                        return CheckoutItem(
                          name: e.meal.title ?? '',
                          total: e.meal.price! * e.quantity!,
                        );
                      }).toList();

                      final total = data.total;

                      Navigator.pushNamed(
                        context,
                        Checkoutscreen.routeName,
                        arguments: {
                          "items": items,
                          "total": total,
                        },
                      );
                    },
              child: Container(
                decoration: BoxDecoration(
                  color: isEmpty ? Colors.grey : ColorManager.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: MediaQuery.sizeOf(context).height * 0.06,
                // color: ColorManager.primary,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Continue to checkout",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
