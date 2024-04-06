// import 'package:alexis/consts/dimensions.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AppBarIcons extends StatelessWidget {
  AppBarIcons({Key? key, required this.function, required this.icon})
      : super(key: key);
  final Function function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        function();
      },
      child: Padding(
        padding: EdgeInsets.all(Dimensions.height10 -6),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.width10 -3),
            child: Icon(
              icon,
              size: Dimensions.iconSize24,
            ),
          ),
        ),
      ),
    );
  }
}
