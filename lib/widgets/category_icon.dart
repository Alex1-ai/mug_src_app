import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/colors.dart';
import '../utils/app_constants.dart';

class CategoryIcon extends StatefulWidget {
  final String catTitle;
  final IconData icon;
  const CategoryIcon({super.key, required this.catTitle, required this.icon});

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {
  bool _isLoading =false;

  final Uri _urlCanteen = Uri.parse(AppConstants.MUG_CANTEEN_PAGE);
  final Uri _urlCheckResult = Uri.parse(AppConstants.MUG_CHECK_RESULT);
  Future<void> _launchUrl(url) async {
      setState(() {
      _isLoading = true;
    });

      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
        }

    // if (await canLaunch(_url)) {
    //   await launch(_url);
    // } else {
    //   // Handle error
    // }

    setState(() {
      _isLoading = false;
    });
  }

  // showLoading(){
  //   return showDialog(context: context,
  //                             //barrierDismissible: false,
  //                              builder: (BuildContext context){
  //                                 return Center(
  //                                   child: CircularProgressIndicator(),
                                    
  //                                   );

  //                              });
  // }
  @override
  Widget build(BuildContext context) {
    
    return 
    // _isLoading?Center(child: CircularProgressIndicator(),):
Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          // color: Colors.blue[100],
                          color: AppColors.catBgColor,
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          // borderRadius: new BorderRadius.circular(15),
                          borderRadius: new BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if(widget.catTitle.toLowerCase() == "order-food" || widget.catTitle.toLowerCase() == "result" ){
                            // if(widget.catTitle.toLowerCase() == "order-food" || widget.catTitle.toLowerCase()=="timetable"){
                                  print("Entering the lauching screen");
                                  // BUILDING A CUSTOM LOADER
                                  
                                  
                                _isLoading?  showDialog(context: context,
                                  //barrierDismissible: false,
                                  builder: (BuildContext context){
                                      return Center(
                                        child: CircularProgressIndicator(),
                                        
                                        );

                                  }):SizedBox();
                                  if(widget.catTitle.toLowerCase() == "order-food" ){
                                    _launchUrl(_urlCanteen);

                                  }
                                  else{
                                    _launchUrl(_urlCheckResult);
                                  }
                              
                              // const url = "https://alexis.onrender.com/";
                              // const url =  "alexis.onrender.com";

                              // final Uri uri = Uri(scheme: "https", host:url);
                              // if(!await launchUrl(uri,mode:LaunchMode.externalApplication )){
                              //   print("Can not lauch url");
                              // }
                              

                            }else{
                               Get.toNamed("/${widget.catTitle.toLowerCase()}");
                            }
                          },
                          icon: Icon(widget.icon),
                          // iconSize: 35,
                          iconSize: Dimensions.font20 + Dimensions.font16,
                          // color: Colors.blue[900],
                          color: AppColors.appBarColor,
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),f
                      SizedBox(height: Dimensions.height10 + 2.5,),
                      Text(
                        widget.catTitle,
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]);
  }
}