class OnboardModel {
  String imageUrl, heading, description;
  int screenNo;

  OnboardModel({required this.imageUrl, required this.heading, required this.description, required this.screenNo});
}

final List<OnboardModel> onboardingList = [
  OnboardModel(
    screenNo: 0,
    imageUrl: "assets/images/onboarding/Onboarding image 1.png",
    heading: 'We Connect People',
    description: "Connecting people trough one platform to share the memories together.",
  ),
  OnboardModel(
    screenNo: 1,
    imageUrl: "assets/images/onboarding/Onboarding image 2.png",
    heading: 'Sharing Happiness',
    description: "Sharing happiness by sharing your memories in Zelio platform.",
  ),
  OnboardModel(
    screenNo: 2,
    imageUrl: "assets/images/onboarding/Onboarding image 3.png",
    heading: 'Last Long Memories',
    description: "You can store memories of your photos in Zelio app without limit.",
  ),
];
