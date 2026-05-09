import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/forget_password/presentation/views/reset_password_view.dart';

import '../../../../core/resources/color_manager.dart';
import '../cubit/forgot_password_cubit.dart';
import '../cubit/forgot_password_state.dart';
import '../widgets/otp_input_widget.dart';

class OtpView extends StatefulWidget {
  final String emailOrPhone;
  const OtpView({super.key, required this.emailOrPhone});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  String otpCode = '';

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
        title: Text('Forgot Password', style: TextStyle(fontSize: 18)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                final cubit = context.read<ForgotPasswordCubit>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: ResetPasswordView(),
                    ),
                  ),
                );
              } else if (state is ForgotPasswordCodeSent) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Code resent successfully')),
                );
              } else if (state is ForgotPasswordError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<ForgotPasswordCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Text(
                    "Enter 4 Digits Code",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Enter the 4 digits code that you received on your email",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 42),
                  OtpInputWidget(
                    onCompleted: (value) {
                      setState(() => otpCode = value);
                    },
                  ),
                  SizedBox(height: 42),
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
                              if (otpCode.length == 4) {
                                cubit.verifyOtp(otpCode);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('Please enter the complete code'),
                                  ),
                                );
                              }
                            },
                      child: state is ForgotPasswordLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Verify",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive code? ",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      GestureDetector(
                        onTap: () => cubit.resendCode(
                          email: cubit.isEmail ? widget.emailOrPhone : null,
                          phone: cubit.isEmail ? null : widget.emailOrPhone,
                        ),
                        child: Text(
                          'Resend code',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
