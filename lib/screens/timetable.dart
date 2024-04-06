import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:provider/provider.dart';
import '../const/colors.dart';
import '../models/timetable_model.dart';
import '../providers/timetable_notify.dart';
import '../utils/app_constants.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';
import '../widgets/exercise_tile.dart';
import '../widgets/pdfview.dart';

class TimetableScreen extends StatefulWidget {
  static const routeName = "/timetable";
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  Future<void> _refresh(BuildContext context) async {
    print("fetching data");
    await Provider.of<TimetableProvider>(context, listen:false)
         .fetchTimetableItems();

    
  } 
  
  
  @override
  Widget build(BuildContext context) {
    bool isLoading = true;
    final timetableProvider = Provider.of<TimetableProvider>(context);
    List<TimetableItemModel> timetableItems = timetableProvider.timetableItems;
    // print(timetableItems[0].timetableDoc);
    List<Color> itemColors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
  // Add more colors as needed
  ];

    // WebViewController webViewController = WebViewController();
    
    // String blogUrl = AppConstants.MUG_TIMETABLE_PAGE;

  //   @override
  // void dispose() {
  //   // TODO: implement dispose
  //   webViewController.dispose();
  //   super.dispose();

  // }
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor:AppColors.appBarColor ,
        elevation: 0,
        actions: [

            // Container(
            //   //color:Colors.red,
            //      //margin: EdgeInsets.all(10, ),
            //     margin: EdgeInsets.all(Dimensions.width10+1.7),
            //     child: IconButton(
            //         onPressed: () {}, 
            //         icon: Icon(Icons.notifications_active,
            //          //size:25.0,
            //         size:Dimensions.font26 ,
                      
            //         ),
            //         ),
                    
            //         ),
          ],
      ),
       backgroundColor: AppColors.inputColor,




      body: RefreshIndicator(
        onRefresh: () => _refresh(context),
        child: Column(
          children: [
            Container(
              //height: 270,
              height: Dimensions.height45 * 1.9,
              decoration: BoxDecoration(
               color: AppColors.appBarColor,
               //color: Colors.r,
              borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.height10 + Dimensions.height15 + 10),
             bottomRight: Radius.circular(Dimensions.height10 + Dimensions.height15 + 10),
          ),
        ),
           child: Column(
             children: [
              
      
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
      
                children: [
                   BigText(text: "Timetable", color: Colors.white,size: Dimensions.font26,)
      
      
      
                                
                ],
      
               ),
               //SizedBox(width:Dimensions.width10 -2),
      
               // DEPARTMENT AND NAME COMPONENTS
                
             ],
           ),
      
              
            ),
      
            Expanded(
                
                child: Container(
                  padding: EdgeInsets.only(left:Dimensions.width20 + 5, right:Dimensions.width20 + 5, top:Dimensions.width20 + 5),
                  // padding: EdgeInsets.only(left:25, right:25, top:25),
                  
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                      
                      ),
                      color: Colors.grey[200],
      
                  ),
                  child: Center(
                    child:Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Faculties", 
                            style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                            ),
                            ),
                            Icon(Icons.more_horiz)
                          ],
      
                        ),
                        SizedBox(
                          height:20,
      
                        ),
      
      
      
                        // Listview of exercises
                        Expanded(
        child:timetableItems.isEmpty?
          Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const AssetImage("assets/images/vote.jpeg"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                      // Icons.announcement_rounded,
                      Icons.announcement_rounded,
                      size: Dimensions.font26 * 5, // Adjust the size as needed
                      color: Colors.orange, // Choose the color you prefer
                    ),
      
                    Icon(
                      // Icons.announcement_rounded,
                      Icons.announcement_rounded,
                      size: Dimensions.font26 * 5, // Adjust the size as needed
                      color: Colors.orange, // Choose the color you prefer
                    ),
      
                    ],
                  ),
                    // Icon(
                    //   // Icons.announcement_rounded,
                    //   Icons.info,
                    //   size: Dimensions.font26 * 5, // Adjust the size as needed
                    //   color: Colors.orange, // Choose the color you prefer
                    // ),
                    SizedBox(height: Dimensions.height15 + 1), 
                    Text(
                      "No Timetable currently available!!",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // You can add an image here if you want
                  ],
                ),
              ):
        
         ListView.builder(
          itemCount: timetableItems.length, // Replace with the length of your timetable data list
          itemBuilder: (context, index) {
        final timetableItem = timetableItems[index]; // Get the current timetable item
         final randomColor = itemColors[index % itemColors.length];
      
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (_) => PDFViewerFromUrl(
                url:"${AppConstants.MUG_REST_API_BASE}${timetableItem.timetableDoc}",
              ),
            ),
          ),
          child: ExerciseTile(
            myIcon: Icons.school,
            color: randomColor,
            exerciseName: timetableItem.name, // Use timetableItem data
            numberOfExercises: timetableItem.department, // Replace with actual data
          ),
        );
          },
        ),
      )
      
              //            Expanded(
              //              child: ListView(
              //               children: [
              //                 InkWell(
              //                   onTap: ()=> Navigator.push(
              //   context,
              //   MaterialPageRoute<dynamic>(
              //     builder: (_) => const PDFViewerFromUrl(
              //       // url: 'http://africau.edu/images/default/sample.pdf',
              //       url: "https://mug.edu.gh/wp-content/uploads/2023/03/2022-2023-second-semester-final-timetable.pdf"
              //     ),
              //   ),
              // ),
              //                   child: ExerciseTile(
              //                     myIcon: Icons.school,
              //                     color:Colors.red,
              //                     exerciseName: "Faculty of Science",
              //                     numberOfExercises: "23",
              //                   ),
              //                 ),
              //                 ExerciseTile(
              //                   myIcon: Icons.school,
              //                   color:Colors.green,
              //                   exerciseName: "Faculty of Business Admin",
              //                   numberOfExercises: "17",
              //                 ),
              //                 ExerciseTile(
              //                   myIcon: Icons.school,
              //                   color:Colors.blue,
              //                   exerciseName: "Faculty of Art and Science",
              //                   numberOfExercises: "10",
              //                 ),
              //                 // ExerciseTile(
              //                 //   myIcon: Icons.star,
              //                 //   color:Colors.orange,
              //                 //   exerciseName: "Writing Skills",
              //                 //   numberOfExercises: "10",
              //                 // ),
              //                 // ExerciseTile(
              //                 //   myIcon: Icons.star,
              //                 //   color:Colors.blue,
              //                 //   exerciseName: "Writing Skills",
              //                 //   numberOfExercises: "10",
              //                 // ),
              //                 // ExerciseTile(
              //                 //   myIcon: Icons.star,
              //                 //   color:Colors.black,
              //                 //   exerciseName: "Writing Skills",
              //                 //   numberOfExercises: "10",
              //                 // ),
              //                 // ExerciseTile(
              //                 //   myIcon: Icons.star,
              //                 //   color:Colors.teal,
              //                 //   exerciseName: "Writing Skills",
              //                 //   numberOfExercises: "10",
              //                 // ),
              //                 // ExerciseTile(
              //                 //   myIcon: Icons.star,
              //                 //   color:Colors.indigo,
              //                 //   exerciseName: "Writing Skills",
              //                 //   numberOfExercises: "10",
              //                 // ),
              //                 // ExerciseTile(
              //                 //   myIcon: Icons.star,
              //                 //   color:Colors.orange,
              //                 //   exerciseName: "Writing Skills",
              //                 //   numberOfExercises: "10",
              //                 // ),
              //               ],
              //              ),
              //            )
      
                      
                      
                      
                      
                      
                      ],
                    ),
                  ),
      
              ),
              ),
      
      
      
            
            
            ]
            
            ),
      )
    //    Stack(
    //      children: [
    //        Container(
    //         height: MediaQuery.of(context).size.height,
    //         width: MediaQuery.of(context).size.width,
    //   child: 
      
    //        WebViewWidget(

                
    //             controller: webViewController
    //               ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //               ..setNavigationDelegate(
    //                 NavigationDelegate(
    //                   onNavigationRequest:(navigation){
    //                     if(navigation.url != blogUrl){
    //                       // return NavigationDecision.prevent;
                          
    //                     }
    //                     return NavigationDecision.navigate;
    //                   },
    //                   // onPageStarted: (String blogUrl){

    //                   //   setState((){
    //                   //     _loading = true;
    //                   //   });
                        
    //                   // },
    //                   onPageFinished: (String blogUrl){
    //                     setState((){
    //                       isLoading = false;
    //                     });
    //                   },
    //                 ),
                    
    //               )
                  
    //               ..loadRequest(Uri.parse(blogUrl),

    //               ),
                  
    //               ),
    //   // child: WebViewWidget(

    //   // ),
    // ),
     
    //    isLoading ? Center( child: CircularProgressIndicator(),)
    //                 : Stack(),
    //      ],
    //    ),



    );
  }
}