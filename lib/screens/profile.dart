import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/services/accountAuth.dart';
import 'package:mug_app/providers/user_profile_notify.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:mug_app/widgets/profile_widget.dart';
import 'package:mug_app/widgets/show_custom_snackbar.dart';
import 'package:mug_app/widgets/small_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../widgets/alert_dialog.dart';
import 'terms_condition.dart';

// PROFILE SCREEN                                            import 'dart:io';



class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();
  }
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
  final accountAuth = AccountAuth();
  // getting the user id

  Future<void> _deleteAccount() async {
  try {
    String? userId = accountAuth.getUserId();
    if (userId != null) {
      bool _loading = false; // Add this line

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return _loading?Center( child:CircularProgressIndicator()): AlertDialog(
                title: const Text("Are you sure?"),
                content: Column(
                  children: [
                    const Text(
                        "If you want to delete your account, Enter your password"),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your password',
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No"),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        _loading = true; // Show loading spinner
                      });

                      String enteredPassword = passwordController.text;
                      // Navigator.pop(context);
                      
                      await _deleteAccountMain(enteredPassword);

                      setState(() {
                        _loading = false; // Hide loading spinner
                      });
                     showCustomSnackBar(
              "Your account has been deleted successfully",
              title: "Successful",
              isError: false,
              duration: 10);
                      // Redirect the user to the login or home page
                      Navigator.of(context)
                          .pushReplacementNamed('/login-page');
                    },
                    child: const Text("Yes"),
                  ),
                ],
              );
            },
          );
        },
      );
    } else {
      print('User is not logged in');
      showCustomSnackBar(
        "User is not logged in.",
        title: "Error",
        isError: true,
        duration: 12,
      );
    }
  } catch (error) {
    showCustomSnackBar(
      "An error occurred during account deletion",
      title: "Error",
      isError: true,
      duration: 12,
    );
    print(error);
  }
}

Future<void> _deleteAccountMain(password) async {
  try {
    String? userId = accountAuth.getUserId();
    if (userId != null) {
      // Call the deleteUserAccount method in AccountAuth
      await accountAuth.deleteUserAccount(userId,password);

      // Redirect the user to the login or home page
      Navigator.of(context).pushReplacementNamed('/login-page'); // Replace with your route
    } else {
      // Handle the case where the user is not logged in
      print('User is not logged in');
      showCustomSnackBar(
      "User is not logged in.",
      title: "Error",
      isError: true,
      duration: 12,
    );
      // Add your logic for handling this case, such as showing an error message
    }
  } catch (error) {
    // Handle errors during account deletion
    showCustomSnackBar(
      "An error occurred during account deletion",
      title: "Error",
      isError: true,
      duration: 12,
    );

    print(error);
  }
}
       

  Future<void> _logout() async {
    try {
      // await _auth.signOut();
      await accountAuth.logout();
      // Redirect the user to the login or home page
      Navigator.of(context).pushReplacementNamed('/login-page'); // Replace with your route
    } catch (error) {
      // // Handle logout errors
      // Navigator.of(context).pushReplacementNamed("/login-page");
          // Navigator.of(context).pushReplacementNamed("/login-page");
        
          showCustomSnackBar(
              "An Error Occured ",
              title: "Error",
              isError: true,
              duration: 12);

          print(error);
    }
  }
  @override
  Widget build(BuildContext context) {
   
    final userProfileProvider = Provider.of<UserProfileProvider>(context);

     print("UserProfile ${userProfileProvider.userProfile}");
     final userProfile = userProfileProvider.userProfile;

    // if (userProfile != null) {
    //     print("UserProfile:");
    //     print("Email: ${userProfile.email}");
    //     print("Name: ${userProfile.name}");
    //     print("Course: ${userProfile.course}");
    //     print("Level: ${userProfile.level}");
    //     print("Phone: ${userProfile.phone}");
    //     print("Profile Image: ${userProfile.profileImage}");
    // } else {
    //     print("User profile is null");
    //   }

      // final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> pickAndUploadImage() async {
      
      final String? userId = accountAuth.getUserId() ;
      // String uid = auth.currentUser!.uid;
      final picker = ImagePicker();
      setState(() {
        _isLoading = true;
      });

      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      
      if (userId != null) {
            if (pickedFile != null) {
                  final imageFile = File(pickedFile.path);

                  try {
                    // final imageUrl = await accountAuth.uploadUserProfileImage(imageFile, userId);
                    final imageUrl = await userProfileProvider.updateUserProfileImage(imageFile, userId, userProfile!.profileImage??"");
                    print('Image uploaded successfully: $imageUrl');
                    showCustomSnackBar(
                  "Profile Image updated successfully!",
                  title: "Success message",
                  isError: false,
                  duration: 10);
                  } catch (e) {
                    print('Error uploading image: $e');
                    showCustomSnackBar(
                  "Error occured while uploading image!",
                  title: "Error messae",
                  isError: true,
                  duration: 10);
                    // Handle the error as needed
                  }
      } else {
        // User canceled the image picker
        
        print("did not chose the image");
      }
      } else {
              // Handle the case where the user is not logged in
        print('please login first please ');
        _showErrorDialog("Please login and retry again!!");
        Navigator.pushReplacementNamed(context, "/login-page");
                            
                            
                            
                            
                            
                            
  }

  setState(() {
    _isLoading = false;
  });

  
}


    return Scaffold(
      appBar: AppBar(
       
        backgroundColor:AppColors.appBarColor ,
        elevation: 0,
      ),
       backgroundColor: AppColors.inputColor,
       body: Column(
        children: [
          Container(
            //height: 270,
            height: Dimensions.screenHeight * 0.3,
            decoration: BoxDecoration(
             color: AppColors.appBarColor,
             //color: Colors.r,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
           bottomRight: Radius.circular(40.0),
    ),
  ),
         child: Column(
           children: [
            

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                 Container(
                             // margin: EdgeInsets.only(top:Dimensions.height45 - 38),
                             margin:EdgeInsets.only(top: Dimensions.height10/ 2),
                                //width: 70.0,
                                width:(Dimensions.width20*3) + Dimensions.width10 + 6+20 ,
                              height: (Dimensions.height20*3) + Dimensions.height10 + 6+ 20,
                                //height:70.0,
                                decoration: BoxDecoration(
                                  //color: Color(0xFF00B686),
                                  boxShadow: [
                                    BoxShadow(
                                      //color:Colors.black.withOpacity(.1),
                                      color: Colors.black.withOpacity(.1),
                                      blurRadius: 8,
                                      spreadRadius: 3,
                                    )
                                  ],
                                  border: Border.all(
                                    width: 2.5,
                                    color:AppColors.whiteColor,
                                  ),
                                  // borderRadius: BorderRadius.circular(40.0),
                                  borderRadius: BorderRadius.circular((Dimensions.radius30 + Dimensions.radius15)),
                                ),
                                //padding: EdgeInsets.all((Dimensions.radius20/4) + 1 ),
                                //padding: EdgeInsets.all(5 ),
                                child:(userProfileProvider.userProfile?.profileImage == '' || userProfileProvider.userProfile?.profileImage == null)?
                            CircleAvatar(
                              
                              backgroundImage:  AssetImage(
                                  "assets/images/avatar/avatar1.jpg"),
                            ):
                            CircleAvatar(
                              
                              backgroundImage:  NetworkImage(
                                  userProfileProvider.userProfile?.profileImage??"N/A"),
                              child: userProfileProvider.userProfile?.profileImage == null
                              ? CircleAvatar(
                              
                              backgroundImage:  AssetImage(
                                  "assets/images/avatar/avatar1.jpg"),
                            )
                              : null, 
                              ),
                              ),



                              
              ],

             ),
             //SizedBox(width:Dimensions.width10 -2),

             // DEPARTMENT AND NAME COMPONENTS
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: Dimensions.height20,),
                  Text(
                    "${userProfileProvider.userProfile?.name ?? 'N/A'}",
                    style: TextStyle(
                     // fontSize: 15, 
                    //  fontSize:18;
                      color:AppColors.subTitleTextColor,
                      fontSize: Dimensions.font20 , 
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  //SizedBox(height:Dimensions.height10-2),
                  Text(
                    "${userProfileProvider.userProfile?.course ?? 'N/A'}",
                    style: TextStyle(
                        fontFamily: "SourceSerifLight",
                        //fontSize: 14,
                        //fontSize: 16,
                        fontSize: Dimensions.font16 + 1.8,
                        fontWeight: FontWeight.bold,
                        // color: Colors.grey[350],
                        color:AppColors.subTitleTextColor,
                        
                        ),
                  ),


                  SizedBox(height: Dimensions.height10,),

                  // UPLOADE BUTTON 
                  _isLoading?Center(child:CircularProgressIndicator())
                  : ElevatedButton.icon(
                  onPressed: () async{
                    pickAndUploadImage();
                    

                    // Add your logic for the button press here
                    // This function will be called when the button is pressed
                  },
                  icon: Icon(Icons.camera_alt_sharp),
                  label: Text("Upload profile pics"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),

                  // IconButton
                  // (onPressed: (){}, icon: Icon(Icons.camera_alt,color: AppColors.subTitleTextColor,))
                ],
              )
           ],
         ),

            
          ),


          // SizedBox(height: Dimensions.height10,),

          // Text("Checking"),
          SizedBox(height: Dimensions.height20,),
          Expanded(
            child:SingleChildScrollView(

              child: Container(
              width: MediaQuery.sizeOf(context).width,
              // height: MediaQuery.sizeOf(context).height,
              //color: Colors.red,
             // color:AppColors.inputColor ,

              child: Column(
              children: [

                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("/edit-profile-page");

                  },
                  child: ProfileWidget(
                    title: "Profile", 
                    subtitle:"Edit Profile", 
                     iconData:Icons.person_rounded,
                      clickable: true,
                      )),
                
                ProfileWidget(title: "Course Level", subtitle: "Level :${userProfileProvider.userProfile?.level ?? 'N/A'}", iconData:Icons.school, clickable: false,),
                ProfileWidget(title: "Email", subtitle:"${userProfileProvider.userProfile?.email ?? 'N/A'}" ,iconData:Icons.mark_email_read,clickable: false,),
                ProfileWidget(title: "Contact", subtitle:"${userProfileProvider.userProfile?.phone ?? 'N/A'}" , iconData:Icons.phone_in_talk_sharp, clickable: false,),

                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/reset-password");
                    

                  },
                  child: ProfileWidget(
                    title: "Reset Password?", subtitle: "Have your forgotten your password?", iconData:Icons.lock_open, clickable: true,)),
                 InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("/contributors");

                  },
                  
                  child: ProfileWidget(title: "Contributors ",subtitle: "List of contributors", iconData:Icons.people, clickable: true,)),
                
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("/terms-condition");

                  },
                  
                  child: ProfileWidget(title: "Terms & Condition",subtitle: "Have any problem contact us!", iconData:Icons.live_help, clickable: true,)),
                
                 
                InkWell(
                  onTap: () {
                    // print("Loggin out");
                     showDialog(
                                                        context: context,
                                                        builder: (ctx) =>
                                                            AlertDialog(
                                                          title: const Text(
                                                              "Are you sure ?"),
                                                          content: const Text(
                                                              "Do you want to logout?"),
                                                          actions: <Widget>[
                                                            OutlinedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  "No"),
                                                            ),
                                                            OutlinedButton(
                                                              onPressed: ()async {
                                                                
                                                                
                                                                Navigator.pop(
                                                                    context);
                                                                await _logout();
                                                              },
                                                              child: const Text(
                                                                  "Yes"),
                                                            )
                                                          ],
                                                        ),
                                                      );


                                        

                    
                    
                  },
                  child: ProfileWidget(title: "Sign Out", subtitle:"Logout from your account" , iconData:Icons.logout, clickable: true,)),

   InkWell(
                  onTap: () {
                    // print("Loggin out");
                     showDialog(
                                              context: context,
                                                        builder: (ctx) =>
                                                            AlertDialog(
                                                          title: const Text(
                                                              "Are you sure ?"),
                                                          content: const Text(
                                                              "Do you want to delete your account, all information would be lost :(?"),
                                                          actions: <Widget>[
                                                            OutlinedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: const Text(
                                                                  "No"),
                                                            ),
                                                            OutlinedButton(
                                                              onPressed: ()async {
                                                                
                                                                
                                                                Navigator.pop(
                                                                    context);
                                                                await _deleteAccount();
                                                              },
                                                              child: const Text(
                                                                  "Yes"),
                                                            )
                                                          ],
                                                        ),
                                                      );


                                        

                    
                    
                  },
                  child: ProfileWidget(title: "Delete Account", subtitle:"Delete your account" , iconData:Icons.delete, clickable: true,)),


                SizedBox(height: Dimensions.height10,),
                SmallText(text: "MUG SRC APP. V1.Directed by: Onedibe", color: const Color.fromARGB(255, 122, 118, 118),),
                SmallText(text: "contact: 0504967983",),
                
                SizedBox(height: Dimensions.height10,),
                // ProfileWidget(title: "Profile", iconData:Icons.person_rounded),
                // ProfileWidget(title: "Profile", iconData:Icons.person_rounded),

                // Padding(
                //   padding: const EdgeInsets.all(0.0),
                //   child: Card(
                    
                //       elevation: 5.0,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //       child: Container(
                //         height: Dimensions.height45 + Dimensions.height45-5,
                //         //width: 50,
                //         padding: EdgeInsets.symmetric(horizontal: 20.0),
                //         // margin: EdgeInsets.only(right: Dimensions.height10 , left: Dimensions.height10),
                //         child: Row(
                //           children: [
                //              Container(
                //                   decoration: BoxDecoration(
                //                     // color: Colors.blue,
                //                     color: AppColors.iconBackgroundColor,
                //                     borderRadius: BorderRadius.circular(25.0),
                //                   ),
                //                   // padding: EdgeInsets.all(12.0),
                //                   padding: EdgeInsets.all(Dimensions.radius15),
                //                   child: Icon(
                //                     Icons.settings,
                //                     // size: 30,
                //                     size: Dimensions.font26 +5,

                //                     color: Colors.white,
                //                   ),
                //                 ),










                //             SizedBox(width: Dimensions.width15 + 3),
                //             Text(
                //     "Settings",
                //     style: TextStyle(
                //      // fontSize: 15, 
                //     //  fontSize:18;
                //       //color:AppColors.subTitleTextColor,
                //       fontSize: Dimensions.font20 +2 , 
                //       fontWeight: FontWeight.bold,
                //       ),
                //   ),





                //           ],
                //         ),
                //       ),
                //     ),
                // ),

                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),
                // Text("Checking"),


              ],
            ) ,
         
         
            ),
            )
            
            
         
          )
        ],
      
      
      
      
      
      
      
      //here
      ),
    );
  }
}