import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocery1/core/di/servicelocator.dart';
import 'package:grocery1/features/home/presentation/screens/home_screen.dart';
import 'package:grocery1/main_app.dart';
import '../../../../core/resources/color_manager.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import '../widgets/widget_form_fields.dart';
import '../widgets/widget_forgot_password.dart';
import '../widgets/widget_google_button.dart';
import '../widgets/widget_header.dart';
import '../widgets/widget_login_text.dart';
import '../widgets/widget_logo.dart';
import '../widgets/widget_sign_up.dart';
import '../widgets/widget_title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const String routeName = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.colorBg,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Login Success")));
              // final token = state.loginEntity.token;
              // final storage = FlutterSecureStorage();

              // await storage.write(key: 'token', value: token);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainApp(),
              ));
            }

            if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                WidgetHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Column(
                        children: [
                          WidgetLogo(),
                          SizedBox(height: 32.h),
                          WidgetTitle(),
                          SizedBox(height: 16.h),
                          WidgetFormFields(
                            state: state,
                          ),
                          SizedBox(height: 8.h),
                          WidgetForgotPassword(),
                          SizedBox(height: 10.h),
                          SizedBox(height: 15.h),
                          WidgetLoginText(),
                          SizedBox(height: 15.h),
                          WidgetGoogleButton(),
                          SizedBox(height: 12.h),
                          WidgetSignUp(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
