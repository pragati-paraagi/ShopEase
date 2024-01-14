import 'package:flutter/material.dart';
import 'package:shop_ease/features/authentication/controllers/onboarding_controller.dart';
import 'package:shop_ease/login.dart';
import 'package:shop_ease/utils/constants/device_util.dart';
import 'package:shop_ease/utils/helpers/helper_f.dart';
import 'package:shop_ease/utils/constants/text_s.dart';
import 'package:shop_ease/utils/constants/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shop_ease/utils/colors.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              buildOnBoardingPage(
                context: context,
                image: 'assets/images/img.png',
                title: Ttexts.title1,
                subtitle: Ttexts.subtitle1,
              ),
              buildOnBoardingPage(
                context: context,
                image: 'assets/images/img_2.png',
                title: Ttexts.title2,
                subtitle: Ttexts.subtitle2,
              ),
              buildOnBoardingPage(
                context: context,
                image: 'assets/images/img_1.png',
                title: Ttexts.title3,
                subtitle: Ttexts.subtitle3,
              ),
            ],
          ),
          Positioned(
            top: TDeviceUtils.getAppBarHeight(),
            right: Tsizes.defaultSpace,
            child: TextButton(
              onPressed: () => Get.to(()=>LoginScreen()),
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Almarai',
                  color: Color(0xff10564F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          OnBoardingDot(),
          OnBoardingButton(),
        ],
      ),
    );
  }

  Widget buildOnBoardingPage({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(Tsizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              image,
              height: THelper.screenHeight() * 0.4,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Tsizes.spaceItems),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingDot extends StatelessWidget {
  const OnBoardingDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark= THelper.isDarkMode(context);
    return Positioned(
        bottom: 320,
        left: 150,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect:  ExpandingDotsEffect(activeDotColor: dark ? Tcolors.light : Tcolors.dark, dotHeight: 5),
        ));
  }
}

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark= THelper.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      right: 168,
      bottom: 230,
      child: ElevatedButton(
        onPressed: ()=> controller.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: dark ? Tcolors.primaryColor: Colors.black),
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}


