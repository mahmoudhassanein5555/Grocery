import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/appassets.dart';
import 'package:grocery1/features/help_support/presentation/views/help_support_view.dart';
import 'package:grocery1/features/login/data/data_Source/login_remote_data_source_impl.dart';
import 'package:grocery1/features/login/presentation/screens/login_screen.dart';
import 'package:grocery1/features/profile/presentation/views/settings_view.dart';
import 'package:grocery1/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/api/api_endpoints.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../delivery_addresses/presentation/views/delivery_addresses_view.dart';
import '../../../personal_details/presentation/views/personal_details_view.dart';
import '../cubit/profile/profile_cubit.dart';
import '../cubit/profile/profile_state.dart';
import '../widgets/divider_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit(apiManger: ApiManager());
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              cubit.logout();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            AppToast.showToast(
              context: context,
              title: 'Logged out',
              description: 'You have been logged out successfully',
              type: ToastificationType.success,
            );
            LoginRemoteDataSourceImpl().deleteToken();
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            // navigate to login screen & clear token
          }
          if (state is ProfileError) {
            AppToast.showToast(
              context: context,
              title: 'Error',
              description: state.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.appbarBackground,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: ColorManager.appbarBackground,
              automaticallyImplyLeading: false,
              title: const Text(
                'My Profile',
                style: TextStyle(fontSize: 18, fontFamily: 'inter'),
              ),
            ),
            body: Column(
              children: [
                DividerWidget(),
                const SizedBox(height: 15),
                ProfileMenuItem(
                  icon: Icons.person_2_outlined,
                  title: "Personal details",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PersonalDetailsView()),
                    );
                  },
                ),
                DividerWidget(),
                ProfileMenuItem(
                  icon: Icons.location_on_rounded,
                  title: "Delivery addresses",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const DeliveryAddressesView()),
                    );
                  },
                ),
                DividerWidget(),
                ProfileMenuItem(
                  icon: Icons.notifications_active_outlined,
                  title: "Notifications",
                  onTap: () {
                    //  navigate to notifications
                  },
                ),
                DividerWidget(),
                ProfileMenuItem(
                  icon: Icons.credit_card,
                  title: "Payment methods",
                  onTap: () {
                    // navigate to payment methods
                  },
                ),
                DividerWidget(),
                ProfileMenuItem(
                  icon: Icons.settings_rounded,
                  title: "Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsView()),
                    );
                  },
                ),
                DividerWidget(),
                ProfileMenuItem(
                  icon: Icons.help_outline_outlined,
                  title: "Help & Support",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HelpSupportView()),
                    );
                  },
                ),
                DividerWidget(),
                ProfileMenuItem(
                    icon: Icons.logout,
                    title: "Logout",
                    titleColor: ColorManager.error,
                    onTap: () {
                      _showLogoutDialog();
                    }),
                DividerWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
