import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;

  const ProfileMenuItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: ListTile(
          leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey.shade200),
              child: Icon(
                icon,
                color: ColorManager.primary,
                size: 24,
              )),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'inter',
              color: titleColor ?? ColorManager.primary,
            ),
          ),
          trailing: titleColor != null
              ? null
              : Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade300,
                ),
          onTap: onTap,
        ),
      ),
    );
  }
}
