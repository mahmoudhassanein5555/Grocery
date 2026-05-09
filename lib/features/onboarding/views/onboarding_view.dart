import 'package:flutter/material.dart';
import 'package:grocery1/core/resources/color_manager.dart';
import 'package:grocery1/features/login/presentation/screens/login_screen.dart';

import '../../../core/resources/appassets.dart';
import '../domain/entities/onboarding_entity.dart';
import '../widgets/onboarding_dots_indicator.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => OnboardingViewState();
}

class OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<OnboardingEntity> pages = [
    OnboardingEntity(
      image: AppAssets.undrawEmptyCart,
      title: 'Shop Everything You Need, In One Click',
      description:
          'Discover over 1000 fresh and essential grocery products in a single place.',
    ),
    OnboardingEntity(
      image: AppAssets.group,
      title: 'Save Time, Get Groceries Delivered to Your Door',
      description:
          'Ultra-fast delivery with real-time tracking straight to you.',
    ),
  ];

  void onNextPressed() {
    if (currentIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }
  }

  void onBackPressed() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.appbarBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Skip
              if (currentIndex == 0)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, '/login'),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPageWidget(
                      image: pages[index].image,
                      title: pages[index].title,
                      description: pages[index].description,
                    );
                  },
                ),
              ),

              OnboardingDotsIndicator(
                currentIndex: currentIndex,
                count: pages.length,
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentIndex > 0)
                      GestureDetector(
                        onTap: onBackPressed,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 56),
                    GestureDetector(
                      onTap: onNextPressed,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1A3C5E),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
