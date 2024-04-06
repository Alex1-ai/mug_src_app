import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mug_app/auth/login.dart';
import 'package:mug_app/auth/register.dart';
import 'package:mug_app/services/accountAuth.dart';
import 'package:mug_app/providers/auth.dart';
import 'package:mug_app/providers/candidate_notify.dart';
import 'package:mug_app/providers/user_profile_notify.dart';
import 'package:mug_app/screens/btm_bar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:mug_app/screens/library.dart';
import 'package:mug_app/screens/main_page.dart';
import 'package:mug_app/screens/news.dart';
import 'package:mug_app/screens/order_food.dart';
import 'package:mug_app/screens/profile.dart';
import 'package:mug_app/screens/contributors.dart';
import 'package:mug_app/screens/reader.dart';
import 'package:mug_app/screens/gallery.dart';
import 'package:mug_app/screens/timetable.dart';
import 'package:mug_app/screens/vote.dart';

import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/edit_profile.dart';
import 'auth/reset_password.dart';
import 'firebase_options.dart';
import 'providers/mug_news_notify.dart';
import 'providers/positions_notify.dart';
import 'providers/postal_notify.dart';
import 'providers/timetable_notify.dart';
import 'screens/terms_condition.dart';
import 'splash_screen/welcome_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // WidgetFlutterBinding.ensureInitialization()

  // final providerContainer = ProviderContainer();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            // use create instead of builder
            value: Auth(),
          ),

            // use create instead of builder
          ChangeNotifierProvider(create: (_) => UserProfileProvider(AccountAuth())),
          ChangeNotifierProvider(
                create: (context) => MugNewsProvider(),),
          ChangeNotifierProvider(
      create: (context) => CandidateProvider(),

    ),
    ChangeNotifierProvider(
      create: (context) => PositionProvider()),
    ChangeNotifierProvider(create: (context)=>TimetableProvider()),
    ChangeNotifierProvider(create: (context)=>PostalProvider())



      ],



     child: GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // home:Login_Screen(),
     //home: MainPage(),
    //  home: BottomBarScreen(),
     //home: ChatScreen(),

     //home:HomeScreen(),
    //  initialRoute: "/",
    // initialRoute: SplashScreen.routeName,
    initialRoute:WelcomeScreen.routeName,

    // home:const Login_Screen(),
    home: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot){
        if (snapshot.hasData && snapshot.data != null){
          return BottomBarScreen();
        } else if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Login_Screen();
      }
    ),

      routes:  {

                 BottomBarScreen.routeName:(ctx)=>BottomBarScreen(),

                 ResetPassword.routeName:(ctx)=>ResetPassword(),
                 WelcomeScreen.routeName:(ctx)=>WelcomeScreen(),
                 Login_Screen.routeName: (ctx)=>Login_Screen(),
                 Register_Screen.routeName:(ctx)=>Register_Screen(),
                 TermsAndCondition.routeName:(ctx)=>TermsAndCondition(),
                 MainPage.routeName:(ctx)=>MainPage(),
                 EditProfile.routeName:(ctx)=>EditProfile(),
                 ProfileScreen.routeName:(ctx)=>ProfileScreen(),
                //  ChatScreen.routeName:(ctx)=>ChatScreen(),
                 NewsScreen.routeName: (ctx)=>NewsScreen(),
                 TimetableScreen.routeName:(ctx)=>TimetableScreen(),
                 ReaderScreen.routeName:(ctx)=>ReaderScreen(),
                 OrderFoodScreen.routeName:(ctx)=>OrderFoodScreen(),
                 LibraryScreen.routeName:(ctx)=>LibraryScreen(),
                 GalleryScreen.routeName:(ctx)=>GalleryScreen(),
                 VoteScreen.routeName: (ctx)=>VoteScreen(),
                 Contributors.routeName: (ctx)=>Contributors()


            },
    ),





    );


  }
}


