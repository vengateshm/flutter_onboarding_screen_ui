import 'package:flutter/material.dart';
import 'package:flutter_app_onboarding_ui/model/onboarding_data.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();

  int _noOfPages = 0;
  int _currentPage = 0;

  @override
  void initState() {
    _noOfPages = onBoardingDataList.length;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: PageView.builder(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (currentPage) {
                setState(() {
                  _currentPage = currentPage;
                });
              },
              scrollDirection: Axis.horizontal,
              itemCount: onBoardingDataList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: _currentPage < _noOfPages - 1
                            ? Text(
                                'Skip',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontSize: 16),
                              )
                            : SizedBox(),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(onBoardingDataList[index].imageURI),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        onBoardingDataList[index].title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        onBoardingDataList[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 32.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: _currentPage == _noOfPages - 1
                                ? FlatButton(
                                    color: Color(0xffED5A6B),
                                    child: Text(
                                      'Get Started',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                  )
                                : SizedBox(),
                          ),
                        ),
                      ),
                    ))
                  ],
                );
              }),
        ),
      ),
    );
  }
}
