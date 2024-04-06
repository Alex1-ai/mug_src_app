import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import '../const/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';



class PDFViewerFromUrl extends StatelessWidget {
  const PDFViewerFromUrl({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.appBarColor ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Exam -", style: TextStyle(
              color: Colors.white
            ),),
            BigText(text: " TimeTable", 
              //color:Colors.black
              color: AppColors.mugTopIconColor
            ),
          ],
        ),
        actions: [

            Container(
              //color:Colors.red,
                 //margin: EdgeInsets.all(10, ),
                margin: EdgeInsets.all(Dimensions.width10+1.7),
                child: IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.notifications_active,
                     //size:25.0,
                    size:Dimensions.font26 ,
                      
                    ),
                    ),
                    
                    ),
          ],
        centerTitle: true,
      ),
      body: const PDF().fromUrl(
        url,
        placeholder: (double progress) => Center(
          child: CircularProgressIndicator()
          ),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
    );
  }
}