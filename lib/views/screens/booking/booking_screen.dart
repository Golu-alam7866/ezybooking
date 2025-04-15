import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ezybooking/models/booking_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/booking_controller.dart';
import '../../utils/app_constants/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final BookingController bookingController = Get.put(BookingController());
    // final List<Map<String, String>> allBookings = [
    //   {
    //     "title": "Royale President Hotel",
    //     "location": "Paris, France",
    //     "image": AppImages.onboardingImage2,
    //     "status": "Ongoing"
    //   },
    //   {
    //     "title": "Monte-Carlo Hotel",
    //     "location": "Rome, Italia",
    //     "image": AppImages.onboardingImage3,
    //     "status": "Completed"
    //   },
    //   {
    //     "title": "Lagonissi Royal Villa",
    //     "location": "London, United Kingdom",
    //     "image": AppImages.onboardingImage4,
    //     "status": "Canceled"
    //   },
    // ];

    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0F0F),
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
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => bookingStatusButton("Ongoing", bookingController.selectedStatus.value == "Ongoing",bookingController)),
                Obx(() => bookingStatusButton("Completed", bookingController.selectedStatus.value == "Completed",bookingController)),
                Obx(() => bookingStatusButton("Cancelled", bookingController.selectedStatus.value == "Cancelled",bookingController)),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              var filteredBookings = bookingController.allBookingList.where((booking) => booking.bookingStatus == bookingController.selectedStatus.value).toList();
              return ListView.builder(
                itemCount: filteredBookings.length,
                itemBuilder: (context, index) {
                  final booking = filteredBookings[index];
                  return bookingCard(booking);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget bookingCard(BookingModel booking) {
    return Card(
      color: Color(0xFF1E1E1E),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: CachedNetworkImage(
                imageUrl: booking.roomsModel?.images?[0] ?? "",height: 120, width: double.infinity, fit: BoxFit.cover,
              placeholder: (context, url) => CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // child: Image.asset(booking.roomsModel.images[0].toString(), height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.roomsModel?.title ?? "",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text(booking.roomsModel?.description ?? "", style: TextStyle(color: Colors.white70, fontSize: 14)),
                SizedBox(height: 8),
                Row(
                  children: [
                    statusBadge(booking.paymentStatus == "Success" ? "Paid" : "Unpaid"),
                    Spacer(),
                    actionButton("Cancel Booking", Color(0xFF1A3D32), Colors.greenAccent,() {},),
                    SizedBox(width: 10),
                    actionButton("View Ticket", Color(0xFF21D07A), Colors.black,() {},),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bookingStatusButton(String title, bool isActive,BookingController bookingController) {
    return GestureDetector(
      onTap: () => bookingController.updateStatus(title),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.greenAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.greenAccent, width: 1.5),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.greenAccent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget actionButton(String text, Color bgColor, Color textColor,void Function()? onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.bold)),
    );
  }

  Widget statusBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.greenAccent, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
