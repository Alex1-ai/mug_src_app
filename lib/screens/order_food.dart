import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const/colors.dart';
import '../utils/app_constants.dart';

class OrderFoodScreen extends StatefulWidget {
  static const routeName = "/order-food";
  const OrderFoodScreen({super.key});

  @override
  State<OrderFoodScreen> createState() => _OrderFoodScreenState();
}

class _OrderFoodScreenState extends State<OrderFoodScreen> {
  WebViewController webViewController = WebViewController();
   //bool _loading = true;
   String blogUrl = AppConstants.MUG_CANTEEN_PAGE;
  //String blogUrl = "https://library.mug.edu.gh/";

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,),
            color:Colors.black,
            onPressed: () {
              // Add logic here to navigate back to the previous page
              Navigator.pop(context);
            },
          ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle : true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MUG - ", style: TextStyle(
              color: Colors.black
            ),),
            Text("Canteen ", style:TextStyle(
              //color:Colors.black
              color: AppColors.mugTopIconColor
            )),
          ],
        ),
        actions:[
          Opacity(
            opacity:0,
            child: Container(
              padding:EdgeInsets.symmetric(horizontal:16),
              child:Icon(Icons.save)
            )

          )
        ]
        

      ),





      body: 
       Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      child: 
      
       WebViewWidget(

            
            controller: webViewController
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onNavigationRequest:(navigation){
                    if(navigation.url != blogUrl){
                      // return NavigationDecision.prevent;
                      
                    }
                    return NavigationDecision.navigate;
                  },
                  // onPageStarted: (String blogUrl){

                  //   setState((){
                  //     _loading = true;
                  //   });
                    
                  // },
                  // onPageFinished: (String blogUrl){
                  //   setState((){
                  //     _loading = false;
                  //   });
                  // },
                ),
                
              )
              
              ..loadRequest(Uri.parse(blogUrl),

              ),
              
              ),
      // child: WebViewWidget(

      // ),
    ),

    );
  }
}