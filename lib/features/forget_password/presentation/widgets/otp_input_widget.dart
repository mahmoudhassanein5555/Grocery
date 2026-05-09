import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/resources/color_manager.dart';

class OtpInputWidget extends StatefulWidget {
  const OtpInputWidget({super.key, required this.onCompleted});
  final Function(String) onCompleted;
  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  //onChanged

  void onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
        final otp = controllers.map((c) => c.text).join();
        widget.onCompleted(otp);
      }
    } else {
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    for (int index = 0; index < 4; index++) {
      focusNodes[index].addListener(() {
        if (controllers[index].text.isEmpty && !focusNodes[index].hasFocus) {
          if (index > 0) focusNodes[index - 1].requestFocus();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 43.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              4,
              (index) => SizedBox(
                    width: 54,
                    height: 60,
                    child: TextFormField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onChanged: (value) => onChanged(value, index),
                      onTapOutside: (_) => focusNodes[index].unfocus(),
                      decoration: InputDecoration(
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: controllers[index].text.isNotEmpty
                                      ? ColorManager.primary
                                      : Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: controllers[index].text.isNotEmpty
                                      ? Colors.grey
                                      : ColorManager.primary))),
                    ),
                  ))),
    );
  }
}
