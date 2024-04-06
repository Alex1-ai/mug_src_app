import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mug_app/providers/candidate_notify.dart';
import 'package:mug_app/providers/postal_notify.dart';
import 'package:mug_app/utils/app_constants.dart';
import 'package:mug_app/widgets/big_text.dart';
import 'package:mug_app/widgets/category_icon.dart';
import 'package:mug_app/widgets/listWidget.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../providers/mug_news_notify.dart';
import '../providers/positions_notify.dart';
import '../providers/timetable_notify.dart';
import '../providers/user_profile_notify.dart';
import '../utils/dimensions.dart';
import '../widgets/news_folder/details.dart';

class MainPage extends StatefulWidget {
  static const routeName = "/main_page";
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   
   int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  int _currentIndex = 0;

  //late CarouselSlider carouselSlider;

  List imageLists = [
    'assets/images/banners/Banners3.jpg',
    'assets/images/banners/mugBanner8.jpeg',
    // 'assets/images/banners/Banners2.jpg',
    // 'assets/images/banners/Banners3.jpg',
    'assets/images/banners/mugBanner3.jpeg',
    'assets/images/banners/mugBanner8.jpeg',
    // 'assets/images/banners/Banners5.jpg',
    'assets/images/banners/mugBanner3.jpeg',
    // 'assets/images/banners/Banners6.jpg',
  ];
  Future<void> _refresh(BuildContext context) async {
    print("fetching data");
    await Provider.of<PostalProvider>(context, listen:false)
         .fetchData();
    
    await Provider.of<CandidateProvider>(context, listen:false)
         .fetchData();
        
    await Provider.of<PositionProvider>(context, listen:false)
         .fetchPositions();

    await Provider.of<TimetableProvider>(context, listen:false)
         .fetchTimetableItems();
    await Provider.of<MugNewsProvider>(context, listen: false)
        .fetchNews();
  }
  @override
  Widget build(BuildContext context) {
    
    final mugNewsProvider = Provider.of<MugNewsProvider>(context);
    final mugNews = mugNewsProvider.newsList;
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final postalPostalProvider = Provider.of<PostalProvider>(context);
    final postals = postalPostalProvider.postalData;
    // print("Check here ooooooooooooooo ${postals[0].posterImg}");

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
    return Scaffold(
      appBar: PreferredSize(
        
        
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        
        child: AppBar(
          //toolbarHeight:120,
          toolbarHeight:(Dimensions.height20 * 5) + Dimensions.height20,
          elevation: 0,
          // backgroundColor: Colors.blue[900],
          backgroundColor: AppColors.appBarColor,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            //crossAxisAlignment: CrossAxisAlignment.s,
            children: [
              //SizedBox(height:100),
              Container(
                            //width: 70.0,
                            width:(Dimensions.width20*3) + Dimensions.width10 + 6,
                            height: (Dimensions.height20*3) + Dimensions.height10 + 6,
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
                                width: 1.5,
                                color:AppColors.whiteColor,
                              ),
                              // borderRadius: BorderRadius.circular(40.0),
                              borderRadius: BorderRadius.circular((Dimensions.radius30 + Dimensions.radius15)),
                            ),
                            padding: EdgeInsets.all((Dimensions.radius20/4) + 1 ),
                            //padding: EdgeInsets.all(5 ),
                            child: (userProfileProvider.userProfile?.profileImage == '' || userProfileProvider.userProfile?.profileImage == null)?
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
              // Image(
              //   image: AssetImage("assets/images/avatar/avatar3.jpg",
              //   BoxFit:Boxfit.cover,
                
                
              //   ),
              //   // width: 45,
              //   // height:45,
              //   width:80,
              //   height:80,
              //   //color:Colors.red,
                
              
              // ),
              //SizedBox(width:7),
              SizedBox(width:Dimensions.width10 -2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Hi, Emmanuel",
                    "Hi, ${userProfileProvider.userProfile?.name ?? 'N/A'}",
                    style: TextStyle(
                     // fontSize: 15, 
                    //  fontSize:18;
                      fontSize: Dimensions.font20 , 
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    "${userProfileProvider.userProfile?.course ?? 'N/A'}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                ],
              )
            ],
          ),
          actions: [
//             PopupMenuButton<String>(
//   onSelected: (value) {
//     // Handle the selected menu item here
//     if (value == 'option1') {
//       // Perform action for option 1
//     } else if (value == 'option2') {
//       // Perform action for option 2
//     }
//   },
//   itemBuilder: (BuildContext context) {
//     return <PopupMenuEntry<String>>[
//       PopupMenuItem<String>(
//         value: 'option1',
//         child: Text('Option 1'),
//       ),
//       PopupMenuItem<String>(
//         value: 'option2',
//         child: Text('Option 2'),
//       ),
//       // Add more menu items as needed
//     ];
//   },
//   child: IconButton(
//       onPressed: () {
//         // Open the pop-up menu when the icon is clicked
//       },
//       icon: Icon(
//         Icons.notifications_active,
//         size: Dimensions.font26 + 1.9,
//       ),
//     ),
//   // ),
// )

            // Container(
            //   //color:Colors.red,
            //      //margin: EdgeInsets.all(10, ),
            //     margin: EdgeInsets.all(Dimensions.width10+1.7),
            //     child: IconButton(
            //         onPressed: () {
                      
            //         }, 
            //         icon: Icon(Icons.notifications_active,
            //          //size:25.0,
            //         size:Dimensions.font26 + 1.9,
                      
            //         ),
            //         ),
                    
            //         ),
          ],
        ),
      ),

      body: RefreshIndicator(
        onRefresh: ()=>_refresh(context),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  // height: MediaQuery.of(context).size.height * 0.05,
                  decoration: new BoxDecoration(
                    // color: Colors.blue[900],
                    color:AppColors.appBarColor,
                    boxShadow: [new BoxShadow(blurRadius: 5.0)],
                    borderRadius: new BorderRadius.vertical(
                        bottom: new Radius.elliptical(
                            MediaQuery.of(context).size.width, 300.0)),
                  ),
                ),
                Align(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: new BoxDecoration(
                        // color: Colors.white,
                        color:AppColors.whiteColor,
                        boxShadow: [
                          new BoxShadow(blurRadius: 5.0, color: Colors.grey)
                        ],
                        // borderRadius: new BorderRadius.circular(20),
                         borderRadius: new BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: Container(
                        // margin: EdgeInsets.only(left: 20),
                        margin: EdgeInsets.only(left: Dimensions.width20 ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(left: 10),
                              margin: EdgeInsets.only(left: Dimensions.width10 + 2),
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: new BoxDecoration(
                                color: Colors.blue[50],
                                //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                                // borderRadius: new BorderRadius.circular(10),
                                borderRadius: new BorderRadius.circular(Dimensions.radius15-7),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/profile");
      
                                },
                                icon: Icon(
                                  // Icons.account_balance_wallet_rounded
                                  //Icons.newspaper
                                  Icons.school
                                  ),
                                color: Colors.blue,
                              ),
                            ),
                            //SizedBox(width:5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 // "MUG",
                                //  "IT",
                                "PROFILE",
                                  style: TextStyle(
                                      //fontFamily: "SourceSeriflight",
                                      //fontWeight: FontWeight.bold,
                                      //fontSize: 12,
                                      fontSize: 12,
                                      //color: Colors.grey[600],
                                      color:Colors.black
      
                                      ),
                                ),
                                Text(
                                  "Level : ${userProfileProvider.userProfile?.level ?? 'N/A'}",
                                  style: TextStyle(
                                      fontFamily: "Rowdies",
                                    
                                      fontWeight: FontWeight.w200,
                                      //color: Colors.red[300],
                                      color: AppColors.mugTopLevelColor
                                      ),
                                ),
                              ],
                            ),
                            //SizedBox(width: 20,),
                            Container(
                              // margin: EdgeInsets.only(left: 15),
                              margin: EdgeInsets.only(left: Dimensions.width15),
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              decoration: new BoxDecoration(
                                // color: Colors.blue[50],
                                color: Colors.blue[50],
                                //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                                // borderRadius: new BorderRadius.circular(10),
                                borderRadius: new BorderRadius.circular(Dimensions.radius15-7),
                              ),
                              child: IconButton(
                                onPressed: () {
                                   Navigator.pushNamed(context, "/profile");
      
                                },
                                icon: Icon(
                                  //Icons.analytics_rounded
                                  // Icons.newspaper,
                                  Icons.assured_workload
                                  
                                  ),
                                color: Colors.blue,
                              ),
                            ),
                            //SizedBox(width:2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "MUG",
                                  style: TextStyle(
                                      //fontFamily: "SourceSeriflight",
                                      //fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      //color: Colors.grey[500],
                                      color:Colors.black
                                      ),
                                ),
                                Row(children: [
                                  Text(
                                    "SRC",
                                    style: TextStyle(
                                        fontFamily: "Rowdies",
                                        fontWeight: FontWeight.w200,
                                        color: Colors.blue),
                                  ),
                                  SizedBox(width:2,),
      
                                  Text(
                                    "App",
                                    style: TextStyle(
                                        fontFamily: "Rowdies",
                                        fontWeight: FontWeight.w200,
                                        color: Colors.grey),
                                  ),
                                  //SizedBox(width: 25,)
                                  SizedBox(width: Dimensions.width20 + Dimensions.width10,)
                                ]),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
      
                
                ]
                ),
                // SizedBox(height: 10,),
                SizedBox(height: Dimensions.height10 + 2,),
      
                // ACTIVITIES START
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20 + 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                  
                    
                     children: [
                      BigText(text: "Activities")
                     ],
                  ),
                ),
                
                Container(
                  // padding: EdgeInsets.all(20),
                  padding: EdgeInsets.all(Dimensions.width20 + 2),
                  
                  // width: MediaQuery.of(context).size.width * 1,
                  // height: MediaQuery.of(context).size.width * 0.6,
      
                  child: Column(
                    children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                     
                     
                      CategoryIcon( icon: Icons.account_circle_rounded,
                      catTitle: "Profile",),
                     
                     
                      CategoryIcon(catTitle: "Timetable", 
                      icon: Icons.badge_rounded),
                      CategoryIcon(catTitle: "Vote", 
                      icon: Icons.how_to_vote),
                      CategoryIcon(catTitle: "Library",
                       icon: Icons.local_library_rounded),
      
                    ]
                    
                    ),
      
                    // SizedBox(height:20),
                    SizedBox(height: Dimensions.height20 + 2,),
      
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // CategoryIcon(catTitle: "Chatbot", icon: Icons.chat_bubble_outlined,),
                      CategoryIcon(catTitle: "Result", icon: Icons.assignment,),
                      // CategoryIcon(catTitle: "Reader", icon: Icons.chrome_reader_mode,),
      
                      CategoryIcon(catTitle: "Order-food", icon: Icons.fastfood_sharp),
                      CategoryIcon(catTitle: "News",icon: Icons.newspaper),
                      CategoryIcon(catTitle: "Gallery", icon: Icons.enhance_photo_translate_sharp),
      
                    ]
                    
                    )
      
                  ],
                  ),
                ),
      
                // ACTIVITIES END
                
                // SHOWING THE CORRASEL
                // Container(
      
                //    padding: EdgeInsets.all(20),
                //     child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children: [
                 // SizedBox(height:10),
                 SizedBox(height: Dimensions.height10 + 2,),
                   Padding(
                      //padding: const EdgeInsets.only(left:20.0, right:20.0, ),
                      padding:  EdgeInsets.only(left:(Dimensions.width20 + 2), right:(Dimensions.width20 + 2), ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Campus Events Trends"),
                             InkWell(
                              onTap: (){
                                Navigator.pushNamed(context,"/news" );
                              },
                              child: Text(
                                "View all",
                                style: TextStyle(
                                    // color: Colors.grey, fontWeight: FontWeight.bold
                                    color: Colors.blue, fontWeight: FontWeight.bold
                                    ),
                              ),
                            )
                          ]),
                    ),
                  
                
      
                 Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     // height: 200.0,
                  //     height: (Dimensions.height20 * 10) + 1,
                  //     initialPage: 0,
                  //     autoPlay: true,
                  //     reverse: false,
                  //     enlargeCenterPage: true,
                  //     enableInfiniteScroll: true,
                  //     scrollDirection: Axis.horizontal,
                  //     autoPlayInterval: Duration(seconds: 5),
                  //     autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  //     onPageChanged: (index, reason) => _currentIndex = index,
                  //     // pauseAutoPlayOnTouch: Duration(seconds: 10),
                  //     // scrollDirection: Axis.horizontal,
                  //   ),
                  //   // items: imageList
                  //   items: postals
                  //       .map(
                  //         (item) => Padding(
                  //           // padding: const EdgeInsets.all(5),
                  //           padding: EdgeInsets.all(Dimensions.width10/2),
                  //           child: Container(
                  //             //shadowColor: Colors.grey,
                  //             child: ClipRRect(
                  //               borderRadius: BorderRadius.all(
                  //                 // Radius.circular(10.0),
                  //                 Radius.circular(Dimensions.width10 + 2)
                  //               ),
                  //               child: Image.network(
                                
                  //                "${AppConstants.MUG_REST_API_BASE}${item.posterImg}",
                  //                 fit: BoxFit.fitWidth,
                                  
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //       .toList(),
                  // ),
        //               Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // children: [
          
        CarouselSlider(
          options: CarouselOptions(
            // height: 200.0,
            height: (Dimensions.height20 * 10) + 1,
            initialPage: 0,
            autoPlay: true,
            reverse: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 2000),
            onPageChanged: (index, reason) => _currentIndex = index,
            // pauseAutoPlayOnTouch: Duration(seconds: 10),
            // scrollDirection: Axis.horizontal,
          ),
          // items:
          items:postals.isEmpty? imageLists
              .map(
                (item) => Padding(
                  // padding: const EdgeInsets.all(5),
                  padding: EdgeInsets.all(Dimensions.width10 / 2),
                  child: Container(
                    //shadowColor: Colors.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        // Radius.circular(10.0),
                        Radius.circular(Dimensions.width10 + 2),
                      ),
                      child: Image.asset(
                        "${item}",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              )
              .toList(): 
              postals
              .map(
                (item) => Padding(
                  // padding: const EdgeInsets.all(5),
                  padding: EdgeInsets.all(Dimensions.width10 / 2),
                  child: Container(
                    //shadowColor: Colors.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        // Radius.circular(10.0),
                        Radius.circular(Dimensions.width10 + 2),
                      ),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/images/banners/mugBanner8.jpeg'), // Replace 'assets/placeholder.png' with your placeholder image asset path
                        image: NetworkImage("${AppConstants.MUG_REST_API_BASE}${item.posterImg}"),
                        fit: BoxFit.fitWidth,
                        imageErrorBuilder: (context, error, stackTrace) {
                          // This function will be called if there is an error loading the image
                          // You can return your placeholder image or any other widget here
                          return Image.asset('assets/images/banners/mugBanner8.jpeg');
                        },
                        
                      )
      
                                          // Image.network(
                      //   "${AppConstants.MUG_REST_API_BASE}${item.posterImg}",
                      //   fit: BoxFit.fitWidth,
                      // ),
                    ),
                  ),
                ),
              )
              .toList()
        ),
          // if (postals.isEmpty)
        // Container(
        //   width: double.infinity,
        //   padding: EdgeInsets.all(16),
        //   margin: EdgeInsets.symmetric(vertical: 20),
        //   decoration: BoxDecoration(
        //     color: Colors.grey[200], // Background color
        //     borderRadius: BorderRadius.circular(10),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey,
        //         blurRadius: 5,
        //         offset: Offset(0, 3),
        //       ),
        //     ],
        //   ),
        //   child: Center(
        //     child: Text(
        //       'No campus events available.',
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.grey[600],
        //       ),
        //     ),
        //   ),
        // ),
      //   ],
      // ),
      
      
        
        
                  
        Padding(
                    //padding: const EdgeInsets.only(left:20.0, right:20.0, ),
                    padding:  EdgeInsets.only(left:(Dimensions.width20 + 2), right:(Dimensions.width20 + 2), ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(text: "MUG SRC News"),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context,"/news" );
                            },
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  // color: Colors.grey, fontWeight: FontWeight.bold
                                  color: Colors.blue, fontWeight: FontWeight.bold
                                  ),
                            ),
                          )
                        ]),
                  ),
          // if(mugNews.isNotEmpty)
                        Padding(
                                // padding: const EdgeInsets.all(5.0),
                            padding:EdgeInsets.all((Dimensions.height10 /2)),
                            child: mugNews.isEmpty? SizedBox():
                            Column(
                            children: [
                                    
                                  
                                    InkWell(
                                      onTap: () {
                        // if (title != null && desc != null && imageUrl != null && date != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                // userProfileProvider.userProfile?.profileImage??"N/A"
                                title: mugNews[0].title,
                                description: mugNews[0].description,
                                image: mugNews[0].image,
                                updatedAt: mugNews[0].updatedAt,
                              ),
                            ),
                          );
                        },
                      
                                      child: listWidget(title: "${mugNews[0].title}", description: mugNews[0].description,date: mugNews[0].updatedAt)
                                      ),
                                    InkWell(
                                      onTap: () {
                        // if (title != null && desc != null && imageUrl != null && date != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                title: mugNews[1].title,
                                description: mugNews[1].description,
                                image: mugNews[1].image,
                                updatedAt: mugNews[1].updatedAt,
                              ),
                            ),
                          );
                        },
                                      
                                      child: listWidget(title: mugNews[1].title, description: mugNews[1].description,date: mugNews[1].updatedAt)
                                      ),
                                    InkWell(
                                      onTap: () {
                        // if (title != null && desc != null && imageUrl != null && date != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                title: mugNews[2].title,
                                description: mugNews[2].description,
                                image: mugNews[2].image,
                                updatedAt: mugNews[2].updatedAt,
                              ),
                            ),
                          );
                        },
                                      
                                      child: listWidget(title: mugNews[2].title, description: mugNews[2].description,date: mugNews[2].updatedAt)),
          //                           // listWidget(title: mugNews[3].title, description: mugNews[3].description,date: mugNews[3].updatedAt),
          //                           // listWidget(),
                                    // listWidget(),
                                    // listWidget(),
                                    // listWidget(),
                                    // listWidget(),
                                    // listWidget(),
                                    // listWidget(),
                                  ],
                                ),
                              ),
      
                              
                                
                        
                              ],
                            ),
      
                //],
      
      
                    //)
               // )
                // Padding(
                //     //padding: const EdgeInsets.only(left:20.0, right:20.0, ),
                //     padding:  EdgeInsets.only(left:(Dimensions.width20 + 2), right:(Dimensions.width20 + 2), ),
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           BigText(text: "MUG SRC News"),
                //           Text(
                //             "View all",
                //             style: TextStyle(
                //                 // color: Colors.grey, fontWeight: FontWeight.bold
                //                 color: Colors.blue, fontWeight: FontWeight.bold
                //                 ),
                //           )
                //         ]),
                //   ),
                
                // Padding(
                //   // padding: const EdgeInsets.all(5.0),
                //   padding:EdgeInsets.all((Dimensions.height10 /2)),
                //   child: Column(
                //     children: [
                      
                    
                //       listWidget(),
                //       // listWidget(),
                //       // listWidget(),
                //       // listWidget(),
                //       // listWidget(),
                //       // listWidget(),
                //       // listWidget(),
                //       // listWidget(),
                //     ],
                //   ),
                // ),
      
      
              ],
            ),
      
        
            
          ),
        ),
      ),
    );
  }
}