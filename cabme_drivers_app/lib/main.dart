import 'package:cabme_drivers_app/AllScreens/carInfoScreen.dart';
import 'package:cabme_drivers_app/AllScreens/loginScreen.dart';
import 'package:cabme_drivers_app/AllScreens/mainscreen.dart';
import 'package:cabme_drivers_app/AllScreens/registrationscreen.dart';
import 'package:cabme_drivers_app/AllScreens/searchScreen.dart';
import 'package:cabme_drivers_app/DataHandler/appData.dart';
import 'package:cabme_drivers_app/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  currentfirebaseUser = FirebaseAuth.instance.currentUser;

  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
//drivers reference for storage
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");
//drivers for ride request
DatabaseReference rideRequestRef = FirebaseDatabase.instance.reference().child("drivers").child(currentfirebaseUser.uid).child("newRide");
//drvers reference to retrieve data
DatabaseReference newRequestsRef = FirebaseDatabase.instance.reference().child("Ride Requests");


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'CabMe Driver App',
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
          CarInfoScreen.idScreen: (context) => CarInfoScreen(),
          //edits by rak+ in search screen
          //SearchScreen.idScreen: (context) => SearchScreen(),
          //
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


