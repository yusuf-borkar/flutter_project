import 'package:cabme/AllScreens/aboutScreen.dart';
import 'package:cabme/AllScreens/loginScreen.dart';
import 'package:cabme/AllScreens/mainscreen.dart';
import 'package:cabme/AllScreens/registrationscreen.dart';
import 'package:cabme/AllScreens/searchScreen.dart';
import 'package:cabme/DataHandler/appData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef = FirebaseDatabase.instance.reference().child("Ride Requests");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'CabMe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FirebaseAuth.instance.currentUser == null ? LoginScreen.idScreen : MainScreen.idScreen,
        routes:
        {
          RegistrationScreen.idScreen: (context) => RegistrationScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
          AboutScreen.idScreen: (context) => AboutScreen(),
          //edits by rak+ in search screen
          //SearchScreen.idScreen: (context) => SearchScreen(),
          //
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


