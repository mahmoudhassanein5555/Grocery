import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:grocery1/features/cart/presentation/cubit/cart_state.dart';
import 'package:grocery1/features/cart/presentation/screens/buttomstatic.dart';
import 'package:grocery1/features/cart/presentation/screens/static.dart';

class Showdrawer extends StatefulWidget {
  const Showdrawer({super.key});

  @override
  State<Showdrawer> createState() => _ShowdrawerState();
}

class _ShowdrawerState extends State<Showdrawer> {
  @override
  void initState() {
    super.initState();
    context.read<minacartcubit>().fetchcart();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.sizeOf(context).width * 0.85.w,
      child: BlocBuilder<minacartcubit, minacartstate>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: Text('Loading...'));
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else if (state is CartLoaded) {
            final data = state.data;

            return Column(
              children: [
                SizedBox(height: 20.h),

                /// 🔥 TITLE
                Container(
                  height: 60.h,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Center(
                    child: Text(
                      "Shopping Cart",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                /// 🔥 EMPTY
                if (data.items.isEmpty)
                  const Expanded(
                    child: Center(
                        child: Text(
                            style: TextStyle(color: Colors.grey),
                            "Your Cart is empty")),
                  )

                /// 🔥 LIST
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.items.length,
                      padding: EdgeInsets.all(12.w),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartItemStatic(
                          id: data.items[index].id,
                          title:
                              '${data.items[index].meal.title} (${data.items[index].meal.size!})',
                          price: data.items[index].meal.price!,
                          image: data.items[index].meal.imageUrl!,
                          qty: data.items[index].quantity!,
                        );
                      },
                    ),
                  ),

                /// 🔥 TOTAL
                CartBottomBarStatic(
                  data: data,
                  totalPrice: data.total.toInt(),
                  isEmpty: data.items.isEmpty,
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
