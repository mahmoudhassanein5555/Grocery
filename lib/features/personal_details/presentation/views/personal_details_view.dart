import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/customtxtfield.dart';
import '../../../profile/presentation/widgets/divider_widget.dart';
import '../../data/repo/personal_details_repo_impl.dart';
import '../../domain/entities/profile_entity.dart';
import '../cubit/personal_details_cubit.dart';
import '../cubit/personal_details_state.dart';
import '../widgets/country_code_widget.dart';

class PersonalDetailsView extends StatefulWidget {
  const PersonalDetailsView({super.key});

  @override
  State<PersonalDetailsView> createState() => _PersonalDetailsViewState();
}

class _PersonalDetailsViewState extends State<PersonalDetailsView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedCountryCode = '+20';

  late PersonalDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = PersonalDetailsCubit(
      repo: PersonalDetailsRepoImpl(apiManger: ApiManager()),
    )..getProfile();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cubit.close();
    super.dispose();
  }

  void fillControllers(ProfileEntity profile) {
    nameController.text = profile.username ?? '';
    emailController.text = profile.email ?? '';
    phoneController.text = profile.phone ?? '';
    setState(() {
      selectedCountryCode = profile.countryCode ?? '+20';
    });
  }

  void onSave() {
    final parts = nameController.text.trim().split(' ');
    cubit.updateProfile(
      ProfileEntity(
        username: nameController.text.trim(),
        firstname: parts[0],
        lastname: parts.length > 1 ? parts.sublist(1).join(' ') : parts[0],
        email: emailController.text,
        phone: phoneController.text,
        countryCode: selectedCountryCode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocConsumer<PersonalDetailsCubit, PersonalDetailsState>(
        listener: (context, state) {
          if (state is PersonalDetailsLoaded) {
            fillControllers(state.profile);
          }
          if (state is PersonalDetailsUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully')),
            );
          }
          if (state is PersonalDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.appbarBackground,
            appBar: AppBar(
              backgroundColor: ColorManager.appbarBackground,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, size: 19),
              ),
              title: const Text(
                'Personal Details',
                style: TextStyle(fontSize: 18, fontFamily: 'inter'),
              ),
            ),
            body: state is PersonalDetailsLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ))
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        DividerWidget(),
                        const SizedBox(height: 26),

                        // ── Name ──────────────────────────────────
                        CustomTextField(
                          controller: nameController,
                          hintText: 'Name',
                          hintColor: Colors.grey.shade400,
                          hintWeight: FontWeight.w300,
                          icon: Icons.person_outline,
                          backgroundColor: Colors.white,
                        ),
                        const SizedBox(height: 12),

                        //country code
                        Row(
                          children: [
                            CountryCodeWidget(
                              selectedCode: selectedCountryCode,
                              onChanged: (value) {
                                setState(() => selectedCountryCode = value);
                              },
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: CustomTextField(
                                controller: phoneController,
                                hintText: 'Phone number',
                                hintColor: Colors.grey.shade400,
                                hintWeight: FontWeight.w300,
                                icon: Icons.phone_outlined,
                                keyboardType: TextInputType.phone,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        //email
                        CustomTextField(
                          controller: emailController,
                          hintText: 'Email',
                          icon: Icons.email_outlined,
                          hintWeight: FontWeight.w300,
                          hintColor: Colors.grey.shade400,
                          keyboardType: TextInputType.emailAddress,
                          backgroundColor: Colors.white,
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5),

                        //button save

                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: state is PersonalDetailsUpdateLoading
                                ? null
                                : onSave,
                            child: state is PersonalDetailsUpdateLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  )
                                : const Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
