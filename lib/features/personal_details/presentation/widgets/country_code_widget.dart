import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';

class CountryCodeWidget extends StatelessWidget {
  final String selectedCode;
  final ValueChanged<String> onChanged;

  const CountryCodeWidget({
    super.key,
    required this.selectedCode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: ColorManager.appbarBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Country',
            style: TextStyle(
                fontSize: 12,
                color: ColorManager.primary,
                fontWeight: FontWeight.w300,
                fontFamily: 'inter'),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCode,
              isDense: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.black),
              items: const [
                DropdownMenuItem(value: '+20', child: Text('+20')),
                DropdownMenuItem(value: '+1', child: Text('+1')),
                DropdownMenuItem(value: '+44', child: Text('+44')),
              ],
              onChanged: (value) {
                if (value != null) onChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
