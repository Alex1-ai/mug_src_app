import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/listWidget.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  int _currentIndex = 0;

  //late CarouselSlider carouselSlider;

  List imageList = [
    'assets/images/banners/Banners1.jpg',
    'assets/images/banners/Banners2.jpg',
    'assets/images/banners/Banners3.jpg',
    'assets/images/banners/Banners4.jpg',
    'assets/images/banners/Banners5.jpg',
    'assets/images/banners/Banners6.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[50],
      appBar: PreferredSize(
        
        
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        
        child: AppBar(
          toolbarHeight:120,
          elevation: 0,
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            //crossAxisAlignment: CrossAxisAlignment.s,
            children: [
              //SizedBox(height:100),
              Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              //color: Color(0xFF00B686),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.1),
                                  blurRadius: 8,
                                  spreadRadius: 3,
                                )
                              ],
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/avatar/avatar3.jpg"),
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
              SizedBox(width:7),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Onedibe Emmanuel",
                    style: TextStyle(
                     // fontSize: 15, 
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
                    "Information Technology",
                    style: TextStyle(
                        fontFamily: "SourceSerifLight",
                        //fontSize: 14,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[350]),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Container(
                margin: EdgeInsets.all(10),
                child: IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.notifications_active,
                    size:25.0,
                      
                    ),
                    ),
                    
                    ),
          ],
        ),
      ),
      body: ListView(children: [
        Stack(children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.1,
            // height: MediaQuery.of(context).size.height * 0.05,
            decoration: new BoxDecoration(
              color: Colors.blue[900],
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
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(blurRadius: 5.0, color: Colors.grey)
                  ],
                  borderRadius: new BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.width * 0.1,
                            decoration: new BoxDecoration(
                              color: Colors.blue[50],
                              //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                // Icons.account_balance_wallet_rounded
                                //Icons.newspaper
                                Icons.school
                                ),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MUG",
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
                                "Level : 100",
                                style: TextStyle(
                                    fontFamily: "Rowdies",
                                  
                                    fontWeight: FontWeight.w200,
                                    color: Colors.red[300]),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.width * 0.1,
                            decoration: new BoxDecoration(
                              color: Colors.blue[50],
                              //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                //Icons.analytics_rounded
                                // Icons.newspaper,
                                Icons.assured_workload
                                
                                ),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(width:5),
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
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
         
         
         
          Container(
            //alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.27,
             
              //right: 20
            ),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.account_circle_rounded),
                          iconSize: 35,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.badge_rounded),
                          iconSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        // "KRS",
                        "Past Questions",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          // icon: Icon(Icons.newspaper_rounded,
                          icon: Icon(Icons.assignment,
                          
                          ),
                          iconSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        // "Nilai",
                        "Vote",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            // Icons.text_snippet_rounded
                          //  Icons.assured_workload,
                           Icons.local_library_rounded,
                            
                            ),
                          iconSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        //"Jadwal",
                        "Library",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                        //mainAxisAlignment: MainAxisAlignment,
                        children: [
                          Container(
                            //margin: EdgeInsets.al,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            decoration: new BoxDecoration(
                              color: Colors.blue[100],
                              //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                              borderRadius: new BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                // Icons.account_balance_wallet_rounded,
                                 Icons.chat_bubble_outlined,
                                //Icons.assured_workload,
                                ),
                              iconSize: 35,
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            // "Bayar",
                            "Chat",
                            style: TextStyle(
                                fontFamily: "Rowdies",
                                fontWeight: FontWeight.w200,
                                color: Colors.grey),
                          )
                        ]),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            // Icons.feed_rounded,
                            Icons.fastfood_sharp
                            // Icons.restaurant_menu
                            
                            ),
                          iconSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Order food",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            // Icons.task_rounded
                            // Icons.star
                            Icons.newspaper,
                            
                            ),
                          iconSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "News",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                    Column(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.width * 0.15,
                        decoration: new BoxDecoration(
                          color: Colors.blue[100],
                          //boxShadow: [new BoxShadow(blurRadius: 0.0)],
                          borderRadius: new BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            // Icons.menu_rounded
                            // Icons.people
                            Icons.shield,
                            ),
                          iconSize: 30,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Support Us",
                        style: TextStyle(
                            fontFamily: "Rowdies",
                            fontWeight: FontWeight.w200,
                            color: Colors.grey),
                      )
                    ]),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.85,
              //top:MediaQuery.of(context).size.width * 0.78,
              //right: 20
            ),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Campus trends",
                        style: TextStyle(
                            // color: Colors.grey, 
                            color: Colors.black, 
                            fontWeight: FontWeight.bold,
                            fontSize:18
                            ),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            // color: Colors.grey, fontWeight: FontWeight.bold
                            color: Colors.blue, fontWeight: FontWeight.bold
                            ),
                      )
                    ])
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
             // top: MediaQuery.of(context).size.width * 0.8,
              top: MediaQuery.of(context).size.width * 0.9,
              //right: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
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
                  items: imageList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            //shadowColor: Colors.grey,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              child: Image.asset(
                                item,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),

                Container(
                  child: ListView.builder(
                itemCount: 4,
                itemBuilder:(context, index){
                  return InkWell(
                    onTap:(){},
                    child:listWidget()
                  );
                } ,),
                 ),

                 
        
              ],
            ),
          ),

         
          
          
 
        
        ]
        ),
      ]
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 30,
            ),
            label: 
              'Home',
              //style: TextStyle(),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
              size: 30,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              // Icons.list_alt_rounded,
              // Icons.lis,
              Icons.calendar_month_rounded,
              size: 30,
            ),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_outlined,
              
              size: 30,
            ),
            label: 'ChatBot',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}