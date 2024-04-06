import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';


class EmoticonFace extends StatelessWidget {
  final String emoticonFace;
  EmoticonFace({super.key, required this.emoticonFace});

  @override
  Widget build(BuildContext context) {
    return Container(

           decoration: BoxDecoration(
                 color:AppColors.iconBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      emoticonFace,
                    style: TextStyle(
                      fontSize: 28,
                    ),
                    
                    ),
                    
                    ),
                );
  }
}