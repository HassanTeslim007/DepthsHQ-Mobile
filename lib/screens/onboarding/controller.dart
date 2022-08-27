import 'package:depthshq_mobile_task/models/onboarding_model.dart';
import 'package:flutter/material.dart';

import '../utility/utilities.dart';

class OnboardingController {
  final pageController = PageController();
  bool isLastPage = false;
  List<Onboarding> onboardingItems = [
    Onboarding(
        color: const LinearGradient(
          colors: [
            Color.fromRGBO(181, 169, 255, 1),
            Color.fromRGBO(181, 169, 255, 1),
            Color.fromRGBO(17, 28, 126, 1),
            Color.fromRGBO(17, 28, 126, 1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        title: 'Make Payments using\nQR Codes and URL',
        description:
            'Send and recieve money from family, friends and even acquaintances seamlessly using QR Codes and URL payment systems.',
        image: 'assets/onboarding_health.png'),
    Onboarding(
        color: const LinearGradient(
          colors: [
            Color.fromRGBO(198, 242, 228, 1),
            Color.fromRGBO(54, 68, 119, 1)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        title: 'Achieve your financial goals\nby budgetting wisely.',
        description:
            'Let\'s help you spend wisely by giving you the superpower to create a swift and detailed budget list. You create the budget, we automate and keep you accountable.',
        image: 'assets/onboarding_goal.png'),
    Onboarding(
        color: const LinearGradient(
          colors: [
            Color.fromRGBO(71, 30, 158, 0.9),
            Color.fromRGBO(158, 178, 248, 0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        title: 'Automate Utility Payments',
        description:
            'Never go late on any utility payment again with Dashr. By automating payments, all your utility bills get paid off seamless without breaking a sweat',
        image: 'assets/onboarding_travel.png'),
  ];
  void jumpToPage(index) {
    pageController.jumpToPage(index);
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 750), curve: Curves.easeIn);
  }

  void navigateToUtilies(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const UtilityScreen()));
  }
}
