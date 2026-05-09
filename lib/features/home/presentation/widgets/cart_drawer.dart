import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';
import '../../../../core/resources/color_manager.dart';
import '../cubit/cart_cubit.dart';
import 'cart_checkout_section.dart';
import 'cart_drawer_header.dart';
import 'cart_items_list.dart';

class CartDrawer extends StatelessWidget {
  const CartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = context.read<CartCubit>();
        return Drawer(
          width: 0.85.sw,
          child: SafeArea(
            child: Column(
              children: [
                CartDrawerHeader(totalItems: state.totalItems),
                const Divider(height: 1),
                Expanded(child: CartItemsList(state: state, cubit: cubit)),
                const Divider(height: 1),
                CartCheckoutSection(state: state, cubit: cubit),
              ],
            ),
          ),
        );
      },
    );
  }
}
