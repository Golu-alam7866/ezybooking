import 'package:ezybooking/controllers/auth_controller.dart';
import 'package:ezybooking/views/screens/auth/login_screen.dart';
import 'package:ezybooking/views/utils/alert_and_message/messages.dart';
import 'package:ezybooking/views/utils/app_constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(AppImages.loading,width: 200,height: 200),
                  ],
                ),
                const Text(
                  "Create your Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: authController.signUpEmailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                    hintText: "Email",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: authController.signUpPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                    suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: authController.signUpRememberMe.value,
                        onChanged: (value) {
                          authController.signUpRememberMe.value = value!;
                        },
                        activeColor: Colors.green,
                      );
                    },),
                    const Text("Remember me", style: TextStyle(color: Colors.white),),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => FillYourProfileScreen(),));
                      if(authController.signUpEmailController.value.text.isEmpty){
                        Messages.errorScaffoldMessenger(context, "Please enter email");
                      }else if(authController.signUpPasswordController.value.text.isEmpty){
                        Messages.errorScaffoldMessenger(context, "Please enter password");
                      }else if(authController.signUpPasswordController.value.text.length > 6){
                        Messages.errorScaffoldMessenger(context, "Please enter password 6 character");
                      }else{
                        authController.signUp(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Obx(() {
                      return authController.isSignUpLoading.value ? CupertinoActivityIndicator(color: Colors.white,) : Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 18),);
                    },)
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 60, height: 1, color: Colors.grey),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or continue with",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(width: 60, height: 1, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialButton(AppImages.facebookImage),
                    const SizedBox(width: 10),
                    socialButton(AppImages.googleImage),
                    const SizedBox(width: 10),
                    socialButton(AppImages.whiteIphoneImage),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialButton(String asset) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        asset,
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
