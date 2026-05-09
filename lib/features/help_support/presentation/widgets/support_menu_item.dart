import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class SupportMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? titleColor;

  const SupportMenuItem(
      {required this.title, required this.onTap, this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 14),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'inter',
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
              onTap: onTap,
              child: Icon(
                Icons.chevron_right,
                color: Colors.black,
              )),
        ]),
      ),
    );
  }
}
