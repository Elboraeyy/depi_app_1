import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(50),
        backgroundColor: Colors.orange,
      ),
      child: isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            )
          : Text(text, style: TextStyle(fontSize: 17, color: Colors.white)),
    );
  }
}
