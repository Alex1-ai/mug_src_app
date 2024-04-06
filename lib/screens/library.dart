import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/widgets/big_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/app_constants.dart';

class LibraryScreen extends StatefulWidget {
  static const routeName = "/library";
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();
    bool isLoading =false;
    String blogUrl = AppConstants.MUG_LIBRARY_PAGE;
    void onProgress(Progress progress) {
    setState(() {
      isLoading = true;
    });
  }

  //   @override
  // void dispose() {
  //   // TODO: implement dispose
  //   webViewController.dispose();
  //   super.dispose();

  // }
    return Scaffold(
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
            Text("MUG -", style: TextStyle(
              color: Colors.black
            ),),
            BigText(text: " Library", 
              //color:Colors.black
              color: AppColors.mugTopIconColor
            ),
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
       Stack(
         children: [
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
                      // onProgress: ,
                      // onPageStarted: (String blogUrl){

                      //   setState((){
                      //     isLoading = true;
                      //   });
                        
                      // },
                     
                      onPageFinished: (String blogUrl){
                        // setState((){
                        //   isLoading = false;
                        // });
                      },
                    ),
                    
                  )
                  
                  ..loadRequest(Uri.parse(blogUrl),

                  ),
                  
                  ),
      // child: WebViewWidget(

      // ),
    ),
     
       isLoading ? Center( child: CircularProgressIndicator(),)
                    : Stack(),
         ],
       ),

    );
  }
}