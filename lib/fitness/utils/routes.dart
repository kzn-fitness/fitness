import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/screens/BuyPrime.dart';
import '../ui/screens/bookmarkscren.dart';
import '../ui/screens/homescreen/editprofilescreen.dart';
import '../ui/screens/homescreen/homescreen.dart';
import '../ui/screens/homescreen/serchscreen.dart';
import '../ui/screens/homescreen/yoganextscreen.dart';
import '../ui/screens/homescreen/yogascreen.dart';
import '../ui/screens/introSlider/introslider.dart';
import '../ui/screens/notificationscreen.dart';
import '../ui/screens/singnin&signup/forgetpassword.dart';
import '../ui/screens/singnin&signup/newpassword.dart';
import '../ui/screens/singnin&signup/otpscreen.dart';
import '../ui/screens/singnin&signup/signUpscreen.dart';
import '../ui/screens/singnin&signup/signinmethod.dart';
import '../ui/screens/singnin&signup/signinscreen.dart';
import '../ui/screens/splashScreen.dart';
import '../ui/screens/usergoal&wh/aboutYOurSelftLevel.dart';
import '../ui/screens/usergoal&wh/aboutYourself.dart';
import '../ui/screens/usergoal&wh/aboutYourselfHeight.dart';
import '../ui/screens/usergoal&wh/aboutYourselfgoal.dart';
import '../ui/screens/usergoal&wh/aboutyourselfage.dart';
import '../ui/screens/usergoal&wh/aboutyourselfweight.dart';
import '../ui/screens/usergoal&wh/profile.dart';
import '../ui/screens/welcomescreen.dart';
import '../ui/screens/winnerscreen.dart';
import '../ui/screens/workoutallactivitylist.dart';
import '../ui/screens/workoutdetails.dart';
import '../ui/screens/workoutlevel.dart';
import '../ui/screens/yogascreen/detailsScreen.dart';

class Routes {
  static const splash = "splash";
  static const introscreen = "introscreen";
  static const welcomescreen = "welcomescreen";
  static const yourself = "yourself";
  static const yourselfage = "yourselfage";
  static const yourselfweight = "yourselfweight";
  static const yourselfheight = "yourselfheight";
  static const yourselfgoal = "yourselfgoal";
  static const yourselflevel = "yourselflevel";
  static const profilescreen = "profilescreen";
  static const signinmethod = "signinmethod";
  static const signUpscreen = "signupscreen";
  static const signInscreen = "signInscreen";
  static const forgetpasseord = "forgerpassword";
  static const otpscreen = "otpscreen";
  static const passwordscreen = "passwordscreen";
  static const fitnesshomepage = "fitnesshomepage";
  static const workoutlevelscreen = "workoutlevelscreen";
  static const workoutdetailscreen = "workoutdetailscreen";
  static const workoutallactivity = "workoutallactivity";
  static const bookmark = "bookmark";
  static const notifaction = "notification";
  static const getready = "GetReady";
  static const mainyoga = "mainyogascreen";
  static const primescreen = "primescreen";
  static const yoganext = "yoganextscreen";
  static const editprofile = "editprofile";
  static const winner = "winnerscreen";

  static String currentRoute = splash;

  static const serchscrren = "serchscreen";
  static Route<dynamic> onGenetate(RouteSettings settings) {
    //
    currentRoute = settings.name ?? "";
    print("Current Route is $currentRoute");

    //

    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(builder: (_) => FitnessSplashScreen());
      case introscreen:
        return CupertinoPageRoute(builder: (_) => IntroSlider());
      case welcomescreen:
        return CupertinoPageRoute(builder: (_) => WelcomeScreen());
      case yourself:
        return CupertinoPageRoute(builder: (_) => AboutYourself());
      case yourselfage:
        return CupertinoPageRoute(builder: (_) => AboutyourSelfage());
      case yourselfweight:
        return CupertinoPageRoute(builder: (_) => AboutYourselfWeight());
      case yourselfheight:
        return CupertinoPageRoute(builder: (_) => AboutyouselfHeight());
      case yourselfgoal:
        return CupertinoPageRoute(builder: (_) => AboutYourselfGoal());
      case yourselflevel:
        return CupertinoPageRoute(builder: (_) => AboutYourselfLevel());
      case signinmethod:
        return CupertinoPageRoute(builder: (_) => SignInMethodScreen());
      case profilescreen:
        return CupertinoPageRoute(builder: (_) => ProfileScreen());
      case signUpscreen:
        return CupertinoPageRoute(builder: (_) => SignUpScreen());
      case signInscreen:
        return CupertinoPageRoute(builder: (_) => SignInScreen());
      case forgetpasseord:
        return CupertinoPageRoute(builder: (_) => Forgetpassword());
      case otpscreen:
        return CupertinoPageRoute(builder: (_) => OtpScreen());
      case passwordscreen:
        return CupertinoPageRoute(builder: (_) => NewPasswordScreen());
      case workoutlevelscreen:
        return CupertinoPageRoute(builder: (_) => Workoutlevel());
      case fitnesshomepage:
        return CupertinoPageRoute(builder: (_) => FitnessHomepage());
      case workoutdetailscreen:
        return workoutdetailsScreen.routes(settings);
      case workoutallactivity:
        return Workoutseeallactivity.routes(settings);
      case notifaction:
        return CupertinoPageRoute(builder: (_) => NotificationScren());
      case bookmark:
        return CupertinoPageRoute(builder: (_) => Bookmarkscreen());
      case serchscrren:
        return CupertinoPageRoute(builder: (_) => SerchScreen());
      case getready:
        return CupertinoPageRoute(builder: (_) => Getready());
      case mainyoga:
        return Yogamainscreen.routes(settings);
      case winner:
        return CupertinoPageRoute(builder: (_) => WinnerScreen());
      case primescreen:
        return CupertinoPageRoute(builder: (_) => BuyPrime());
      case yoganext:
        return YoganextScreen.routes(settings);
      case editprofile:
        return CupertinoPageRoute(builder: (_) => EditProfile());

      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  backgroundColor: Colors.blue,
                ));
    }
  }
}
