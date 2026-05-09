import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class CustomSwitchWidget extends StatefulWidget {
  final bool isDark;
  final ValueChanged<bool>? onChanged;

  const CustomSwitchWidget({
    super.key,
    required this.isDark,
    this.onChanged,
  });

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  late bool _isDark;

  @override
  void initState() {
    super.initState();
    _isDark = widget.isDark;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDark = !_isDark;
        });
        widget.onChanged?.call(_isDark);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 52,
        height: 23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _isDark ? ColorManager.primary : Colors.grey.shade400,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: _isDark ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(2),
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
