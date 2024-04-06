import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mug_app/widgets/alert_dialog.dart';
import 'package:mug_app/widgets/show_custom_snackbar.dart';

import '../services/accountAuth.dart';

class Login_Screen extends StatefulWidget {
  static const routeName = "/login-page";
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
 final accountAuth = AccountAuth();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool _obscureText =true;
  bool _isLoading = false;
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
    // showDialog(
    //     context: context,
    //     builder: (ctx) => AlertDialog(
    //           title: Text("Error Message"),
    //           content: Text(message),
    //           actions: [
    //             TextButton(
    //                 onPressed: () {
    //                   Navigator.of(ctx).pop();
    //                 },
    //                 child: Text("OK"))
    //           ],
    //         ));
  }

  Future<void> _login() async {
      // var authController = Get.find<AuthController>();
      // String name = nameController.text.trim();
      // String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      setState(() {
        _isLoading = true;
      });
      if (email.isEmpty) {
        // showCustomSnackBar("Type in your name", title: "Name");
        _showErrorDialog("Email is required!");
      }else if(password.isEmpty){
        _showErrorDialog("Password  is required!");

      }else if(password.length < 6){
        _showErrorDialog("Password  is incorrect, please input correct password!");

      }else if (!GetUtils.isEmail(email)) {
        // showCustomSnackBar("Type in a valid email address",
        //     title: "Valid email address ");
        _showErrorDialog("Invalid Email, type in a valid  email address");
      }

      else{
       try {

          final User user = await accountAuth.login(email:email, password:password);
          print(" Entering user email ${user}");

          // final User user = userCredential.user!;

          if (user.emailVerified) {
            // User is logged in and email is verified
            // Proceed with your logic (e.g., navigate to another page)
            Navigator.of(context).pushReplacementNamed("/bottom-nav");
            showCustomSnackBar(
              "Welcome $email",
              title: "Successful",
              isError: false,
              duration: 10);
          } else {
            // User is logged in but email is not verified
            _showErrorDialog("Please verify your email before logging in.");
          }
    } catch (error) {
      _showErrorDialog("Login failed.Either check your internet connection or  inValid email or password.");

        // await auth.signInWithEmailAndPassword(
        //   email: email,
        //   password: password
        //   );


      }
    }
    setState(() {
      _isLoading=false;

    } );




  }

  @override
  Widget build(BuildContext context) {

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
                          Text("Sign-in",
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


                  Text("Welcome to SRC (MUG) App",
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
                              hintText: "Enter School E-mail",
                              prefixIcon: Icon(
                                Icons.email,
                                color:AppColors.inputIconColor
                              ),
                            ),
                          ),

                        //SizedBox(height: 20,),
                        SizedBox(height: Dimensions.height20 + 2,),

                        TextField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            //keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((Dimensions.height10-2)),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: AppColors.inputColor,
                              hintText: "Enter Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color:AppColors.inputIconColor
                              ),

                              suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;

                                        });
                                      },
                                      child: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                      ),
                                    ),
                            ),
                          ),
                          // SizedBox(height:10),
                          SizedBox(height: Dimensions.height10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [


                              GestureDetector(
                                onTap: (){
                                  // print("forget button clicked");
                                  Get.toNamed("/reset-password");


                                },
                                child: Text("Forgot your password?",
                                style: TextStyle(
                                  fontSize: 17,
                                  color:AppColors.mainColor,
                                  decoration: TextDecoration.underline,
                                ),
                                ),
                              ),
                            ],
                          ),

                           //SizedBox(height: 50.0,),
                          SizedBox(height: Dimensions.height30 + Dimensions.height20 + 8,),

                          _isLoading?Center(
                            child:CircularProgressIndicator()
                          )
                          :Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: (){
                                // print("email: "+ emailController.text );
                                // print("password: "+ passwordController.text);
                                _login();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.mainColor
                              ),

                              child: Padding(
                                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                               padding: EdgeInsets.symmetric(vertical:Dimensions.height20 -3),
                                child: Text(
                                  "Login",
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
                            Navigator.of(context).pushReplacementNamed("/register-page");
                            // Get.to(() => Register_Screen(),
                            // transition: Transition.fadeIn);
                            // Get.toNamed('/register-page');
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize:Dimensions.font20-2, color:Colors.black),
                              children: <TextSpan>[
                                TextSpan(text : "You don't have account? "),
                                 TextSpan(
                                      text: 'Click here to register ',
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