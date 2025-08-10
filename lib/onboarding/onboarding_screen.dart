import 'package:flutter/material.dart';
import 'package:islamiapp/onboarding/page_view_items.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/onboarding/onboarding_data.dart';
import 'package:islamiapp/widgets/dot_indictor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "onboarding";

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  Future<void> finishOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("onboarding_done", true);
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/images/header.png",
              height: screensize.height * 0.25,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemBuilder: (_, index) => PageViewItems(
                onboardingData: OnboardingData.onboardinglist[index],
              ),
              itemCount: OnboardingData.onboardinglist.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: currentIndex != 0
                    ? () {
                        controller.animateToPage(
                          currentIndex - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    : null,
                child: currentIndex != 0
                    ? Text(
                        "Back",
                        style: textTheme.titleMedium!.copyWith(
                          color: AppTheme.primary,
                        ),
                      )
                    : SizedBox.shrink(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnboardingData.onboardinglist.length,
                  (index) => DotIndicator(isSelected: currentIndex == index),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (currentIndex ==
                      OnboardingData.onboardinglist.length - 1) {
                    finishOnboarding();
                  } else {
                    controller.animateToPage(
                      currentIndex + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  currentIndex == OnboardingData.onboardinglist.length - 1
                      ? "Finish"
                      : "Next",
                  style: textTheme.titleMedium!.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
