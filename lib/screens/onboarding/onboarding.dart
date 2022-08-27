import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/size_config.dart';
import 'controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            onPageChanged: (index) {
              setState(() => controller.isLastPage = index == 2);
            },
            controller: controller.pageController,
            itemCount: controller.onboardingItems.length,
            itemBuilder: ((context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: controller.onboardingItems[index].color,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.fromHeight(context, 4.8)),
                      child:
                          Image.asset(controller.onboardingItems[index].image!),
                    ),
                    Positioned(
                        top: SizeConfig.fromHeight(context, 38.01),
                        left: SizeConfig.fromWidth(context, 5.6),
                        right: SizeConfig.fromWidth(context, 5.6),
                        bottom: SizeConfig.fromHeight(context, 11.01),
                        child: Container(
                          width: SizeConfig.fromWidth(context, 88.78),
                          height: SizeConfig.fromHeight(context, 50.9),
                          padding: EdgeInsets.fromLTRB(
                            SizeConfig.fromWidth(context, 11.7),
                            SizeConfig.fromHeight(context, 6.05),
                            SizeConfig.fromWidth(context, 11.7),
                            SizeConfig.fromHeight(context, 2.5),
                          ),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 0.75),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.onboardingItems[index].title!,
                                style: TextStyle(
                                    fontSize: SizeConfig.fontSize(context, 5),
                                    color: Colors.white),
                              ),
                              Text(
                                controller.onboardingItems[index].description!,
                                style: TextStyle(
                                    fontSize: SizeConfig.fontSize(context, 4),
                                    color: Colors.white),
                              ),
                              Center(
                                child: MaterialButton(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      side: BorderSide(color: Colors.white)),
                                  color: Colors.transparent,
                                  onPressed: () => controller.isLastPage
                                      ? controller.navigateToUtilies(context)
                                      : controller.nextPage(),
                                  child: Padding( 
                                    padding: EdgeInsets.all(
                                        SizeConfig.fontSize(context, 3)),
                                    child: Text('Get Started',
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.fontSize(context, 3),
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                              Center(
                                  child: SmoothPageIndicator(
                                      controller: controller.pageController,
                                      count: controller.onboardingItems.length,
                                      onDotClicked: (index) =>
                                          controller.jumpToPage(index)))
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: SizeConfig.fromHeight(context, 3.24),
                        left: SizeConfig.fromWidth(context, 45.32),
                        child: const Center(
                          child:
                              Icon(Icons.cancel_outlined, color: Colors.white),
                        ))
                  ],
                ),
              );
            })));
  }
}
