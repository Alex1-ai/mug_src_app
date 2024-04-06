import 'package:flutter/material.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:mug_app/widgets/small_text.dart';



Widget listWidget({String? title, String? description, String? date,  }){
  return Container(
    //height: 140,
    height:( Dimensions.height20 * 5) + Dimensions.height45 + 10,
    child: Card(
      
      elevation: 3.0,
      
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        // topRight: Radius.circular(20.0),
        // bottomRight: Radius.circular(20.0),
      ),
    ),
      // margin: EdgeInsets.only(bottom:2.0),
      margin: EdgeInsets.only(bottom:Dimensions.height10/5),
      
      child: Padding(
        
        // padding: EdgeInsets.only(left:8.0, right:8.0, top:20.0),
        padding: EdgeInsets.only(left:Dimensions.width10, right:Dimensions.width10, top:Dimensions.width20 + 2),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
  
          Container(
            //  width: 60.0,
             width: (Dimensions.width30 * 2) + 2,
             height: (Dimensions.height30 + Dimensions.height45),
            //  height: 75.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: 
              AssetImage("assets/images/slider/mucg.jpeg"),
              
               fit: BoxFit.cover),
              //borderRadius:BorderRadius.circular(8.0) 
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular()
              // )
            ),
  
            
          ),
          // SizedBox(width: 13.0,),
          SizedBox(width: Dimensions.width15 -2,),
  
          Expanded(
            child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
  
              Text("${title}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,

                style: TextStyle(
                  // fontSize: 18.
                  fontSize: Dimensions.font20
                ),
              
              
              ),
              // SizedBox(height:7),
              SizedBox(height:Dimensions.height10 -2),
  
              SmallText(text: '${description!.substring(0, 50)}...',color: const Color.fromARGB(255, 150, 148, 148),),
              // SizedBox(height: 13,),
            //  SizedBox(height: Dimensions.height15 ,),
              SizedBox(height:Dimensions.height10 -2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: Dimensions.width10-2,),
                      Text(
                    "From: SRC Office",
                    style: TextStyle(
                       fontSize: 12.0,
                      //fontSize: Dimensions.font16 - 3
                    ),
                   
                  ),
                    ],
                  ),
                  
                   //SizedBox(width: 10.0,),
                   Row(
                     children: [
                       Icon(Icons.date_range),
                       SizedBox(width: Dimensions.width10-2,),
                       Text(
                    "${date}",
                    style:TextStyle(
                      fontSize:Dimensions.font16 -3,
                    )
                   ),
  
                  //  SizedBox(width: 15,),
                  SizedBox(width:Dimensions.width15 -4 ,)
                     ],
  
                   ),
                   
  
                ],
              )
  
            ],
          ))
        ],)
  
      
      
      
      ),
  
    ),
  );
}