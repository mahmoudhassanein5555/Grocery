import 'package:flutter/material.dart';

import 'core/resources/appassets.dart';
import 'features/onboarding/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String routeName = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> shadowOpacityIn;
  late Animation<double> shadowOpacityOut;
  late Animation<double> plusOpacity;
  late Animation<double> appleOpacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    appleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.6),
      ),
    );

    shadowOpacityIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.5),
      ),
    );

    shadowOpacityOut = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.7),
      ),
    );

    plusOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.7, 1.0),
      ),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => OnboardingView()),
          );
        });
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Opacity(
                  opacity: (1 - controller.value).clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: const Offset(5, 40),
                    child: Image.asset(
                      AppAssets.ellipse,
                      height: 36,
                      width: 196,
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                double t = controller.value;

                double yOffset;
                if (t < 0.4) {
                  yOffset = -200 * (1 - (t / 0.4));
                } else if (t < 0.6) {
                  yOffset = -40 * ((t - 0.4) / 0.2);
                } else if (t < 0.8) {
                  yOffset = -40 * (1 - ((t - 0.6) / 0.2));
                } else {
                  yOffset = 0;
                }

                double scale;
                if (t < 0.4) {
                  scale = 0.6 + (t / 0.4) * 0.5;
                } else {
                  scale = 1.1 - ((t - 0.4) / 0.6) * 0.1;
                }

                return Opacity(
                  opacity: appleOpacity.value,
                  child: Transform.translate(
                    offset: Offset(0, yOffset),
                    child: Transform.scale(
                      scale: scale,
                      child: Image.asset(
                        AppAssets.vector1,
                        height: 77,
                      ),
                    ),
                  ),
                );
              },
            ),
            FadeTransition(
              opacity: plusOpacity,
              child: Transform.translate(
                offset: const Offset(30, -30),
                child: Image.asset(
                  AppAssets.logoPlus,
                  height: 26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
