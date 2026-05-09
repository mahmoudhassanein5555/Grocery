// _notification_icon.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.notifications_outlined,
          size: 24,
          color: ColorManager.primary,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: ColorManager.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
