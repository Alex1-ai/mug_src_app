import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/widgets/emoticon_face.dart';
import 'package:mug_app/widgets/small_text.dart';

import '../widgets/exercise_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.mainColor,
      bottomNavigationBar: BottomNavigationBar(
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.grey),label: "", ),
        BottomNavigationBarItem(icon: Icon(Icons.category, color: Colors.grey),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.message, color: Colors.grey),label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.grey),label: "")
        
      ]),
      body: SafeArea(
        child: Column(
          children: [

           Padding(
             padding: const EdgeInsets.all(25.0),
             child: Column(
              children: [
                 // GREETING ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                // Hi Jared
                   
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi, Elicio!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    
                    
                    ),
                    SizedBox(height: 8,),
           
                    Text("2 June, 2023",
                    style: TextStyle(
                      color: Colors.blue[200]
                    ),
                    
                    )
           
           
                  ],
                ),
                   
                   
                //NOTIFICATIONS
                Container(
           
                  decoration: BoxDecoration(
                    color:AppColors.iconBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.notifications,
                  color: Colors.white,
                  
                   ),
                ),
                   
                   
              ],),
                SizedBox(
                  height: 25,
                ),
           
              //SEARCH BAR
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(Icons.search,
                    color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Search", 
                    style: TextStyle(
                      color: Colors.white,
                    ),)
           
                  ],
                ),
              ),
              
              SizedBox(height: 25,),
           
              // how do you feel?
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How do you feel?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
           
                  Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  ),
                ],
              ),
           
              SizedBox(height: 25,),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // bad
           
                 Column(
                   children: [
                     EmoticonFace(
                      emoticonFace: "😞",
                     ),
           
                     SizedBox(height: 8,),
                         
                      SmallText(text: "Bad", color: Colors.white,)
                   ],
                 ),
           
                  //fine
           
                 Column(
                   children: [
                     EmoticonFace(
                      emoticonFace: "🤗",
                     ),
           
                     SizedBox(height: 8,),
                         
                      SmallText(text: "Fine", color: Colors.white,)
                   ],
                 ),
           
           
           
                  // well
                 Column(
                   children: [
                     EmoticonFace(
                      emoticonFace: "☺",
                     ),
           
                     SizedBox(height: 8,),
                         
                      SmallText(text: "Well", color: Colors.white,)
                   ],
                 ),
           
                  // execellent
           
                Column(
                   children: [
                     EmoticonFace(
                      emoticonFace: "😉",
                     ),
           
                     SizedBox(height: 8,),
                         
                      SmallText(text: "Execelent", color: Colors.white,)
                   ],
                 ),
           
                ],
              ), 
              ],
             ),
           ),
           //SizedBox(height: 25,),

            Expanded(
              
              child: Container(
                padding: EdgeInsets.only(left:25, right:25, top:25),
                
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
                          Text("Exercises", 
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
                         child: ListView(
                          children: [
                            ExerciseTile(
                              myIcon: Icons.favorite,
                              color:Colors.red,
                              exerciseName: "Speaking Skills",
                              numberOfExercises: "23",
                            ),
                            ExerciseTile(
                              myIcon: Icons.person,
                              color:Colors.green,
                              exerciseName: "Reading Skills",
                              numberOfExercises: "17",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.blue,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.orange,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.blue,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.black,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.teal,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.indigo,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                            ExerciseTile(
                              myIcon: Icons.star,
                              color:Colors.orange,
                              exerciseName: "Writing Skills",
                              numberOfExercises: "10",
                            ),
                          ],
                         ),
                       )

                    ],
                  ),
                ),

            ),
            ),

          ],
        )
        
        ),
    );
  }
}