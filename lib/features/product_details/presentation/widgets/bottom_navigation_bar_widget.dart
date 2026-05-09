import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';
import 'package:grocery1/features/product_details/presentation/view_model/product_details_cubit.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({super.key, required this.quantity, this.mealId});
  int quantity;
  final int? mealId;
  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.s16,
        vertical: Sizes.s12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.grey),
                    onPressed: () {
                      if (widget.quantity > 1) {
                        setState(() => widget.quantity--);
                      }
                    },
                  ),
                  Text(
                    '${widget.quantity}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: ColorManager.primary),
                    onPressed: () {
                      setState(() => widget.quantity++);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: Sizes.s16),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (widget.mealId != null) {
                    context.read<ProductDetailsCubit>().addToCart(
                          widget.mealId!,
                          widget.quantity,
                        );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Add to cart',
                  style: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: Sizes.s16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
