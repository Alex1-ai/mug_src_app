import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class ExerciseTile extends StatelessWidget {
  final IconData myIcon;
  final Color color;
  final String exerciseName;
  final String numberOfExercises;
  ExerciseTile({super.key, 
  required this.myIcon, 
  required this.color, 
  required this.exerciseName, 
  required this.numberOfExercises});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.only(bottom:12.0),
      padding: EdgeInsets.only(bottom: Dimensions.width10 +1),
      child: Container(
                          // padding: EdgeInsets.all(16),
                          padding: EdgeInsets.all(Dimensions.width15 + 1),
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.circular(16),
    
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Container(
                                  // padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.all(Dimensions.width15 + 1),
                                  decoration:BoxDecoration(
                                    color:color,
                                    borderRadius: BorderRadius.circular(15)
    
                                  ),
                                  child: Icon(
                                    myIcon ,
                                    color:Colors.white,
                                    ),
                                    ),
                              SizedBox(
                                width: Dimensions.width10+ 2,
                              ),
    
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // title
                                  Text(
                                    exerciseName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:TextStyle(
                                      fontWeight:FontWeight.bold,
                                      // fontSize:16,
                                      fontSize: Dimensions.font16
                                    ),
                                  ),
                                  SizedBox(height:Dimensions.height10 -5),
                                  //subtitle
                                  Text(
                                    "Faculty of ${numberOfExercises}",
                                    overflow: TextOverflow.ellipsis,
                                     maxLines: 1,
                                    style:TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:Colors.grey,
                                      // fontSize:14,
                                      fontSize: Dimensions.font16-1
                                    ),
                                  ),
                                ],
                              ),
                              ],),
    
                            //  Icon(Icons.arrow_forward_ios),
                            // Icon(Icons.more_horiz)
    
                            ],
                          ),
    
    
                        ),
    );
  }
}