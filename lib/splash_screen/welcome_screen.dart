import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mug_app/auth/login.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/utils/dimensions.dart';
// import 'package:ui/constants.dart';
// import 'package:ui/widgets/bottom_navigation.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = "welcome-page";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // backgroundColor: AppColors.welcomeIcon,
      body: Container(
        // height: MediaQuery.of(context).size.height,
        height:height,
        child: Stack(
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).size.height - 100,
              height: height-100,
              // width: MediaQuery.of(context).size.width,
              width: width,
              decoration: BoxDecoration(
                // color: Theme.of(context).backgroundColor,
                color:AppColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
            Positioned(
              // top: 200.0,
              top: height * 0.2,
              // left: 100.0,
              left: width * 0.25,
              // right: 100.0,
              right: width*0.25,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    child: SvgPicture.asset(
                      "assets/images/grad_cap.png",
                      height: 180.0,
                      width: 180.0,
                    ),
                  ),
                  Text(
                    "SRC APP",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              // bottom: 170.0,
              bottom: height * 0.2,
              // left: 50.0,
              left: width * 0.1,
              // right: 50.0,
              right: width * 0.1,
              child: Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Check your timetable, and exams dates in no time on the go!",
                    style: TextStyle(
                      // color: AppColors.welcomeBg,
                      color:AppColors.catBgColor,
                      // color:AppColors.lightTextColor,
                      // fontSize: 16.0,
                      fontSize: Dimensions.font16+1,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Positioned(
              top: height - 130, // Adjust the position based on screen height
              left: width * 0.1,
              right: width * 0.1,
              // top: MediaQuery.of(context).size.height - 130,
              // left: 100.0,
              // right: 100.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Login_Screen()),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      // width: 150.0,
                      width: width * 0.6,
                      // height: 55.0,
                      height: Dimensions.height45 + Dimensions.height10 + 8,
                      padding: EdgeInsets.only(left: Dimensions.width30 + Dimensions.width30 + 10),
                      // padding: EdgeInsets.only(left: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        // color: AppColors.mainColor,
                        // color: Theme.of(context).backgroundColor,
                        color: AppColors.welcomeIcon
                        // color:AppColors.mainColor
                        // color: Colors.teal[400]
                        // color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "GET STARTED",
                            style: TextStyle(
                              color: Colors.white,
                              // fontSize: 15.0,
                              fontSize: Dimensions.font20 -2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // SizedBox(width: 2.0),
                          SizedBox(width: 9),
                          // SizedBox(width: 18.0),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            // size: 28.0,
                            size: Dimensions.font26
                          ),
                        ],
                      ),
                    ),

                    // Spacer to create space between button and icons
                    // SizedBox(height: 15.0),
                    SizedBox(height: Dimensions.height20 -4,),

                    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            'assets/images/gdscLogo.png', // Replace with your image asset path
            height: Dimensions.height45 + 8,
            // height: 50.0,
            // width: 43.0,
            width:Dimensions.width30 + Dimensions.width15 + 2
          )
        ),
        // SizedBox(width: 7.0),
        SizedBox(width: Dimensions.width10-2,),
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            'assets/images/slider/mucg2.jpeg', // Replace with your image asset path
            // height: 50.0,
            height: Dimensions.height45 + 8,
            // width: 43.0,
            width:Dimensions.width30 + Dimensions.width15 + 2
          )
        ),
        // SizedBox(width: 7.0),
        SizedBox(width: Dimensions.width10-2,),
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            'assets/images/muista.jpg', // Replace with your image asset path
            // height: 50.0,
            height: Dimensions.height45 + 8,
            // width: 43.0,
            width:Dimensions.width30 + Dimensions.width15 + 2
          )
        ),
      ],
    ),
  


                  ],
                ),
              ),
            ),

            
          ],
        ),
      ),

      
    );
  }
}
