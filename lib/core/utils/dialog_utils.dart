import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: getMediumStyle(color: ColorManager.primary),
                  ),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      String? posActionName,
      Function? posAction,
      String? negActionName,
      Function? negAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            // if(posAction != null){
            //   posAction.call();
            // }
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: getMediumStyle(color: ColorManager.primary),
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName,
              style: getMediumStyle(color: ColorManager.primary))));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              message,
              style: getMediumStyle(color: ColorManager.primary),
            ),
            title: Text(
              title ?? '',
              style: getMediumStyle(color: ColorManager.primary),
            ),
            actions: actions,
          );
        });
  }
}
