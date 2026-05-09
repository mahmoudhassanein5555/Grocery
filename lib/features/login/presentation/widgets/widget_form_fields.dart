import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery1/features/login/presentation/widgets/widget_login_button.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/customtxtfield.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class WidgetFormFields extends StatefulWidget {
  const WidgetFormFields({super.key, required this.state});
  final LoginState state;

  @override
  State<WidgetFormFields> createState() => _WidgetFormFieldsState();
}

class _WidgetFormFieldsState extends State<WidgetFormFields> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isSelected = true;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            hintText: 'Sarahem@gmail.com',
            prefixIcon: Icon(
              Icons.email_outlined,
              size: 20.sp,
              color: ColorManager.greyBorder,
            ),
            hintStyle: getRegularStyle(
              color: ColorManager.greyBorder,
              fontSize: 12.sp,
            ),
            validator: Validator.validateEmail,
            backgroundColor: Colors.white,
          ),
          CustomTextField(
            controller: passwordController,
            hintText: '********',
            obscureText: isSelected,
            prefixIcon: Icon(
              Icons.lock_open_outlined,
              color: ColorManager.greyBorder,
              size: 16.sp,
            ),
            hintStyle: getRegularStyle(
              color: ColorManager.greyBorder,
              fontSize: 12.sp,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              icon: Icon(
                isSelected ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.greyBorder,
                size: 21.sp,
              ),
            ),
            backgroundColor: Colors.white,
            validator: Validator.validatePassword,
          ),
          SizedBox(height: 8.h),
          WidgetLoginButton(
            isloading: widget.state is LoginLoading,
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
