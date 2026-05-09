import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/resources/values_manager.dart';

class DetailCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? expiryDateStr;
  const DetailCardWidget({
    super.key,
    required this.title,
    required this.value,
    this.expiryDateStr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.s12,
        horizontal: Sizes.s8,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border.all(color: ColorManager.grey),
        borderRadius: BorderRadius.circular(Insets.s12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: getBoldStyle(
              color: ColorManager.primary,
              fontSize: Sizes.s14,
            ),
          ),
          const SizedBox(height: Sizes.s4),
          Text(
            textAlign: TextAlign.center,
            value,
            style: getRegularStyle(color: Colors.grey, fontSize: Sizes.s14),
          ),
        ],
      ),
    );
  }
}
