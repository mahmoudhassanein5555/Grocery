import 'package:flutter/cupertino.dart';

import '../../../../core/resources/appassets.dart';

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.rectangle108,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
