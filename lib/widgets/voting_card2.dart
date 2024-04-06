import 'package:flutter/material.dart';
import 'package:mug_app/const/colors.dart';
import 'package:mug_app/utils/dimensions.dart';
import 'package:provider/provider.dart';

import '../models/candidate_model.dart';
import '../providers/candidate_notify.dart';
import '../utils/app_constants.dart';

class VotingCard extends StatefulWidget {
  final String position;
  final List<CandidateModel> candidates;
  final Function(CandidateModel) onCandidateSelected;

  VotingCard({
    required this.position,
    required this.candidates,
    required this.onCandidateSelected,
  });

  @override
  _VotingCardState createState() => _VotingCardState();
}

class _VotingCardState extends State<VotingCard> {
  CandidateModel? selectedCandidate;

  @override
  Widget build(BuildContext context) {
    final mugCandidatesProvider = Provider.of<CandidateProvider>(context);
    // final votePercent = mugCandidatesProvider.calculatePercentage(widget.candidates[0].id);
    // print("voting  percent ${votePercent}");
    print("here ${widget.candidates[0].image}");
    return Card(
      elevation: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.all(10.0),
          //   child: Text(
          //     widget.position,
          //     style: TextStyle(
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Container(

              // color: Colors.blue,
              color: AppColors.appBarColor,
              // padding: EdgeInsets.all(10.0),
              margin:EdgeInsets.only(bottom:Dimensions.height10 -1),
              padding: EdgeInsets.all(Dimensions.radius15 -1),
              child: Center(
                child: Text(
                  widget.position,
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    // fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.candidates.length,
            itemBuilder: (context, index) {
              CandidateModel candidate = widget.candidates[index];
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      //radius: 20.0,
                      radius: ((Dimensions.radius30 + Dimensions.radius15) - 5),
                      backgroundImage: NetworkImage("${AppConstants.MUG_REST_API_BASE}${candidate.image}"),
                    ),
                    title: Text(candidate.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(candidate.department),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(candidate.department),
                          Text(
                        "(${candidate.votes}votes)",
                        style: TextStyle(
                            // fontSize: Dimensions.font20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                          

                        ],),
                      //   Text(
                      //   "(${candidate.vote}%)",
                      //   style: TextStyle(
                      //       fontSize: Dimensions.font20,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.grey),
                      // ),
          SizedBox(height: Dimensions.height15- Dimensions.height10,),
          buildCategoryCard(
            double.parse("${mugCandidatesProvider.calculatePercentage(candidate.id)}")
            
            ),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          selectedCandidate = candidate;
                          widget.onCandidateSelected(candidate);
                        });
                      },
                      child: Container(
                        width: Dimensions.width20 + 5,
                        height: Dimensions.height20 + 5,
                        // width: 24.0,
                        // height: 24.0,
                        //margin: EdgeInsets.only(bottom: 40),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedCandidate == candidate
                              ? Colors.blue
                             // ? Colors.greenAccent
                              : Colors.transparent,
                          border: Border.all(
                           // color: Colors.greenAccent,
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                        child: selectedCandidate == candidate
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: Dimensions.font16,
                                // size: 16.0,
                              )
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height15,)
                ],
              );
            },
          ),
          SizedBox(height: Dimensions.height20 ,)
        ],
      ),
    );
  }
}


Container buildCategoryCard(
        double percentage
      // IconData icon, String title, int amount, int percentage
      ) {
    return Container(
      //padding: EdgeInsets.only( bottom: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.height10),
        color: Colors.white,
      ),
      // height: Dimensions.height30 + 5 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // SizedBox(
          //   height: 15,
          // ),
          Stack(
            children: [
              
              Container(
                // height: Dimensions.height10 -3,
                height: 5,
                //width: 400,
              //  width: Dimensions.width30 * 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2), color: Colors.grey),
              ),
              Container(
                height: 5,
                width: percentage,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0XFF00B686)),
              )
            ],
          ),
          
        ],
      ),
    );
  }

