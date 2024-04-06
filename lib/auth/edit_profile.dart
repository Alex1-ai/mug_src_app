import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/services/accountAuth.dart';
import 'package:mug_app/helpers/http_exceptions.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:mug_app/widgets/alert_dialog.dart';
import 'package:mug_app/widgets/show_custom_snackbar.dart';
import 'package:provider/provider.dart';

import '../providers/user_profile_notify.dart';



class EditProfile extends StatefulWidget {
  static const routeName = "/edit-profile-page";
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> validLevels = ["100", "200", "300", "400", "500", "600"];
  final accountAuth = AccountAuth();
  final auth = FirebaseAuth.instance;
  var levelController = TextEditingController();

  var courseController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();
  bool _obscureText =true;
  // bool _obscureText2 = true;
  bool _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                           icon:Icons.cancel_outlined,
                            //icon:Icons.warning,
                          color:Colors.red,title:' Error Message! ', subtitle: '${message}.');
                        },
                      );
  }

  @override
  Widget build(BuildContext context) {
    
  final userProfile = Provider.of<UserProfileProvider>(context);
    Future<void> _updateProfile() async {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String level = levelController.text.trim();
      String course = courseController.text.trim();
      
      setState(() {
        _isLoading = true;
      });

      if (name.isEmpty) {
        // showCustomSnackBar("Type in your name", title: "Name");
        _showErrorDialog("Type in your name");
      } else if (name.length > 26) {
        //showCustomSnackBar("Type in your phone number", title: "Phone number");
        _showErrorDialog("Name is too long type in a shorter name or use abbreviation where possible");
      }else if (phone.isEmpty || phone.length < 10) {
        //showCustomSnackBar("Type in your phone number", title: "Phone number");
        _showErrorDialog("Enter in your phone number or invalid phone number");
      } else if (level.isEmpty) {
        // showCustomSnackBar("Type in your email address",
        //     title: "Email address");
        _showErrorDialog("Type in your level e.g 100 or 200");
      } else if (int.tryParse(level)==null) {
        // showCustomSnackBar("Type in your email address",
        //     title: "Email address");
        _showErrorDialog("Type in your level it should be a numbers only e.g 100 or 200");
      } else if (!validLevels.contains(level)) {
        _showErrorDialog("Invalid level. Valid levels are 100, 200, 300, 400, 500, or 600");
      } else if (course.isEmpty) {
        //showCustomSnackBar("Type in your password", title: "password");
        _showErrorDialog("Course you are studing is required");
      } else if (course.length > 33) {
        //showCustomSnackBar("Type in your phone number", title: "Phone number");
        _showErrorDialog("Course is too long type in a shorter name or use abbreviation where possible");
      }else {
        try {
          // Get the current user's UID
          // String uid = auth.currentUser!.uid;
          await userProfile.updateUserProfile(level:level, name:name,course:course,phone:phone);
          // final auth = FirebaseAuth.instance;
          // await auth.createUserWithEmailAndPassword(
          //   email: email, password: password,
          //   );
          // // await Provider.of<Auth>(context, listen: false)
          // //     .signup(email, password);

          // // Send email verification link
          // await auth.currentUser!.sendEmailVerification();

          
          // Navigator.of(context).pushReplacementNamed("/login-page");
          // showDialog(
          //               context: context,
          //               builder: (BuildContext context) {
          //                 return CustomAlertDialog(icon:Icons.check_circle_outline,color:Colors.green,title:'Updated successful!', subtitle: 'Your profile has been updated successfully!',);
          //               },
          //             );
          Navigator.of(context).pop();
          showCustomSnackBar(
              "Profile is successfuly updated !",
              title: "Success message",
              isError: false,
              duration: 10);
          // showCustomSnackBar(
          //     "Welcome $name, your registration was successful! Login Now!",
          //     title: "Successful",
          //     isError: false,
          //     duration: 10);
        } on HttpException catch (error) {
          var errorMessage = "Authentication failed";
          if (error.toString().contains("EMAIL_EXISTS")) {
            errorMessage =
                "This email address already exists. please try with another email";
          } else if (error.toString().contains('INVALID_EMAIL')) {
            errorMessage = "This is not a valid email address";
          } else if (error.toString().contains('WEAK_PASSWORD')) {
            errorMessage = "This password is too weak. try a stronger password";
          } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
            errorMessage = "Could not find a user with that email.";
          } else if (error.toString().contains('INVALID_PASSWORD')) {
            errorMessage = "Invalid password. ";
          }
          // showCustomSnackBar(errorMessage);
          _showErrorDialog(errorMessage);
        } catch (error) {
          var errorMessage =
              "Could not authenticate you. Please check your internet connection and try again later.";
          //showCustomSnackBar(errorMessage);
          _showErrorDialog(errorMessage);
        }
      }
      setState(() {
        _isLoading = false;
      });
    }



    
//    print(_obscureText);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 AppColors.mainColor,
                 AppColors.mainColor2
            ],
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
            
            )
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex:2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height30 + (Dimensions.height30 /2), horizontal: Dimensions.width20 + (Dimensions.width20/2),     //36     //24
                    //vertical: 36, horizontal: 24,     //36     //24
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Profile",
                          style: TextStyle(
                            color: Colors.white,
                            //fontSize: 46.0,
                            fontSize: Dimensions.font20 + Dimensions.font26 + 3,
                            fontWeight: FontWeight.w800,
                          ),
                          ),


                          // ClipRRect(
                          //         borderRadius: BorderRadius.circular(30.0), // Adjust the value as per your preference
                          //         child: Image.asset(
                          //           'assets/images/mucg2.jpeg',
                          //           width: 80, // Adjust the width as per your preference
                          //           height: 80, // Adjust the height as per your preference
                          //           fit: BoxFit.cover,
                          //         ),
                          //       )
                        ],
                      ),
                  // SizedBox(height: 10.0,),
                  SizedBox(height: Dimensions.height10,),

                     
                  Text("Edit and update your profile",
                            style: TextStyle(
                              color: Colors.white,
                              //fontSize: 22.0,
                              fontSize: Dimensions.font20 + 4,
                              fontWeight: FontWeight.w300,
                      ),),
                      

                  ]),
                  
                  )
                ),


                Expanded(
                  flex:5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                           Dimensions.font20 + Dimensions.font20
                          ),
                        topRight: Radius.circular(
                          Dimensions.font20 + Dimensions.font20
                          )
                      )

                    ),
                    child: Padding(
                      //padding: EdgeInsets.all(24.0),
                      padding: EdgeInsets.all(Dimensions.font26-3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          TextField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                //borderRadius: BorderRadius.circular(8.0),
                                borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.inputColor,
                              hintText: "Full-Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color:AppColors.inputIconColor
                              ),
                            ),
                          ),

                        //SizedBox(height: 20,),
                        SizedBox(height: Dimensions.height20 + 2,),
                          TextField(
                            controller: courseController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                //borderRadius: BorderRadius.circular(8.0),
                                borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.inputColor,
                              hintText: "Course",
                              prefixIcon: Icon(
                                Icons.school,
                                color:AppColors.inputIconColor
                              ),
                            ),
                          ),

                        //SizedBox(height: 20,),
                        SizedBox(height: Dimensions.height20 + 2,),

                        // SizedBox(height: Dimensions.height20 + 2,),
                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                //borderRadius: BorderRadius.circular(8.0),
                                borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.inputColor,
                              hintText: "Phone-number",
                              prefixIcon: Icon(
                                Icons.phone,
                                color:AppColors.inputIconColor
                              ),
                            ),
                          ),



                           SizedBox(height: Dimensions.height20 + 2,),

                        TextField(
                            controller: levelController,
                            keyboardType: TextInputType.number,
                            // obscureText: _obscureText,
                            //keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.inputColor,
                              hintText: "which Level? ",
                              prefixIcon: Icon(
                                // Icons.lock,
                                Icons.leaderboard,
                                color:AppColors.inputIconColor
                              ),

                              // suffixIcon: GestureDetector(
                              //         onTap: () {
                              //           setState(() {
                              //             _obscureText = !_obscureText;
                                          
                              //           });
                              //         },
                              //         child: Icon(
                              //           _obscureText ? Icons.visibility : Icons.visibility_off,
                              //         ),
                                   // ),
                            ),
                          ),
                          // SizedBox(height:10),
                          SizedBox(height: Dimensions.height10,),

                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [


                          //     GestureDetector(
                          //       onTap: (){
                          //         print("forget button clicked");
                          //       },
                          //       child: Text("Forgot your password?",
                          //       style: TextStyle(
                          //         fontSize: 17,
                          //         color:AppColors.mainColor,
                          //         decoration: TextDecoration.underline,
                          //       ),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                           //SizedBox(height: 50.0,),
                          SizedBox(height: Dimensions.height30 + Dimensions.height15,),

                          _isLoading? const Center(
                            child: CircularProgressIndicator()
                          )
                          :Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                                
                                print(" level: " + levelController.text);
                                print(" Name :" + nameController.text);
                                print( "Phone :"+ phoneController.text);
                                print("Department: "+ courseController.text);
                                _updateProfile();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.mainColor
                              ),
                               
                              child: Padding(
                                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                               padding: EdgeInsets.symmetric(vertical:Dimensions.height20 -3),
                                child: Text(
                                  "Save Profile",
                                  style: TextStyle(
                                    color:Colors.white,
                                    //fontSize: 16.0,
                                    fontSize: Dimensions.font20,
                                  ),
                                ),
                                ),
                                ),


                          ),

                          //SizedBox(height: 20.0,),

                          SizedBox(height: Dimensions.height20 + 2,),
                        


                        GestureDetector(
                          onTap: (){
                            print("register button pressed");
                            Navigator.of(context).pop();
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: Dimensions.font20-1, color:Colors.black),
                              children: <TextSpan>[
                                TextSpan(text : "Navigate back to profile page? "),
                                 TextSpan(
                                      text: 'Click here to go back',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:AppColors.mainColor,
                                        fontSize: Dimensions.font20,
                                      decoration: TextDecoration.underline,
                                          ),
                                        ),
                            
                        
                              ]
                            ),
                          
                          
                          ),
                        ),
            












                          
                          
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
         
      ),
    );
}
}