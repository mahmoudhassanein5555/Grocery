import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery1/core/utils/app_text.dart';

import '../../../../core/resources/appassets.dart';
import '../../../../core/resources/color_manager.dart';

class WidgetGoogleButton extends StatefulWidget {
  const WidgetGoogleButton({super.key});

  @override
  State<WidgetGoogleButton> createState() => _WidgetGoogleButtonState();
}

class _WidgetGoogleButtonState extends State<WidgetGoogleButton> {
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    // Navigator.of(
    //   context,
    // ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        signInWithGoogle();
      },
      child: Container(
        height: 42.h,
        width: 354.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ColorManager.grey),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.googleIcon, width: 24.w, height: 24.h),
            SizedBox(width: 8.w),
            AppText.loginWithGoogle(),
          ],
        ),
      ),
    );
  }
}
