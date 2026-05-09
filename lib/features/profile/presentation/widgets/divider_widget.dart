import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
        height: 1, indent: 0, endIndent: 0, color: ColorManager.grey);
  }
}
