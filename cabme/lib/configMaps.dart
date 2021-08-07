import 'package:firebase_auth/firebase_auth.dart';

import 'Models/allUsers.dart';

String mapKey = "AIzaSyDbGFAlrzmKn46IYdBT4zdo-P69zywEiWs";

User firebaseUser;

Users userCurrentInfo;

int driverRequestTimeOut = 30;

String statusRide = "";

String carDetailsDriver = "";

String driverName = "";
String rideStatus = "Driver is on it's way";
String driverphone = "";

double starCounter=0.0;
String title="";

String carRideType="";

String serverToken = "key=AAAAWSW3dgg:APA91bFexbKLfbcQfrtHj5CEvNAJkFmho7U1LKVkFpmVlsj6zYQvb_lZC-jlO55jzllH1V3waFkorBaT2rPJgeEYAyf2RX6eR8n-4n6eSTwrdOa1RN7cZC44qvCe5pkrbdPd9xi44ge0";