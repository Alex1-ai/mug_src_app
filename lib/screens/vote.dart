import 'package:flutter/material.dart';
import 'package:mug_app/services/data.dart';
import 'package:mug_app/providers/user_profile_notify.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:mug_app/widgets/big_text.dart';
import 'package:mug_app/widgets/voting_card2.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';
import '../models/candidate_model.dart';
import '../models/position_model.dart';
import '../providers/candidate_notify.dart';
import '../providers/positions_notify.dart';
import '../widgets/alert_dialog.dart';

class VoteScreen extends StatefulWidget {
  static const routeName = "/vote";

  @override
  _VoteScreenState createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  Future<void> _refresh(BuildContext context) async {
    print("fetching data");
    // await Provider.of<PostalProvider>(context, listen:false)
    //      .fetchData();
    // await Provider.of<MugNewsProvider>(context, listen: false)
    //     .fetchNews();
    await Provider.of<CandidateProvider>(context, listen:false)
         .fetchData();
        
    await Provider.of<PositionProvider>(context, listen:false)
         .fetchPositions();

    // await Provider.of<TimetableProvider>(context, listen:false)
    //      .fetchTimetableItems();
  }
  

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    final positionsProvider = Provider.of<PositionProvider>(context);
    // List<Position> positions = [];
    List<Position> positions = positionsProvider.positions;
    final mugCandidatesProvider = Provider.of<CandidateProvider>(context);
    final mugCandidates = mugCandidatesProvider.candidates;
    final userProvider = Provider.of<UserProfileProvider>(context);
    String? email = userProvider.userProfile!.email;
    print(userProvider.userProfile!.email);
    // print("positions ${positionsData != null? positionsData[0].name : "not initial"}:");
    print(mugCandidates.length);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("MUG-Election"),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,

      ),
      body: RefreshIndicator(
        onRefresh: ()=>_refresh(context),
        child: Column(
          children: [
            // Title
            Container(
             // color:AppColors.whiteColor ,
              margin: EdgeInsets.only(top:(Dimensions.height30 / 10)+2),
              //height: (Dimensions.height45 * 5.3),
              padding: EdgeInsets.all(Dimensions.width10/ 5 ),
              decoration: BoxDecoration(
                
              ),
              //width: 200,
              // padding: EdgeInsets.only( 
              //   left:(Dimensions.width30 + Dimensions.width15),
              //    right:(Dimensions.width30 + Dimensions.width15),
              //    bottom: (Dimensions.width30 + Dimensions.width15),),
              
              
              
              
              child: Center(
                // child: Image.asset('assets/images/slider/mucg2.jpeg'),
                child: CircleAvatar(
                                radius: Dimensions.radius30 * 3.2,
                                backgroundImage: AssetImage(
                                    "assets/images/vote.jpg",
                                    
                                    
                                    
                                    
                                    ),
      
      
                                    
                                    
                              ),
                              
                
                ),
              
              ),
            Container(
              // margin: EdgeInsets.only(top: 10.0),
              margin: EdgeInsets.only(top: Dimensions.height10 + 2),
              child: Text(
                "Board of Directors Election",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            // Voting Cards
            Expanded(
              child: positions.isEmpty
            ? Center(
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
                    Center(
                      child: Text(
                        "No candidate currently available!!",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // You can add an image here if you want
                  ],
                ),
              )
            : Padding(
                padding:  EdgeInsets.only(
                  left:Dimensions.height10,
                   right:Dimensions.height10
                  ),
                child: ListView.builder(
                  itemCount: positions.length,
                  itemBuilder: (context, index) {
                    String position = positions[index].name;
                    List<CandidateModel> positionCandidates = mugCandidates
                        .where((candidate) => candidate.position == position)
                        .toList();
                    return Column(
                      children: [
                        VotingCard(
                          position: position,
                          candidates: positionCandidates,
                          onCandidateSelected: (selectedCandidate) {
                            setState(() {
                              // Update the selected candidate for the position
                              positionCandidates.forEach((candidate) {
                                candidate.selected = (candidate == selectedCandidate);
                              });
                            });
                          },
                        ),
                        SizedBox(height: Dimensions.height10 - 2,)
                      ],
                    );
                  },
                ),
              ),
            ),
            // Vote Button
             Container(
              // width: 300,
              width: Dimensions.width30 * 10,
              // height: 60,
              height: Dimensions.height30 + Dimensions.height30,
              child:mugCandidates.isEmpty? SizedBox(): ElevatedButton(
                style:
                ElevatedButton.styleFrom(
                  primary:AppColors.iconBackgroundColor,
                  
                  
                  // primary: Colors.teal,
                  // primary:AppColors.mugTopLevelColor
                ),
                onPressed: () async{
                  // setState(() {
                  //   _isLoading = true;
                  // });
                  
                  // Handle vote button press
                  List<CandidateModel> selectedCandidates = mugCandidates
                  // List<int> selectedCandidates = mugCandidates
                      .where((candidate) => candidate.selected)
                      .map((candidate) => candidate)
                      // .map((candidate) => candidate.name)
                      .toList();
                  //print("${positions.length}, ${candidates.length}");
                  if (positions.length == selectedCandidates.length) {
                          try{
      
                            
                            await mugCandidatesProvider.castVote(selectedCandidates, email!);
                            
                          // print(selectedCandidates);
                  
                          showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(icon:Icons.check_circle_outline,color:Colors.green,title:'Thank you for Voting!', subtitle: 'Leadership is about service.',);
                          },
                        );
      
                          }catch(e){
                            showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                             icon:Icons.cancel_outlined,
                              //icon:Icons.warning,
                            color:Colors.red,title:'Error Message! ', subtitle: '${e} \nSomething went wrong.(hint:make sure you check internet connection,make sure you Vote for all positions available. or you have already voted!)',);
                          },
      
                          
                        );
                        
      
      
                          }
      
                      
                      
      
                  }else{
                    showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                             icon:Icons.cancel_outlined,
                              //icon:Icons.warning,
                            color:Colors.red,title:' Invalid Vote! ', subtitle: 'Please try again,\nVote for all positions available.',);
                          },
                        );
            
                  }
                  setState(() {
                    _isLoading=false;
                  });
                  print('Selected Candidates: $selectedCandidates ,email: $email');
                  
                },
                 child:BigText(text: ' Submit Vote ',color: Colors.white,size:Dimensions.font26,
      
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
