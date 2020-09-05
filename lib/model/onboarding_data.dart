class OnBoardingData {
  String title;
  String description;
  String imageURI;

  OnBoardingData({this.title, this.description, this.imageURI});
}

List<OnBoardingData> onBoardingDataList = [
  OnBoardingData(
      title: "Order From Desk",
      description: "Now you can order food right from your desk.",
      imageURI: "assets/images/screen_1.png"),
  OnBoardingData(
      title: "Pay Online",
      description:
          "Never worry about the change, pay the exact amount while placing the order.",
      imageURI: "assets/images/screen_2.png"),
  OnBoardingData(
      title: "Skip Queues",
      description:
          "Avoid standing in queues, we will notify you when your order is ready.",
      imageURI: "assets/images/screen_3.png"),
];
