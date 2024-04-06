import 'package:flutter/material.dart';

class BioData extends StatefulWidget {
  const BioData({super.key});

  @override
  State<BioData> createState() => _BioDataState();
}

class _BioDataState extends State<BioData> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
                  Container(
            margin: EdgeInsets.only(
              // top: MediaQuery.of(context).size.width * 1.25,
              top: MediaQuery.of(context).size.width * 1.37,
              //right: 20
            ),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 1,
            // width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.width * 0.6,
            // height: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Biodata Mahasiswa",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ])
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              // top: MediaQuery.of(context).size.width * 1.38,
              top: MediaQuery.of(context).size.width * 1.48,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              //right: 20
            ),
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.181,
            decoration: new BoxDecoration(
              color: Colors.white,
              boxShadow: [new BoxShadow(blurRadius: 5.0, color: Colors.grey)],
              borderRadius: new BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage("assets/images/avatar/avatar5.jpg"),
                        width: 60,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //width: MediaQuery.of(context).size.width * 0.1,
                            child: Text(
                              " Sultan Mafia",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                " 109800200",
                                style: TextStyle(
                                    fontFamily: "SourceSerifLight",
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                " Sistem Informasi",
                                style: TextStyle(
                                    fontFamily: "Rowdies",
                                    fontSize: 13,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height:MediaQuery.of(context).size.width * 0.09,

                  child: Ink(
                          decoration: ShapeDecoration(
                            color: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red[400],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Text(
                              "Lengkapi Profile",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )


                  // RaisedButton(
                  //   onPressed: () {},
                  //   color: Colors.red[400],
                  //   elevation: 0,
                  //   splashColor: Colors.amber,
                  //   shape: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide(
                  //         color: Colors.white,
                  //         //width: MediaQuery.of(context).size.width*0.1
                  //       ),
                  //       ),
                  //   child: Text(
                  //     "Lengkapi Profile",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                ),
              
              
              
              
              ],
            ),
          ),
          
          
      ],
    );
  }
}