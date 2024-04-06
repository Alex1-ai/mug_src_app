import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/app_constants.dart';
import '../widgets/big_text.dart';

class GalleryScreen extends StatefulWidget {
  static const routeName = "/gallery";
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool isLoading = true;
  //final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController();
    String blogUrl = AppConstants.MUG_GALLERY_PAGE;
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
            BigText(text: " Gallery", 
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
         children:[
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
                    onPageFinished: (String blogUrl){
                      setState((){
                        isLoading = false;
                      });
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
         ]
       ),


    );
  }
}