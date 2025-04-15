import 'package:ezybooking/views/screens/auth/login_screen.dart';
import 'package:ezybooking/views/screens/bottom_navigation_bar.dart';
import 'package:ezybooking/views/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController{
  // final currentUser = FirebaseAuth.instance.currentUser?.uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final SharedPreferences _preferences;

  // Future<void> checkUserStatus(BuildContext context)async{
  //   // bool isFirstTime = await getFirstTimeUser();
  //   Future.delayed(Duration(seconds: 4),() {
  //     if(context.mounted){
  //       if (isFirstTime) {
  //         Get.off(() => OnboardingScreen());
  //       } else if (currentUser != null) {
  //         Get.off(() => BottomNavBarWidget());
  //       } else {
  //         Get.off(() => LoginScreen());
  //       }
  //     }
  //   },);
  // }

  // Future<void> setFirstTimeUser(bool value)async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.setBool("isFirstTime", value);
  // }
  //
  // Future<bool> getFirstTimeUser()async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getBool("isFirstTime") ?? true;
  // }

  Future<void> _initialize() async {
    _preferences = await SharedPreferences.getInstance();
    bool isFirstTime = _preferences.getBool("isFirstTime") ?? true;
    String? currentUser = _auth.currentUser?.uid;

    await Future.delayed(Duration(seconds: 4)); // Splash delay

    if (isFirstTime) {
      await _preferences.setBool("isFirstTime", false);
      Get.off(() => OnboardingScreen());
    } else if (currentUser != null) {
      Get.off(() => BottomNavBarWidget());
    } else {
      Get.off(() => LoginScreen());
    }
  }


  @override
  void onInit() {
    super.onInit();
    _initialize();
  }
}