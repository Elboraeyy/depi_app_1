import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.bgColor,
    required this.catgImage,
    required this.catgName,
  });

  final int bgColor;
  final String catgImage;
  final String catgName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(bgColor),
          radius: 60,
          child: Image.asset(catgImage),
        ),
        SizedBox(height: 6),
        Text(
          catgName,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}
