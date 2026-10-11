import 'package:flutter/material.dart';
import 'package:my_app/feature/onboarding/onboard_item.dart';

class OnboardItemWidget extends StatelessWidget {
  final OnboardItem item;
  const OnboardItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.imgUrl,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Text(item.title, style: TextStyle(fontSize: 20)),
          SizedBox(height: 2),
          Text(
            item.subTitle,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
