// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ezybooking/models/user_model.dart';
// import 'package:ezybooking/views/utils/alert_and_message/messages.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../views/screens/auth/fill_your_profile_screen.dart';
// import '../views/screens/auth/login_screen.dart';
// import '../views/screens/bottom_navigation_bar.dart';
//
// class AuthController extends GetxController{
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final currentUser = FirebaseAuth.instance.currentUser?.uid;
//   Rx<bool> isSignUpLoading = false.obs;
//   Rx<bool> isSignInLoading = false.obs;
//   Rx<bool> signUpRememberMe = false.obs;
//   Rx<bool> signInRememberMe = false.obs;
//   Rx<TextEditingController> signUpEmailController = TextEditingController().obs;
//   Rx<TextEditingController> signUpPasswordController = TextEditingController().obs;
//
//   Rx<TextEditingController> signInEmailController = TextEditingController().obs;
//   Rx<TextEditingController> signInPasswordController = TextEditingController().obs;
//
//   Rx<TextEditingController> nameController = TextEditingController().obs;
//   Rx<TextEditingController> dobController = TextEditingController().obs;
//   Rx<TextEditingController> nickNameController = TextEditingController().obs;
//   Rx<TextEditingController> numberController = TextEditingController().obs;
//
//   RxString selectedGender = "".obs;
//
//
//   Future<void> signUp(BuildContext context)async{
//     try{
//       isSignUpLoading.value = true;
//       _firebaseAuth.createUserWithEmailAndPassword(email: signUpEmailController.value.text, password: signUpPasswordController.value.text).then((value) async{
//         Messages.successScaffoldMessenger(context, "SignUp Successfully");
//         Navigator.push(context, MaterialPageRoute(builder: (context) => FillYourProfileScreen(email:signUpEmailController.value.text),));
//       },);
//       isSignUpLoading.value = false;
//     }catch(e){
//       Messages.errorScaffoldMessenger(context, "SignUp Failed $e");
//       isSignUpLoading.value = false;
//     }
//   }
//   Future<void> signUpLoadUserData()async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     signUpRememberMe.value = preferences.getBool("rememberMe") ?? false;
//     if(signUpRememberMe.value){
//       signUpEmailController.value.text = preferences.getString("email") ?? "";
//       signUpPasswordController.value.text = preferences.getString("password") ?? "";
//     }
//   }
//   Future<void> signUpRemember()async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     if(signUpRememberMe.value){
//       await preferences.setBool("rememberMe", true);
//       await preferences.setString("signUpEmail", signUpEmailController.value.text);
//       await preferences.setString("signUpPassword", signUpPasswordController.value.text);
//     }else{
//       await preferences.remove("rememberMe");
//       await preferences.remove("signUpEmail");
//       await preferences.remove("signUpPassword");
//     }
//
//   }
//
//   Future<void> signIn(BuildContext context) async {
//     try {
//       isSignInLoading.value = true;
//       await _firebaseAuth.signInWithEmailAndPassword(email: signInEmailController.value.text.trim(), password: signInPasswordController.value.text.trim(),);
//       Messages.successScaffoldMessenger(context, "SignIn Successfully");
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBarWidget()), (route) => false,);
//     } catch (e) {
//       Messages.errorScaffoldMessenger(context, "SignIn Failed: $e");
//       print("SignIn Error :$e");
//     } finally {
//       isSignInLoading.value = false;
//     }
//   }
//
//
//   // Future<void> signIn(BuildContext context)async{
//   //   try{
//   //     isSignInLoading.value = true;
//   //     _firebaseAuth.signInWithEmailAndPassword(email: signInEmailController.value.text, password: signInPasswordController.value.text).then((value) async{
//   //       // await signInRemember();
//   //       Messages.successScaffoldMessenger(context, "SignIn Successfully");
//   //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavBarWidget(),),(route)=>false);
//   //     },);
//   //     isSignInLoading.value = false;
//   //   }catch(e){
//   //     Messages.errorScaffoldMessenger(context, "SignIn Failed $e");
//   //     isSignInLoading.value = false;
//   //   }
//   // }
//   Future<void> signInLoadUserData()async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     signInRememberMe.value = preferences.getBool("rememberMe") ?? false;
//     if(signInRememberMe.value){
//       signInEmailController.value.text = preferences.getString("email") ?? "";
//       signInPasswordController.value.text = preferences.getString("password") ?? "";
//     }
//   }
//   Future<void> signInRemember()async{
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     if(signInRememberMe.value){
//       await preferences.setBool("rememberMe", true);
//       await preferences.setString("signInEmail", signInEmailController.value.text);
//       await preferences.setString("signInPassword", signInPasswordController.value.text);
//     }else{
//       await preferences.remove("rememberMe");
//       await preferences.remove("signInEmail");
//       await preferences.remove("signInPassword");
//     }
//   }
//
//
//   Future<void> userDetails(BuildContext context,String email)async{
//     UserModel userModel = UserModel(
//       name: nameController.value.text,
//       email: email,
//       dob: dobController.value.text,
//       gender: selectedGender.value,
//       nickname: nickNameController.value.text,
//       number: numberController.value.text,
//       profileImage: "",
//       id: currentUser
//     );
//     try{
//      await _firebaseFirestore.collection("users").doc(currentUser).set(userModel.toJson()).then((value) async{
//        Messages.successScaffoldMessenger(context, "User Created Successfully");
//        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
//       //   var id = value.id;
//       // await _firebaseFirestore.collection("users").doc(id).update({"id" : id}).then((value) {
//       //   Messages.successScaffoldMessenger(context, "User Created Successfully");
//       //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
//       // },);
//       },);
//     }catch(e){
//       print("Error :$e");
//       Messages.errorScaffoldMessenger(context, "Error :$e");
//     }
//   }
//
//
//   @override
//   void onInit() {
//     signUpLoadUserData();
//     signInLoadUserData();
//     super.onInit();
//   }
//
//
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezybooking/models/user_model.dart';
import 'package:ezybooking/views/utils/alert_and_message/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/screens/auth/fill_your_profile_screen.dart';
import '../views/screens/auth/login_screen.dart';
import '../views/screens/bottom_navigation_bar.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  RxBool isSignUpLoading = false.obs;
  RxBool isSignInLoading = false.obs;
  RxBool fillYourProfileLoading = false.obs;
  RxBool signUpRememberMe = false.obs;
  RxBool signInRememberMe = false.obs;

  final TextEditingController signUpEmailController = TextEditingController();
  final TextEditingController signUpPasswordController = TextEditingController();
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  RxString selectedGender = "".obs;

  Future<void> signUp(BuildContext context) async {
    try {
      isSignUpLoading.value = true;
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: signUpEmailController.text.trim(),
        password: signUpPasswordController.text.trim(),
      );
      Messages.successScaffoldMessenger(context, "SignUp Successfully");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FillYourProfileScreen(email: userCredential.user?.email ?? ""),
        ),
      );
    } catch (e) {
      Messages.errorScaffoldMessenger(context, "SignUp Failed: $e");
    } finally {
      isSignUpLoading.value = false;
    }
  }
  Future<void> signUpLoadUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    signUpRememberMe.value = preferences.getBool("signUpRememberMe") ?? false;
    if (signUpRememberMe.value) {
      signUpEmailController.text = preferences.getString("signUpEmail") ?? "";
      signUpPasswordController.text = preferences.getString("signUpPassword") ?? "";
    }
  }
  Future<void> signUpRemember() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (signUpRememberMe.value) {
      await preferences.setBool("signUpRememberMe", true);
      await preferences.setString("signUpEmail", signUpEmailController.text);
      await preferences.setString("signUpPassword", signUpPasswordController.text);
    } else {
      await preferences.remove("signUpRememberMe");
      await preferences.remove("signUpEmail");
      await preferences.remove("signUpPassword");
    }
  }

  Future<void> signIn(BuildContext context) async {
    try {
      isSignInLoading.value = true;
      await _firebaseAuth.signInWithEmailAndPassword(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim(),
      );
      Messages.successScaffoldMessenger(context, "SignIn Successfully");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBarWidget()),
            (route) => false,
      );
    } catch (e) {
      Messages.errorScaffoldMessenger(context, "SignIn Failed: $e");
      print("Login Error :$e");
    } finally {
      isSignInLoading.value = false;
    }
  }
  Future<void> signInLoadUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    signInRememberMe.value = preferences.getBool("signInRememberMe") ?? false;
    if (signInRememberMe.value) {
      signInEmailController.text = preferences.getString("signInEmail") ?? "";
      signInPasswordController.text = preferences.getString("signInPassword") ?? "";
    }
  }
  Future<void> signInRemember() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (signInRememberMe.value) {
      await preferences.setBool("signInRememberMe", true);
      await preferences.setString("signInEmail", signInEmailController.text);
      await preferences.setString("signInPassword", signInPasswordController.text);
    } else {
      await preferences.remove("signInRememberMe");
      await preferences.remove("signInEmail");
      await preferences.remove("signInPassword");
    }
  }

  Future<void> userDetails(BuildContext context, String email) async {
    String? userId = _firebaseAuth.currentUser?.uid;
    if (userId == null) return;

    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: email,
      dob: dobController.text.trim(),
      gender: selectedGender.value,
      nickname: nickNameController.text.trim(),
      number: numberController.text.trim(),
      profileImage: "",
      id: userId,
    );

    try {
      await _firebaseFirestore.collection("users").doc(userId).set(userModel.toJson());
      Messages.successScaffoldMessenger(context, "User Created Successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      Messages.errorScaffoldMessenger(context, "Error: $e");
    }
  }

  Future<void> logOut()async{
    await _firebaseAuth.signOut().then((value) {
      Get.offAll(()=>LoginScreen());
    },);
  }

  @override
  void onInit() {
    signUpLoadUserData();
    signInLoadUserData();
    super.onInit();
  }
}
