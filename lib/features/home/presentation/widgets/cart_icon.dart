import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class CartIcon extends StatelessWidget {
  const CartIcon();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => Scaffold.of(context).openEndDrawer(),
        child: Stack(
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 24,
              color: ColorManager.black,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 14,
                height: 14,
                decoration: const BoxDecoration(
                  color: ColorManager.primary,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
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
