import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';

class AppText {
  static Widget forgotPassword() {
    return Text(
      "Forgot Password?",
      style: getRegularStyle(color: ColorManager.primary, fontSize: 15.sp),
    );
  }

  static Widget loginWithGoogle() {
    return Text(
      "Login with Google",
      style: getSemiBoldStyle(color: ColorManager.black, fontSize: 16.sp),
    );
  }

  static Widget dontHaveAccount() {
    return Text(
      "Don't have an account?",
      style: getRegularStyle(color: ColorManager.grey, fontSize: 14.sp),
    );
  }

  static Widget login() {
    return Text(
      "Login",
      style: getSemiBoldStyle(color: ColorManager.white, fontSize: 14.sp),
    );
  }

  static Widget orLoginWith() {
    return Text(
      "Or Login with",
      style: getRegularStyle(color: ColorManager.black, fontSize: 12.sp),
    );
  }

  static Widget signUp() {
    return Text(
      "Sign up",
      style: getSemiBoldStyle(color: ColorManager.primary, fontSize: 12.sp),
    );
  }

  static Widget todaysDeals() {
    return Text(
      "Today's Deals",
      style: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
    );
  }

  static Widget recommendedForYou() {
    return Text(
      "Recommended For You",
      style: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
    );
  }

  static Widget addToCart() {
    return Text(
      "Add to cart",
      style: getSemiBoldStyle(color: ColorManager.white, fontSize: 18.sp),
    );
  }

  static Widget address() {
    return Text(
      "Villa 14, Street 23,",
      style: getRegularStyle(color: ColorManager.grey, fontSize: 12.sp),
    );
  }

  static Widget categories() {
    return Text(
      "Categories",
      style: getMediumStyle(color: ColorManager.black, fontSize: 16.sp),
    );
  }
}
