import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  ArticleView({super.key, required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isLoading = true;
  WebViewController webViewController = WebViewController();
  
  //String get imageUrl => this.imageUrl;
  @override
  Widget build(BuildContext context) {
    

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
            Text("News - ", style: TextStyle(
              color: Colors.black
            ),),
            Text("App ", style:TextStyle(
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





      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      child:  WebViewWidget(

            
            controller: webViewController
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onNavigationRequest:(navigation){
                    if(navigation.url != widget.blogUrl){
                      // return NavigationDecision.prevent;
                      
                    }
                    return NavigationDecision.navigate;
                  },
                  // onPageStarted: (String blogUrl){

                  //   setState((){
                  //     _isLoading = true;
                  //   });
                    
                  // },
                  // onPageFinished: (String blogUrl){
                  //   setState((){
                  //     _isLoading = false;
                  //   });
                  // },
                ),
                
              )
              
              ..loadRequest(Uri.parse(widget.blogUrl),

              ),
              
              ),
      // child: WebViewWidget(

      // ),
    ),

    );
  }
}