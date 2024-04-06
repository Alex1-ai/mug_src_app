import 'package:flutter/material.dart';
// import 'package:mug_app/widgets/news_folder/listitem.dart';

import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import '../appbar_icons.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String updatedAt;

  // final ListItem item;
  const DetailsScreen({super.key, required this.title,  required this.description, required this.image, required this.updatedAt});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  
                   AspectRatio(
          aspectRatio: 11 / 9, // Adjust the aspect ratio as needed
          // aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(6),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder_empty.png'),
              // image: NetworkImage(imageUrl!),
              image: NetworkImage("${AppConstants.MUG_REST_API_BASE}$image"),
              fit: BoxFit.cover, // This ensures the image covers the available space
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/placeholder_error.jpeg');
              },
            ),
          ),
        ),
                  // Image.asset("assets/images/slider/mug.jpg"),
                   SizedBox(
                    height: 10.0,
                   ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          // height: 30.0,
                          height: Dimensions.height30 -16
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.person),
                            Text(
                              "SRC Office",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(child:Container()),

                            Icon(Icons.date_range),
                            Text(
                              updatedAt,
                              style: TextStyle(
                                // fontSize: 12.0,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),

                          ],
                        ),



                        SizedBox(height: Dimensions.height15,),
                        Text(
                          // "MUg News i just creating the news. Methodist University Ghana is a private tertiary institution. Methodist University admits students of any race, colour, national and ethnic origin to all the programs, activities, rights and privileges made available to students of the school. It does not discriminate on the basis of race, colour, national and ethnic origin in admissions policies, athletic and other school administered programs. Methodist University Ghana is a private tertiary institution. Methodist University admits students of any race, colour, national and ethnic origin to all the programs, activities, rights and privileges made available to students of the school. It does not discriminate on the basis of race, colour, national and ethnic origin in admissions policies, athletic and other school administered programs.",
                          description,
                          style: TextStyle(
                            fontSize: Dimensions.font16 +2,
                          ),
                          )
                      ],

                    ),
                    ),


                ],
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: Dimensions.height45),
              child: AppBarIcons(
                    function: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back_ios),
              // IconButton(
              //   onPressed: (){
              //     Navigator.pop(context);
              //   }
              // , icon:Icon(
              //   Icons.arrow_back_ios,
              //   color: Colors.white,
              // ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}