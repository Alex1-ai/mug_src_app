import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';


import '../const/colors.dart';
import '../utils/dimensions.dart';


class ReaderScreen extends StatefulWidget {
  static const routeName = "/reader";
  const ReaderScreen({Key? key}) : super(key: key);

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

enum TtsState { playing, stopped, paused }

class _ReaderScreenState extends State<ReaderScreen> {
  late FlutterTts flutterTts;
  dynamic languages;
  // late String language;
  String langauge = 'en';
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  FocusNode _focusNode = FocusNode();


  late String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  @override
  void initState() {
    initTts();
    // TODO: implement initState
    super.initState();
    
  }

  initTts() {
    flutterTts = FlutterTts();

    _getLanguages();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((message) {
      setState(() {
        print("error: $message");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setPauseHandler(() {
      print("Paused");
      ttsState = TtsState.paused;
    });
  }

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    print("Available Languages ${languages}");
    if (languages != null) {
      setState(() {
        return languages;
      });
    }
  }

  Future _speak() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterTts.stop();
  }

  List<DropdownMenuItem<String>> getLangaugeDropDownMenuItems() {
    var items = <DropdownMenuItem<String>>[];
    for (String type in languages) {
      items.add(DropdownMenuItem(
        value: type,
        child: Text(type),
      ));
    }

    return items;
  }

  void changeLanguageDropDownItem(String? selectType) {
    setState(() {
      //language = selectType!;
      // flutterTts.setLanguage(language);
      flutterTts.setLanguage('en');
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  Widget build(BuildContext context) {
  Size  size = MediaQuery.of(context).size;
    return Scaffold(
              
              bottomNavigationBar: bottomBar(),
              appBar: AppBar(
                // leading:IconButton(onPressed: (){
                //   Navigator.pop(context);

                // }, icon: Icon(Icons.arrow_back)),
                title: Text("Reader"),
                centerTitle: true,
                backgroundColor:AppColors.appBarColor,
                // backgroundColor: Colors.indigo,
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(children: [
                    SizedBox(height: size.height * 0.016),
                    _inputSection(),
                    //languages != null ? _languageDropDownSection() : Text(""),
                    SizedBox(height: size.height * 0.005,),
                    _buildSliders()
                  ]),
                ),
              )
              );
    
  }

  Widget _buildSliders() {
    return Column(
      children: [
        Text("Volume"),
        _volume(), 
        Text("Pictch"),
        _pitch(),
        Text('Speed'),
         _rate()],
    );
  }

  Widget _volume() {
    return Slider(
        value: volume,
        onChanged: (newVolume) {
          setState(() => volume = newVolume);
        },
        min: 0.0,
        max: 1.0,
        divisions: 10,
        label: "Volume: $volume");
  }

  Widget _pitch() {
    return Slider(
        value: pitch,
        onChanged: (newPitch) {},
        min: 0.5,
        max: 2.0,
        divisions: 15,
        label: "Pitch: $pitch",
        activeColor: Colors.red);
  }

  Widget _rate() {
    return Slider(
        value: rate,
        onChanged: (newRate) {
          setState(() => rate = newRate);
        },
        min: 0.0,
        max: 1.0,
        divisions: 10,
        label: "Rate: $rate",
        activeColor: AppColors.appBarColor
        // activeColor: Colors.indigo
        );
  }

  Widget _inputSection() => Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only( left: Dimensions.width10 - 7, right: Dimensions.width10 - 7),
        child: GestureDetector(
          onTap: (){
            _focusNode.unfocus();
          },
          child: TextField(onChanged: (String value) {
            _onChange(value);
        
            
          },
          maxLines: 16,
          // decoration: InputDecoration(
          //   hintText: "Enter your text here ...."
          // ),
          decoration: InputDecoration(
              hintText: "Enter your text here ....",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                color: AppColors.mainColor2,
              ),
              borderRadius: BorderRadius.circular(12),
              
              ),
            ),
          ),
        ),
      );

  // Widget _languageDropDownSection() => Container(
  //     padding: EdgeInsets.only(top: 50.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         DropdownButton(
  //           value: language,
  //           items: getLangaugeDropDownMenuItems(),
  //           onChanged: changeLanguageDropDownItem,
  //         )
  //       ],
  //     ));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [IconButton(onPressed: () => func, icon: Icon(icon))],
    );
  }

  bottomBar() => Container(
        margin: EdgeInsets.all(Dimensions.height10),
        // margin: EdgeInsets.all(10.0),
        height: (Dimensions.height10 * 5) + 2,
        // height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              heroTag: 'fab1',
              onPressed: _speak,
              child: Icon(Icons.play_arrow),
              // backgroundColor: Colors.indigo,
              backgroundColor: AppColors.appBarColor,
            ),
            FloatingActionButton(
              onPressed: _stop,
              backgroundColor: Colors.red,
              child: Icon(Icons.stop),
            )
          ],
        ),
      );
}
