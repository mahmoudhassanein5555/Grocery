import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';

class ForgotPasswordToggle extends StatelessWidget {
  const ForgotPasswordToggle(
      {super.key, required this.isEmail, required this.onToggle});

  final bool isEmail;
  final Function(bool) onToggle;
  @override
  Widget build(BuildContext context) {
    return Container(
        //  margin: EdgeInsets.symmetric(horizontal: 10),
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onToggle(true),
                  child: Container(
                    height: 43,
                    decoration: BoxDecoration(
                        color: isEmail ? ColorManager.primary : Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      "By Email",
                      style: TextStyle(
                          fontSize: 14,
                          color: isEmail ? Colors.white : Colors.black),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onToggle(false),
                  child: Container(
                    height: 43,
                    decoration: BoxDecoration(
                        color: isEmail ? Colors.white : ColorManager.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      "By Phone Number",
                      style: TextStyle(
                          fontSize: 14,
                          color: isEmail ? Colors.black : Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
