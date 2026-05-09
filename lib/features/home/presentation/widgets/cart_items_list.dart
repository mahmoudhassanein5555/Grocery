// cart_items_list.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';

import '../../../../core/resources/color_manager.dart';
import '../cubit/cart_cubit.dart';
import 'cart_drawer.dart';
import 'cart_item_tile.dart';

class CartItemsList extends StatelessWidget {
  final CartState state;
  final CartCubit cubit;

  const CartItemsList({super.key, required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    if (state.items.isEmpty) {
      return Center(
        child: Text(
          'Your cart is empty',
          style: TextStyle(fontSize: 14.sp, color: ColorManager.grey),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: state.items.length,
      itemBuilder: (context, index) {
        final item = state.items[index];
        return CartItemTile(
          item: item,
          onIncrement: () => cubit.incrementQuantity(item.id),
          onDecrement: () => cubit.decrementQuantity(item.id),
          onRemove: () => cubit.removeFromCart(item.id),
        );
      },
    );
  }
}
