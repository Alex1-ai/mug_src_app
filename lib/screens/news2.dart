import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/services/news.dart';
import 'package:mug_app/models/article_model.dart';
import 'package:mug_app/providers/mug_news_notify.dart';
import 'package:mug_app/widgets/news_folder/blog_tile.dart';
import 'package:provider/provider.dart';

import '../utils/dimensions.dart';
import '../widgets/news_folder/listitem.dart';
import '../widgets/news_folder/mug_blog_tile.dart';

class NewsScreenSecond extends StatefulWidget {
  const NewsScreenSecond({super.key});

  @override
  State<NewsScreenSecond> createState() => _NewsScreenSecondState();
}



// first let's extends our app to singleTickerproviderStateMix
class _NewsScreenSecondState extends State<NewsScreenSecond> with SingleTickerProviderStateMixin{
  // Let's make a list of list items
  List<ListItem> listTiles = [
    ListItem(
    imgUrl:"https://images.unsplash.com/photo-1654157925394-4b7809721149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80", 

     newsTitle: "MUG is now a full fledged University", 
     
      date:"28 Jan 2023",
      desc:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?"
      
      ),
    ListItem(
    imgUrl:"https://images.unsplash.com/photo-1654157925394-4b7809721149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80", 

     newsTitle: "MUG is now a full fledged University", 
     
      date:"28 Jan 2023",
      desc:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?"
      
      ),
    ListItem(
    imgUrl:"https://images.unsplash.com/photo-1654157925394-4b7809721149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80", 

     newsTitle: "MUG is now a full fledged University", 
     
      date:"28 Jan 2023",
      desc:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?"
      
      ),

    ListItem(
    imgUrl:"https://images.unsplash.com/photo-1654157925394-4b7809721149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80", 

     newsTitle: "MUG is now a full fledged University", 
     
      date:"28 Jan 2023",
      desc:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?"
      
      ),

     ListItem(
    imgUrl:"https://images.unsplash.com/photo-1654157925394-4b7809721149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80", 

     newsTitle: "MUG is now a full fledged University", 
     
      date:"28 Jan 2023",
      desc:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?"
      
      ),

      ListItem(
    imgUrl:"https://images.unsplash.com/photo-1654157925394-4b7809721149?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1160&q=80", 

     newsTitle: "MUG is now a full fledged University", 
     
      date:"28 Jan 2023",
      desc:"Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus deserunt cum perferendis assumenda atque, commodi sint eaque placeat vero vel minus repellendus nisi dolor iste iure eligendi molestiae vitae?"
      
      ),
    
  ];
  
  // adding from newsapi.org
  // List<ArticleModel> articles = List<ArticleModel>().from([]);
  List<ArticleModel> topNews = List<ArticleModel>.empty();
  List<ArticleModel> businessNews = List<ArticleModel>.empty();
  List<ArticleModel> sportNews = List<ArticleModel>.empty();
  List<ArticleModel> technologyNews = List<ArticleModel>.empty();
  List<ArticleModel> healthNews = List<ArticleModel>.empty();
  // List<ArticleModel> scienceNews = List<ArticleModel>.empty();
  // List<ArticleModel> generalNews = List<ArticleModel>.empty();
  // List<ArticleModel> entertainmentNews= List<ArticleModel>.empty();

  List<Tab> _tabList = [
    Tab(child: Text("MUG News")),
    Tab(child: Text("Top")),
    Tab(child: Text("Business")),
    Tab(child: Text("Sport")),
    Tab(child: Text("Technology")),
    Tab(child: Text("Health")),
    // Tab(child: Text("Science")),
    // Tab(child: Text("General")),
    // Tab(child: Text("Entertainment")),
    


  ];

  // now let's create tab controller
  late TabController _tabController;
  
  // loading var
  bool _loading = true;
  // Future<void> _refresh(BuildContext context) async {
  //   print("fetching data");
    
  //   await Provider.of<MugNewsProvider>(context, listen: false)
  //       .fetchNews();
    
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
    getNews();
  }
  getNews()async{
    News newsClass = News();
    await newsClass.getNews();
    await newsClass.getBusinessNews();
    await newsClass.getSportNews();
    await newsClass.getTechnologyNews();
    await newsClass.getHealthNews();
    // await Provider.of<MugNewsProvider>(context, listen: false)
    //     .fetchNews();
    
    // await newsClass.getScienceNews();
    // await newsClass.
    topNews = newsClass.news;
    businessNews = newsClass.businessNews;
    sportNews  = newsClass.sportNews;
    technologyNews = newsClass.technologyNews;
    healthNews = newsClass.healthNews;
    setState(() {
      _loading = false;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final mugNewsProvider = Provider.of<MugNewsProvider>(context);
    final mugNews = mugNewsProvider.newsList;
    print(mugNews.length);
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(
    color: Colors.black87, // Set the desired icon color
  ),
        toolbarHeight: 110,
        // leading: IconButton(
        //   onPressed: (){
        //     Get.t
        //   }
        // , icon: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.black,
        // ),
        // ),
        

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
        // Now let's start creating the tab bar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          // we need the  create a tab controller

          // add a tab list
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tabList,
            ),


        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
      
          // We will just create the top container
          // you can fill the other container with what ever you want
          Padding(
            padding: EdgeInsets.all(4.0),
            // padding: EdgeInsets.all(8.0),
      
            // now we need to create a list item class
            child:mugNews.isEmpty?
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
                      "No news currently available!!",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // You can add an image here if you want
                  ],
                ),
              ): Container(
              
              child: ListView.builder(
                itemCount: mugNews.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return MugBlogTile(
                    // item: listTiles[index],
            //      tag:listTiles[index].newsTitle
                    imageUrl: mugNews[index].image, 
                    title: mugNews[index].title, 
                    desc: mugNews[index].description ,
                    date: mugNews[index].updatedAt,
                     
                    );
      
                },
                ),
            ),
            
            //  Container(
      
      
            //   //now let's build the ListWidgets
            //   child: ListView.builder(
            //     itemCount: listTiles.length,
            //     itemBuilder: (context, index){
            //       return InkWell(
            //         onTap: (){
            //           Navigator.push(context, MaterialPageRoute(builder: 
            //           (context)=>DetailsScreen(
            //             item: listTiles[index],
            //             tag:listTiles[index].newsTitle,
            //           )
                      
            //           ),);
      
      
            //         },
            //         //  child: listWidget(listTiles[index]),
            //         child: listWidget(),
            //       );
            //     },
      
            //   ),
            // ),
            
            
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:_loading? Center(child: Container(
      
              child: CircularProgressIndicator(),
            )): 
      // TOP NEWS  FROM NEWSAPI.ORG
      
      // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
            Container(
              
              child: ListView.builder(
                itemCount: topNews.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return BlogTile(
                    imageUrl: topNews[index].urlToImage, 
                    title: topNews[index].title, 
                    desc: topNews[index].description ,
                    url: topNews[index].url,
                    );
      
                },
                ),
            ),
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
             child:_loading? Center(child: Container(
      
              child: CircularProgressIndicator(),
            )): 
      // TOP NEWS  FROM NEWSAPI.ORG
      
      // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
            Container(
              
              child: ListView.builder(
                itemCount: businessNews.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return BlogTile(
                    imageUrl: businessNews[index].urlToImage, 
                    title: businessNews[index].title, 
                    desc: businessNews[index].description ,
                    url: businessNews[index].url,
                    );
      
                },
                ),
            ),
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:_loading? Center(child: Container(
      
              child: CircularProgressIndicator(),
            )): 
      // TOP NEWS  FROM NEWSAPI.ORG
      
      // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
            Container(
              
              child: ListView.builder(
                itemCount: sportNews.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return BlogTile(
                    imageUrl: sportNews[index].urlToImage, 
                    title: sportNews[index].title, 
                    desc: sportNews[index].description ,
                    url: sportNews[index].url,
                    );
      
                },
                ),
            ),
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:_loading? Center(child: Container(
      
              child: CircularProgressIndicator(),
            )): 
      // TOP NEWS  FROM NEWSAPI.ORG
      
      // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
            Container(
              
              child: ListView.builder(
                itemCount: technologyNews.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return BlogTile(
                    imageUrl: technologyNews[index].urlToImage, 
                    title: technologyNews[index].title, 
                    desc: technologyNews[index].description ,
                    url: technologyNews[index].url,
                    );
      
                },
                ),
            ),
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:_loading? Center(child: Container(
      
              child: CircularProgressIndicator(),
            )): 
      // TOP NEWS  FROM NEWSAPI.ORG
      
      // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
            Container(
              
              child: ListView.builder(
                itemCount: healthNews.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return BlogTile(
                    imageUrl: healthNews[index].urlToImage, 
                    title: healthNews[index].title, 
                    desc: healthNews[index].description ,
                    url: healthNews[index].url,
                    );
      
                },
                ),
            ),
            ),
      
      
      
      
            // Padding(
            // padding: EdgeInsets.all(8.0),
            // child:_loading? Center(child: Container(
      
            //   child: CircularProgressIndicator(),
            // )): 
      // TOP NEWS  FROM NEWSAPI.ORG
      
      // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
      
      // FOR SCIENCE
      //             Container(
              
      //               child: ListView.builder(
      //                 itemCount: healthNews.length,
      //                 shrinkWrap: true,
      //                 itemBuilder: (context,index){
      //                   return BlogTile(
      //                     imageUrl: healthNews[index].urlToImage, 
      //                     title: healthNews[index].title, 
      //                     desc: healthNews[index].description ,
      //                     url: healthNews[index].url,
      //                     );
      
      //                 },
      //                 ),
      //             ),
      //             ),
      
      
      
      //             Padding(
      //             padding: EdgeInsets.all(8.0),
      //             child:_loading? Center(child: Container(
      
      //               child: CircularProgressIndicator(),
      //             )): 
      // // TOP NEWS  FROM NEWSAPI.ORG
      
      // // IMPLEMENT WHEN THE ARTICLE IS EMPTY SHOW EMPTY IMAGE THERE
      
      // // FOR GENERAL
      //             Container(
              
      //               child: ListView.builder(
      //                 itemCount: healthNews.length,
      //                 shrinkWrap: true,
      //                 itemBuilder: (context,index){
      //                   return BlogTile(
      //                     imageUrl: healthNews[index].urlToImage, 
      //                     title: healthNews[index].title, 
      //                     desc: healthNews[index].description ,
      //                     url: healthNews[index].url,
      //                     );
      
      //                 },
      //                 ),
      //             ),
      //             ),
        ]
        
        ),
    

      

    );
  }
}