import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:mug_app/widgets/big_text.dart';

class Contributors extends StatelessWidget {
  static const routeName="/contributors";
  const Contributors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.inputColor,
      body: Column(
        children: [
          Container(
            height: Dimensions.height45 * 1.9,
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(Dimensions.height10 + Dimensions.height15 + 10),
                bottomRight:
                    Radius.circular(Dimensions.height10 + Dimensions.height15 + 10),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BigText(
                      text: "List Of Contributors",
                      color: Colors.white,
                      size: Dimensions.font26,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add your terms and conditions content here
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "* ORIYOMI OLUWATOSIN",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  SizedBox(height: Dimensions.height10), // Add spacing if needed


                  Text(
                    "* CECIL JOSEPH",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                 
                  
                  SizedBox(height: Dimensions.height10), // Add spacing if needed

                  Text(
                    "* GERALD CLINTON",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                 
                  
                  SizedBox(height: Dimensions.height10), 
                  Text(
                    "* PRINCE HAGAN",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                 
                  
                  SizedBox(height: Dimensions.height10), 

                  Text(
                    "* ATIAVOR GIDEON KOFI",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  
                  SizedBox(height: Dimensions.height10), // Add spacing if needed

                 Text(
                    "* GRACE ABUNOW",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  
                  SizedBox(height: Dimensions.height10), 
                  
                 Text(
                    "* ANSAH-YHALLEY JOSHUA",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  
                  SizedBox(height: Dimensions.height10), 

                  Text(
                    "* STEPHANIE AKABUOGU",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  
                  SizedBox(height: Dimensions.height10), 

                  Text(
                    "* ONEDIBE EMMANUEL",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  
                  SizedBox(height: Dimensions.height10), 

                  Text(
                    "* EMMANUEL AMEHO KOKU",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                  
                  
                  SizedBox(height: Dimensions.height10), 
                  Text(
                    "* IDAHOSA UYIOSA PRAISE",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                 
                  
                  SizedBox(height: Dimensions.height10), // Add spacing if needed

                // SizedBox(height: Dimensions.height10), 
                  Text(
                    "* MATTHEW PRINCESS CHIKODINAKA",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),

                   SizedBox(height: Dimensions.height10), // Add spacing if needed

                // SizedBox(height: Dimensions.height10), 
                  Text(
                    "* RICHARD NII LANTE LAWSON",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      // fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                    ),
                  ),
                 
                  
                  SizedBox(height: Dimensions.height10), 


                
                  

                  
                  SizedBox(height: Dimensions.height10), // Add spacing if needed

                  
                  Text(
                    "If you have any questions or concerns regarding these List Of Contributors or the MUG SRC Info System, please contact:",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "Methodist University College Ghana (MUCG)",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "Student Representative Council (SRC)",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  // Customize contact information below as needed

                  Text(
                    "mugsrc@gmail.com",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                  SizedBox(height: Dimensions.height10), // Add spacing if needed

                  Text(
                    "By using the MUG SRC Info System, you agree to these Terms and Conditions. If you do not agree with any part of these terms, please refrain from using the system.",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),
                  Text(
                    "12th November 2024",
                    style: TextStyle(fontSize: Dimensions.font16),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );

    
  }
}