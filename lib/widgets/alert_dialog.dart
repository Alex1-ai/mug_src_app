import 'package:flutter/material.dart';
import 'package:mug_app/widgets/big_text.dart';

import '../const/colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final Color color;
  // final navigate;
  const CustomAlertDialog({super.key, required this.title, required this.subtitle, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        //crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            // Icons.check_circle_outline,
            // Icons.check_circle_rounded,
            size: 99,
            color: color,
          ),
          SizedBox(height: 10),
          // BigText(text: "Thank you for Voting!", size: 27, ),
          BigText(text: title, size: 27, ),

          // Text(
          //   'Thank you for Voting!',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          //),
          SizedBox(height: 10),
          Text(
            subtitle,
          // 'Leadership is about service.',
            style: TextStyle(
              color: AppColors.inputIconColor,
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}