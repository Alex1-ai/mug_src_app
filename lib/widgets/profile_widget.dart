import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/dimensions.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final bool clickable;

  ProfileWidget({super.key, required this.title,  required this.iconData, required this.subtitle, required this.clickable});

  @override
  Widget build(BuildContext context) {
    return Card(
      
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(12.0),
          borderRadius: BorderRadius.circular(Dimensions.radius15 - 3)
        ),
        child: Container(
          height: Dimensions.height45 + Dimensions.height45-5,
          //width: 50,
          padding: EdgeInsets.only(left: Dimensions.radius20,),
          // padding: EdgeInsets.symmetric(horizontal: Dimensions.radius20 ),
          // margin: EdgeInsets.only(right: Dimensions.height10 , left: Dimensions.height10),
          child: Row(
            children: [
               Container(
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                      color: AppColors.iconBackgroundColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20 + 5),
                    ),
                    // padding: EdgeInsets.all(12.0),
                    padding: EdgeInsets.all(Dimensions.radius15 ),
                    child: Icon(
                      iconData,
                      // size: 30,
                      size: Dimensions.font26 +5,

                      color: Colors.white,
                    ),
                  ),










              SizedBox(width: Dimensions.width15 + 3),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                            // fontSize: 15, 
                            //  fontSize:18;
                              //color:AppColors.subTitleTextColor,
                              fontSize: Dimensions.font20 +2 , 
                              fontWeight: FontWeight.bold,
                              ),
                          ),
              
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                      style: TextStyle(
                          fontFamily: "SourceSerifLight",
                          //fontSize: 14,
                          //fontSize: 16,
                          fontSize: Dimensions.font16 + 1.8,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 122, 118, 118),
                          //color:AppColors.subTitleTextColor,
                          
                          ),
                    ),
              
                    
                  ],
                ),
              ),


             
            //  SizedBox(width: Dimensions.height10,),

             if( clickable) IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, color: AppColors.iconBackgroundColor,))





            ],
          ),
        ),
      );
  }
}