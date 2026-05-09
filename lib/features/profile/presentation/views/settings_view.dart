import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/core/api/api_manager.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/features/profile/presentation/cubit/setting/setting_cubit.dart';
import 'package:grocery1/features/profile/presentation/cubit/setting/setting_state.dart';
import 'package:grocery1/features/profile/presentation/widgets/custom_switch_widget.dart';
import '../../../../core/resources/color_manager.dart';
import '../widgets/divider_widget.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String selectedLanguage = 'English (US)';

  bool isDark = false;

  late SettingCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SettingCubit(apiManger: ApiManager());
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child:
          BlocConsumer<SettingCubit, SettingsState>(listener: (context, state) {
        if (state is SettingsDeleteSuccess) {
          //navigate to login
        }
        if (state is SettingsError) {
          SnackBar(
            content: Text(state.message),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: ColorManager.appbarBackground,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, size: 19),
            ),
            title: Text('Settings',
                style: TextStyle(fontSize: 18, fontFamily: 'inter')),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DividerWidget(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Language",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Preferred Language",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 148,
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedLanguage,
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: ColorManager.grey,
                            size: 25,
                          ),
                          items: [
                            DropdownMenuItem(
                                value: 'English (US)',
                                child: Text(
                                  'English (US)',
                                  style: TextStyle(
                                      color: Colors.grey, fontFamily: 'inter'),
                                )),
                            DropdownMenuItem(
                              value: 'Arabic',
                              child: Text('Arabic',
                                  style: TextStyle(
                                      color: Colors.grey, fontFamily: 'inter')),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedLanguage = value;
                              });
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              DividerWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Appearance",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.light_mode,
                          size: 25,
                          color: ColorManager.primary,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                            child: Text(
                          'Dark Mode',
                          style: TextStyle(fontSize: 16),
                        )),
                        CustomSwitchWidget(
                          isDark: isDark,
                          onChanged: (_) {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Notification Preference",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.28,
                        decoration: BoxDecoration(
                            color: ColorManager.appbarBackground,
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 13),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Order Updates',
                                      style: TextStyle(fontSize: 16),
                                    )),
                                    CustomSwitchWidget(
                                      isDark: isDark,
                                      onChanged: (_) {},
                                    )
                                  ],
                                ),
                              ),
                              DividerWidget(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 13),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Promotional Emails',
                                      style: TextStyle(fontSize: 16),
                                    )),
                                    CustomSwitchWidget(
                                      isDark: isDark,
                                      onChanged: (_) {},
                                    )
                                  ],
                                ),
                              ),
                              DividerWidget(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 13),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Nutrition Insights',
                                      style: TextStyle(fontSize: 16),
                                    )),
                                    CustomSwitchWidget(
                                      isDark: isDark,
                                      onChanged: (_) {},
                                    )
                                  ],
                                ),
                              ),
                              DividerWidget(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 13),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Price Alerts',
                                      style: TextStyle(fontSize: 16),
                                    )),
                                    CustomSwitchWidget(
                                      isDark: isDark,
                                      onChanged: (_) {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              DividerWidget(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data Management",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 83,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Download Your Data",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Get a copy of your account information",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Delete Account'),
                            content: Text(
                                'Are you sure you want to permanently delete your account?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  cubit.deleteAccount();
                                },
                                child: Text('Delete',
                                    style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: 83,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xffA9090C), // ← غير اللون هنا
                            width: 1, // ← سماكة الـ border
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.trashIcon,
                              width: 26,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delete Account",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffA9090C)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Permanently delete your account and data",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffA9090C))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
