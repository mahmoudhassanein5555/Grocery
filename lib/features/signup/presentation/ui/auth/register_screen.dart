import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/login/presentation/screens/login_screen.dart';
import 'package:grocery1/features/signup/presentation/ui/auth/cubit/firebase_auth_view_model.dart';
import 'package:grocery1/core/di/servicelocator.dart';

import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/core/resources/font_manager.dart';
import 'package:grocery1/core/resources/styles_manager.dart';
import 'package:grocery1/core/utils/validator.dart';
import 'package:grocery1/core/utils/dialog_utils.dart';
import 'package:grocery1/core/widgets/custom_elevated_button.dart';
import 'package:grocery1/core/widgets/custom_text_form_field.dart';

import 'cubit/firebase_auth_state.dart';
import 'cubit/register_view_model.dart';
import 'cubit/register_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterViewModel viewModel = getIt<RegisterViewModel>();
  final FirebaseauthViewModel fireAuth = getIt<FirebaseauthViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        /// REGISTER
        BlocListener<RegisterViewModel, RegisterStates>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              DialogUtils.showLoading(
                context: context,
                message: 'Loading ...',
              );
            } else if (state is RegisterErrorState) {
              DialogUtils.hideLoading(context);

              DialogUtils.showMessage(
                context: context,
                message: state.errors.values.first.first,
                title: 'Error',
                posActionName: "OK",
              );
            } else if (state is RegisterSuccessState) {
              DialogUtils.hideLoading(context);

              DialogUtils.showMessage(
                context: context,
                message: 'Register Success',
                title: 'Success',
                posActionName: 'OK',
              );
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            }
          },
        ),

        ///  FIREBASE AUTH
        BlocListener<FirebaseauthViewModel, Firebaseauthstate>(
          bloc: fireAuth,
          listener: (context, state) {
            if (state is AuthLoading) {
              DialogUtils.showLoading(
                context: context,
                message: "Loading...",
              );
            } else if (state is AuthSuccess) {
              DialogUtils.hideLoading(context);

              DialogUtils.showMessage(
                context: context,
                message: "Success Login",
              );
              Navigator.pushReplacementNamed(context, '/');
            } else if (state is AuthError) {
              DialogUtils.hideLoading(context);
              DialogUtils.showMessage(
                context: context,
                message: state.message,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 270.h,
                    width: double.infinity,
                    child: Image.asset(
                      AppAssets.rectangle109,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 80.w,
                    top: 186.h,
                    child: Text(
                      "Create your Account",
                      style: getSemiBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s24,
                        fontFamily: FontConstants.interFontFamily,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<RegisterViewModel, RegisterStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    return Form(
                      key: viewModel.formKey,
                      child: Column(
                        children: [
                          Text(
                            "Just a few things to get started",
                            style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s14,
                              fontFamily: FontConstants.interFontFamily,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextFormField(
                            controller: viewModel.mailController,
                            validator: Validator.validateEmail,
                            keyboardType: TextInputType.emailAddress,
                            isPassword: false,
                            isObscureText: false,
                            hintText: "Email",
                            filledColor: ColorManager.baseWhite,
                          ),
                          CustomTextFormField(
                            controller: viewModel.fullNameController,
                            validator: Validator.validateFullName,
                            keyboardType: TextInputType.name,
                            isPassword: false,
                            isObscureText: false,
                            hintText: "Username",
                            filledColor: ColorManager.baseWhite,
                          ),
                          CustomTextFormField(
                            controller: viewModel.passwordController,
                            validator: Validator.validatePassword,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            isObscureText: true,
                            hintText: "Password",
                            filledColor: ColorManager.baseWhite,
                          ),
                          CustomTextFormField(
                            controller: viewModel.rePasswordController,
                            validator: Validator.validateConfirmPassword(
                                viewModel.passwordController.text),
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: true,
                            isObscureText: true,
                            hintText: "Confirm Password",
                            filledColor: ColorManager.baseWhite,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: ColorManager.primary,
                                value: viewModel.isAcceptedTerms,
                                onChanged: (value) {
                                  viewModel.toggleTerms(value ?? false);
                                },
                              ),
                              const Text("I agree to the policies and terms"),
                            ],
                          ),
                          CustomElevatedButton(
                            onTap: state is RegisterLoadingState
                                ? null
                                : viewModel.register,
                            label: "signup",
                            backgroundColor: ColorManager.primary,
                            radius: 8.0.r,
                            isStadiumBorder: false,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushReplacementNamed(
                                        LoginScreen.routeName),
                                child: Text(
                                  "I have account login, ",
                                  style: getRegularStyle(
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                              Text(
                                "Or sign up with",
                                style: getRegularStyle(
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: fireAuth.signInWithFacebook,
                                child: Image.asset(
                                  AppAssets.logoFacebook,
                                  width: 38.w,
                                  height: 38.h,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              InkWell(
                                onTap: fireAuth.signInWithGoogle,
                                child: Image.asset(
                                  AppAssets.googleIcon,
                                  width: 38.w,
                                  height: 38.h,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              InkWell(
                                onTap: () {
                                  if (viewModel.formKey.currentState!
                                      .validate()) {
                                    fireAuth.signInWithEmail(
                                      viewModel.mailController.text,
                                      viewModel.passwordController.text,
                                    );
                                  }
                                },
                                child: Image.asset(
                                  AppAssets.mailLogo,
                                  width: 38.w,
                                  height: 38.h,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
