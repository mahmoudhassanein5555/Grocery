import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnboardingDotsIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? ColorManager.primary
                : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
