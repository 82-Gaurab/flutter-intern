import 'package:flutter/material.dart';
import 'package:my_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:my_app/feature/onboarding/onboard_item.dart';
import 'package:my_app/feature/onboarding/onboard_item_widget.dart';

class OnboardingScreens extends StatefulWidget {
  const new({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<OnboardItem> _pages = [
    const OnboardItem(
      title: "Find a Restaurant",
      subTitle: "Choose from 100+ restaurants.",
      imgUrl: "assets/restaurant-icon.png",
    ),
    const OnboardItem(
      title: "Pick The Food",
      subTitle: "Get all the food in one place.",
      imgUrl: "assets/burger-image.png",
    ),
    const OnboardItem(
      title: "Get Fastest Delivery",
      subTitle: "Fastest operation to provide food by fence.",
      imgUrl: "assets/delivery-icon.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => NavigationBarScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              children: [
                Flexible(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _pages.length,
                    onPageChanged: (value) => setState(() {
                      _currentPage = value;
                    }),
                    itemBuilder: (context, index) {
                      return OnboardItemWidget(item: _pages[index]);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: .center,
                  spacing: 8,
                  children: List.generate(_pages.length, (index) {
                    return AnimatedContainer(
                      height: 8,
                      width: _currentPage == index ? 18 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Color(0xAAff7622)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      duration: Duration(milliseconds: 300),
                    );
                  }),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xAAff7622),
                    ),
                    onPressed: _next,
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? "Get Started"
                          : "Next",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                ?_currentPage == _pages.length - 1
                    ? null
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 45,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => NavigationBarScreen(),
                              ),
                            );
                          },
                          child: Text("Skip", style: TextStyle(fontSize: 16)),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
