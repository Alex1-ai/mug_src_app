import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/services/accountAuth.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mug_app/widgets/alert_dialog.dart';



class ResetPassword extends StatefulWidget {
  static const routeName = "/reset-password";
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final accountAuth =  AccountAuth();
  bool _isLoading = false;
  var emailController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  void _showErrorDialog(String message) {
    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                           icon:Icons.cancel_outlined,
                            //icon:Icons.warning,
                          color:Colors.red,title:' Error Message! ', subtitle: '${message}.',);
                        },
                      );
  }

  Future<void> _resetPassword() async {
    setState(() {
        _isLoading = true;
      });
    String email = emailController.text.trim();
    if (email.isEmpty) {
        // showCustomSnackBar("Type in your name", title: "Name");
        _showErrorDialog("Email is required!");
        return;
      }

    try {
      // await _auth.sendPasswordResetEmail(email: email);
      await accountAuth.resetPassword(email);
      // Show a success message or navigate to a confirmation screen
      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(icon:Icons.check_circle_outline,color:Colors.green,title:'Password Reset!', subtitle: 'An email with a password reset link has been sent to $email!',);
                        },
                      );
      Navigator.popAndPushNamed(context, '/login-page');
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title:  Text('Password Reset'),
      //       content: Text('An email with a password reset link has been sent to $email.'),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.popAndPushNamed(context, '/login-page');
      //             // Navigate to login page or another appropriate screen
      //             // Navigator.pushNamed(context, )
      //           },
      //           child: Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        // Handle the error when the email is not found as registered
        _showErrorDialog("The email address is not registered. Please register first.");
      } else {
        // Handle other errors
        _showErrorDialog("An error occurred. Please try again later.");
      }
    }

    setState(() {
        _isLoading = false;
      });
  }
  @override
  Widget build(BuildContext context) {
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
                          Text("Reset",
                          style: TextStyle(
                            color: Colors.white,
                            //fontSize: 46.0,
                            fontSize: Dimensions.font20 + Dimensions.font26 + 3,
                            fontWeight: FontWeight.w800,
                          ),
                          ),


                          // ClipRRect(
                          //         borderRadius: BorderRadius.circular(Dimensions.width30 ), // Adjust the value as per your preference
                          //         child: Image.asset(
                          //           'assets/images/mucg2.jpeg',
                          //           width: Dimensions.width30 + Dimensions.width30 + Dimensions.width20 + Dimensions.width10 - 1 , // Adjust the width as per your preference
                          //           //height: 80, // Adjust the height as per your preference
                          //           height: Dimensions.height30 + Dimensions.height30 + Dimensions.height20 + Dimensions.height10 -1,
                          //           fit: BoxFit.fill,
                          //         ),
                          //       )

                        ],
                      ),
                  // SizedBox(height: 10.0,),
                  SizedBox(height: Dimensions.height10,),

                     
                  Text("Welcome to MUG (SRC) App",
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
                           Padding(
                            padding:  EdgeInsets.only(bottom: Dimensions.height20),
                            child: Text(
                              'Enter Email ',
                              style: TextStyle(
                                fontSize: Dimensions.font26,
                              fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                //borderRadius: BorderRadius.circular(8.0),
                                borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.inputColor,
                              hintText: "E-mail",
                              prefixIcon: Icon(
                                Icons.email,
                                color:AppColors.inputIconColor
                              ),
                            ),
                          ),

                        //SizedBox(height: 20,),
                        SizedBox(height: Dimensions.height20 + 2,),

                        // TextField(
                        //     controller: passwordController,
                        //     obscureText: _obscureText,
                        //     //keyboardType: TextInputType.visiblePassword,
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                        //         borderSide: BorderSide.none,
                        //       ),
                        //       filled: true,
                        //       fillColor: AppColors.inputColor,
                        //       hintText: "Password",
                        //       prefixIcon: Icon(
                        //         Icons.lock,
                        //         color:AppColors.inputIconColor
                        //       ),

                        //       suffixIcon: GestureDetector(
                        //               onTap: () {
                        //                 setState(() {
                        //                   _obscureText = !_obscureText;
                                          
                        //                 });
                        //               },
                        //               child: Icon(
                        //                 _obscureText ? Icons.visibility : Icons.visibility_off,
                        //               ),
                        //             ),
                        //     ),
                        //   ),
                        //   // SizedBox(height:10),
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
                          SizedBox(height: Dimensions.height30 + Dimensions.height20 + 8,),

                          _isLoading? const Center(
                            child:CircularProgressIndicator()
                          )
                          :Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                                print("email: "+ emailController.text );
                                _resetPassword();
                                // print("password: "+ passwordController.text);
                                // _login();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.mainColor
                              ),
                               
                              child: Padding(
                                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                               padding: EdgeInsets.symmetric(vertical:Dimensions.height20 -3),
                                child: Text(
                                  "Reset Password",
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
                            print("Login button pressed");
                            Navigator.of(context).pop();
                            // Get.to(() => Register_Screen(),
                            // transition: Transition.fadeIn);
                            // Get.toNamed('/register-page');
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize:Dimensions.font20-2, color:Colors.black),
                              children: <TextSpan>[
                                TextSpan(text : "You want to navigate backward? "),
                                 TextSpan(
                                      text: 'Click here to go back ',
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