import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/forget_password/presentation/widgets/CustomTextField.dart';

import '../../../../core/resources/appassets.dart';
import '../../../../core/resources/color_manager.dart';
import '../cubit/forgot_password_cubit.dart';
import '../cubit/forgot_password_state.dart';
import '../widgets/success_popup_widget.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, size: 19),
        ),
        title: Text('Reset Password', style: TextStyle(fontSize: 18)),
      ),
      body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => SuccessPopupWidget(),
            );
          } else if (state is ForgotPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgotPasswordCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create New Password",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 32),
                Text(
                  "New Password",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: newPasswordController,
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(AppAssets.lightLock, width: 20),
                  ),
                  hintText: "Password",
                ),
                SizedBox(height: 13),
                Text(
                  "Must be at least 8 characters",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(height: 32),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: confirmPasswordController,
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(AppAssets.lightLock, width: 20),
                  ),
                  hintText: "Password",
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: state is ForgotPasswordLoading
                        ? null
                        : () {
                            if (newPasswordController.text.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Password must be at least 8 characters'),
                                ),
                              );
                            } else if (newPasswordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Passwords do not match'),
                                ),
                              );
                            } else {
                              cubit.resetPassword(newPasswordController.text);
                            }
                          },
                    child: state is ForgotPasswordLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Reset",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
