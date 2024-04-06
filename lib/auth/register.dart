import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mug_app/const/colors.dart';
import 'package:mug_app/services/accountAuth.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:mug_app/widgets/alert_dialog.dart';

import '../helpers/http_exceptions.dart';
import '../widgets/show_custom_snackbar.dart';

class Register_Screen extends StatefulWidget {
  static const routeName = "/register-page";
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  // bool endsWithMUCGOrMUG(String email) {
  // Define a regular expression pattern to match email addresses ending with @mucg.edu.gh or @mug.edu.gh
  bool endsWithMUCGOrMUG(String email) {
  // Define a regular expression pattern to match email addresses ending with specific domains
  final pattern = RegExp(r'@(mucg|mug|st\.mucg|st\.mug)\.edu\.gh$');

  // Use the pattern's hasMatch method to check if the email matches the pattern
  return pattern.hasMatch(email);
}
  final accountAuth = AccountAuth();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

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
  Future<void> _registration() async {
      // var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      setState(() {
        _isLoading = true;
      });

      if (name.isEmpty) {
        // showCustomSnackBar("Type in your name", title: "Name");
        _showErrorDialog("Type in your name");
      }else if (name.length > 26) {
        //showCustomSnackBar("Type in your phone number", title: "Phone number");
        _showErrorDialog("Name is too long type in a shorter name or use abbreviation where possible");
      }
       else if (phone.isEmpty || phone.length < 10) {
        //showCustomSnackBar("Type in your phone number", title: "Phone number");
        _showErrorDialog("Type in your phone number or invalid phone number");
      } else if (email.isEmpty) {
        // showCustomSnackBar("Type in your email address",
        //     title: "Email address");
        _showErrorDialog("Type in your email address");
      }else if (!GetUtils.isEmail(email)) {
        // showCustomSnackBar("Type in a valid email address",
        //     title: "Valid email address ");
        _showErrorDialog("Type in a valid email address");
      } else if (!endsWithMUCGOrMUG(email)) {
        // showCustomSnackBar("Type in a valid email address",
        //     title: "Valid email address ");
        _showErrorDialog("Invalid email, Please use your MUG student email");
      } else if (password.isEmpty) {
        //showCustomSnackBar("Type in your password", title: "password");
        _showErrorDialog("Type in your password");
      } else if (password.length < 6) {
        // showCustomSnackBar("Password can not be less thabn six characters",
        //     title: "Password");
        _showErrorDialog("Password can not be less than 6 characters");
      } else {
        try {
          await accountAuth.register(email:email, name:name,password:password,phone:phone);
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
          //                 return CustomAlertDialog(icon:Icons.check_circle_outline,color:Colors.green,title:'Registeration successful!', subtitle: 'An email with a verification link has been sent to $email!, please verify and login',);
          //               },
          //             );
          showCustomSnackBar(
              "Welcome $name, your registration was successful! Please verify your email! Then come back to Login",
              title: "Successful",
              isError: false,
              duration: 10);
          Navigator.of(context).pushReplacementNamed("/login-page");
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
                          Text("Sign-up",
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
                              hintText: "Password",
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
                                _registration();
                                // print(" email: " + emailController.text);
                                // print(" Name :" + nameController.text);
                                // print( "Phone :"+ phoneController.text);
                                // print("Password: "+ passwordController.text);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.mainColor
                              ),

                              child: Padding(
                                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                               padding: EdgeInsets.symmetric(vertical:Dimensions.height20 -3),
                                child: Text(
                                  "Register",
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
                            Navigator.of(context).pushReplacementNamed("/login-page");
                            // Get.toRepl(() => Login_Screen(),
                            // transition: Transition.fadeIn);
                          },
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: Dimensions.font20-1, color:Colors.black),
                              children: <TextSpan>[
                                TextSpan(text : "You have account? "),
                                 TextSpan(
                                      text: 'Click here to login ',
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