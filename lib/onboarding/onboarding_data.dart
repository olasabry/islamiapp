class OnboardingData {
  String imageName;
  String title;
  String? description;

  OnboardingData({
    required this.imageName,
    required this.title,
    this.description,
  });

  static List<OnboardingData> onboardinglist = [
    OnboardingData(
      imageName: "assets/images/welcome.png",
      title: "Welcome To Islami App",
    ),
    OnboardingData(
      imageName: "assets/images/ph2.png",
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingData(
      imageName: "assets/images/Readingquran.png",
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingData(
      imageName: "assets/images/onboarding4.png",
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingData(
      imageName: "assets/images/onboarding5.png",
      title: "Holy Quran Radio",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
