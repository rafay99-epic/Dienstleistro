import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final IconData? icon;
  final String text;
  final EdgeInsets padding;
  final bool enableIcon;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.icon,
    required this.text,
    required this.enableIcon,
    this.backgroundColor,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.only(left: 80.0, right: 80.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ??
                Colors.amber, // Use Colors.amber as a default color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (enableIcon) ...[
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
              ],
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
