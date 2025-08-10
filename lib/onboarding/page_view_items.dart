import 'package:flutter/material.dart';
import 'package:islamiapp/app_theme.dart';
import 'package:islamiapp/onboarding/onboarding_data.dart';

class PageViewItems extends StatelessWidget {
  final OnboardingData onboardingData;

  PageViewItems({required this.onboardingData});

  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboardingData.imageName, height: screensize.height * 0.35),
        SizedBox(height: 24),
        Text(
          onboardingData.title,
          style: textTheme.headlineSmall!.copyWith(color: AppTheme.primary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24),
        if (onboardingData.description != null)
          Text(
            onboardingData.description!,
            style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
