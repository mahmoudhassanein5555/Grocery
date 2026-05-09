import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/forget_password/presentation/widgets/CustomTextField.dart';

import '../../data/repo/forgot_password_repo_impl.dart';
import '../cubit/forgot_password_cubit.dart';
import '../cubit/forgot_password_state.dart';
import '../widgets/forgot_password_toggle.dart';
import 'otp_view.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(ForgotPasswordRepoImpl()),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, size: 19),
          ),
          title: Text('Forgot Password', style: TextStyle(fontSize: 18)),
        ),
        body: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              final cubit = context.read<ForgotPasswordCubit>();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: OtpView(emailOrPhone: controller.text),
                  ),
                ),
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    ForgotPasswordToggle(
                      isEmail: cubit.isEmail,
                      onToggle: (value) => cubit.toggleMethod(value),
                    ),
                    SizedBox(height: 8),
                    Text(
                      cubit.isEmail
                          ? "Enter the email associated with this account"
                          : "Enter the phone number associated with this account",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(height: 30),
                    Text(
                      cubit.isEmail ? "Email" : "Phone Number",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: controller,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8),
                        child: cubit.isEmail
                            ? Icon(Icons.email_outlined, color: Colors.grey)
                            : Icon(Icons.phone, color: Colors.grey),
                      ),
                      hintText: cubit.isEmail ? 'Email' : 'Phone Number',
                      keyboardType: cubit.isEmail
                          ? TextInputType.emailAddress
                          : TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return cubit.isEmail
                              ? 'Please enter your email'
                              : 'Please enter your phone number';
                        }
                        if (cubit.isEmail && !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: state is ForgotPasswordLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  cubit.sendCode(
                                    email:
                                        cubit.isEmail ? controller.text : null,
                                    phone:
                                        cubit.isEmail ? null : controller.text,
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: state is ForgotPasswordLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Send Code',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
