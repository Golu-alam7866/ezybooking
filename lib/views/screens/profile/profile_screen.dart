import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ezybooking/controllers/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../utils/app_constants/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.loading,width: 50,height: 50),
            DefaultTextStyle(
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText("Ezy Booking")
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Top Event");
                  },
                )
            ),
            // Container(
            //   height: 30,
            //   width: 30,
            //   decoration: BoxDecoration(
            //     color: Colors.greenAccent,
            //     borderRadius: BorderRadius.circular(15)
            //   ),
            //   child: Image.asset(AppImages.appLogo),
            //
            // ),
            // SizedBox(width: 8),
            // Text(
            //   "Ezy Booking",
            //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            // ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: 10,),
              Text("8235266260",style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
              Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.support,color: Colors.white,),
                        Text("Support",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.payment,color: Colors.white,),
                        Text("Payment",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wallet,color: Colors.white,),
                        Text("Wallet",style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("YOUR INFORMATION",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.paste_outlined, "Become an EB Wizard", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, CupertinoIcons.person_3, "Invite & Earn", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, CupertinoIcons.heart_fill, "View saved EB", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, CupertinoIcons.doc_plaintext, "Book for events", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.grading, "Need Help", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.translate, "Language Change", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, CupertinoIcons.person, "Profile Update", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              Text("PAYMENTS AND COUPONS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.wallet, "Wallet", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.payment, "Payment settings", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.propane_tank, "Collection coupons", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              Text("OTHERS INFORMATION",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.forward, "Share the app", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.info, "About us", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.lock, "Account privacy", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){}, Icons.notifications, "Notification preferences", Icons.keyboard_arrow_right),
              SizedBox(height: 20,),
              yourInformation((){
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Log Out"),
                    content: const Text("Are your sure you want to Logout"),
                    actions: <Widget>[
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              authController.logOut();
                            },
                            child: const Text("Yes"),
                          ),
                        ],
                      )

                    ],
                  ),
                );
              }, CupertinoIcons.square_arrow_left, "Log out", Icons.keyboard_arrow_right),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(AppImages.loading,width: 50,height: 50),
                  DefaultTextStyle(
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText("Ezy Booking")
                        ],
                        isRepeatingAnimation: true,
                        onTap: () {
                          print("Top Event");
                        },
                      )
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("1.0",style: TextStyle(fontSize: 12,color: Colors.green),),
                ],
              ),
              // SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}

Widget yourInformation(void Function()? onTap,IconData prefixIcon,String data,IconData suffixIcon){
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(100)
          ),
          child: Center(child: Icon(prefixIcon,size: 18,)),
        ),
        SizedBox(width: 15,),
        Text(data,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        Spacer(),
        Icon(suffixIcon,color: Colors.white,),
      ],
    ),
  );
}

