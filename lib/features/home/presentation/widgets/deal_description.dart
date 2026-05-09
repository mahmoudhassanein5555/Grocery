import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class DealDescription extends StatelessWidget {
  final String description;

  const DealDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: getMediumStyle(
        color: ColorManager.appbarBackground,
        fontSize: 12.sp,
      ).copyWith(
        height: 1.18,
        letterSpacing: 0,
      ),
    );
  }
}
