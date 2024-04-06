import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RangeComponent extends StatelessWidget {
  const RangeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return          Container(
            margin: EdgeInsets.only(
              // top: MediaQuery.of(context).size.width * 1.75,
              top: MediaQuery.of(context).size.width * 1.87,
              //right: 20
            ),
            padding: EdgeInsets.all(17),
            // width: MediaQuery.of(context).size.width * 1,
            // width: MediaQuery.of(context).size.width * 1.2,
            width: MediaQuery.of(context).size.width * 1.7,
            // height: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kartu Rencana Studi",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          // top: MediaQuery.of(context).size.width * 0.04,
                          top: MediaQuery.of(context).size.width * 0.02,
                          //left: MediaQuery.of(context).size.width * 0.05,
                          //right: MediaQuery.of(context).size.width * 0.05,
                          //right: 20
                        ),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.28,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            new BoxShadow(blurRadius: 5.0, color: Colors.grey)
                          ],
                          borderRadius: new BorderRadius.circular(20),
                        ),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Row(
                                
                                children: [
                                  Text(
                                    "Indeks Kumulatif : ",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold
                                        ),
                                  ),
                                  Text(
                                    "3.9",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                                 IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right_rounded, size: 20,), color: Colors.grey,)
                            ]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [Padding(
                              padding: EdgeInsets.only(
                                top: 0
                              ),
                              child: new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * 0.8,
                                
                                // lineHeight: 20.0,
                                lineHeight:20,
                                percent: 0.9,
                                center: Text(
                                  "3.9 / 4.0",
                                  style: new TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                                barRadius: Radius.circular(20),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.amber[800],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "SKS yang diambil : ",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold
                                      ),
                                ),
                                Text(
                                  "155 SKS",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15
                              ),
                              child: new LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * 0.8,
                                lineHeight: 20.0,
                                percent: 0.8,
                                center: Text(
                                  "155 / 169",
                                  style: new TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                                barRadius: Radius.circular(20),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                backgroundColor: Colors.grey,
                                progressColor: Colors.green,
                              ),
                            ),
                            ]),
                          
                        ]),

                        /*new CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 1.0,
                          center: new Text("100%"),
                          progressColor: Colors.green,
                        ),*/
                      ),
                    ])
              ],
            ),
          );
  }
}