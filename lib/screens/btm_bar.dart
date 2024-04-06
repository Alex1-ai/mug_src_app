import 'package:flutter/material.dart';

import 'package:mug_app/providers/postal_notify.dart';
import 'package:mug_app/providers/user_profile_notify.dart';

import 'package:mug_app/screens/main_page.dart';
import 'package:mug_app/screens/news.dart';
import 'package:mug_app/screens/profile.dart';
import 'package:mug_app/screens/reader.dart';
import 'package:mug_app/screens/timetable.dart';
import 'package:mug_app/screens/vote.dart';
import 'package:provider/provider.dart';

import '../providers/candidate_notify.dart';
import '../providers/mug_news_notify.dart';
import '../providers/positions_notify.dart';
import '../providers/timetable_notify.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = "/bottom-nav";
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  var _isLoading = false;

  void getData()async{
    setState(() {
      _isLoading = true;
    });

    await Provider.of<UserProfileProvider>(context, listen: false)
        .fetchUserProfile();
    await Provider.of<PostalProvider>(context, listen:false)
         .fetchData();
    await Provider.of<MugNewsProvider>(context, listen: false)
        .fetchNews();
    
    await Provider.of<CandidateProvider>(context, listen:false)
         .fetchData();
        
    await Provider.of<PositionProvider>(context, listen:false)
         .fetchPositions();

    await Provider.of<TimetableProvider>(context, listen:false)
         .fetchTimetableItems();

    
    


        
    setState(() {
        _isLoading = false;
      });

  }
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': MainPage(), 'title': "Home Screen"},
    {'page': NewsScreen(), 'title': "News Screen"},
    {'page': TimetableScreen(), 'title': "Timetable Screen"},
    // {'page': ReaderScreen(), 'title': "Reader Screen"},
    {'page': VoteScreen(), 'title': "Reader Screen"},
    {'page': ProfileScreen(), 'title': "Profile Screen"},
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      // body:_isLoading? Center(child: CircularProgressIndicator(),)
      // : _pages[_selectedIndex]['page'],
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
         
       // backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
        // selectedItemColor: _isDark ? Colors.lightBlue.shade200 : Colors.black87,
        //currentIndex: _selectedNavbar,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        //showUnselectedLabels: true,

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
              //Icons.chat_outlined,
              Icons.how_to_vote,
              size: 30,
            ),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],

      )
    );
  }
}