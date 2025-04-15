import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ezybooking/controllers/splash_controller.dart';
import 'package:ezybooking/views/utils/app_constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
                child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText("Ezy Booking")
                    ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Top Event");
                  },
                )
            ),
            const SizedBox(height: 50),
            Lottie.asset(AppImages.loading)
          ],
        ),
      ),
    );
  }
}
