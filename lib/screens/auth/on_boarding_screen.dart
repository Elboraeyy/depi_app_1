import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://www.culturemonkey.io/guides/content/images/2023/07/what-is-employee-onboarding.png',
              ),
              SizedBox(height: 20),
              Text(
                'Order in the mobile app',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Choose your Order',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: Colors.blueAccent,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.person), Text('Next')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
