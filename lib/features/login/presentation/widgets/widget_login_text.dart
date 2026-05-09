import 'package:flutter/cupertino.dart';
import 'package:grocery1/core/utils/app_text.dart';

class WidgetLoginText extends StatelessWidget {
  const WidgetLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText.orLoginWith();
  }
}
