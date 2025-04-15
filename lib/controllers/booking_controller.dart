import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezybooking/models/booking_model.dart';
import 'package:ezybooking/models/rooms_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../models/user_model.dart';

class BookingController extends GetxController{
  final Razorpay _razorpay = Razorpay();
  final razorPayKey = "rzp_test_371C9xe6Cod48A";
  final razorPaySecret = "kfYJMLYZwQ4TKNh79laVdhYe";
  RxBool isLoading = false.obs;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var currentUserId = FirebaseAuth.instance.currentUser!.uid;
  var userData = UserModel().obs;
  var selectedStatus = "Ongoing".obs;
  var selectRoomType = "All".obs;

  RxList<BookingModel> allBookingList = <BookingModel>[].obs;
  late String sellerId;



  ///

  late DateTime checkIn;
  late DateTime checkOut;
  late int totalDays;
  late int totalGuest;
  late int totalPrice;
  late int totalRooms;
  late String roomId;
  late String hotelId;
  late String paymentMethod;
  late RoomsModel roomsModel;


  void updateStatus(String status) {
    selectedStatus.value = status;
  }

  void updateRoomType(String type){
    selectRoomType.value = type;
  }

  void getCurrentUserDetails(){
    _db.collection("users").doc(currentUserId).snapshots().listen((snapshot) {
      if(snapshot.exists && snapshot.data() != null){
        userData.value = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
      }
    },);
  }

  void initializeRazorpay(){
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Get.snackbar("Payment successful", response.paymentId.toString());
    await roomBookingDetails(paymentId: response.paymentId.toString(), paymentStatus: "Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Payment fail", response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("External Wallet", response.walletName.toString());
  }

  Future<void> openCheckout({required String price})async{
    var amount = double.parse(price).toInt();
    var options = {
      "key" : razorPayKey,
      "amount" : amount * 100,
      "name" : userData.value.name,
      "prefill" : {
        "contact" : userData.value.number,
        "email" : userData.value.email,
        "paymentMethod" : "Razorpay"
      },
      "external" : {
        "wallets" : ['paytm']
      }
    };

    isLoading.value = true;
    try{
      _razorpay.open(options);
    }catch(e){
      Get.snackbar("Error",e.toString());
    }finally{
      isLoading.value = false;
    }

  }


  // Future<void> roomBookingDetails({required String paymentId, required String paymentStatus,})async{
  //   final currentUser = userData.value;
  //
  //   List<String> bookedDates = [];
  //   DateTime date = checkIn;
  //   while (!date.isAfter(checkOut)) {
  //     bookedDates.add(DateFormat("yyyy-MM-dd").format(date));
  //     date = date.add(const Duration(days: 1));
  //   }
  //
  //   // Create booking model object
  //   BookingModel bookingModel = BookingModel(
  //       roomId: roomId,
  //       hotelId: hotelId,
  //       createdAt: Timestamp.now().toDate(),
  //       userId: currentUser.id,
  //       status: "Confirmed",
  //       bookedDates: bookedDates,
  //       checkIn: Timestamp.fromDate(checkIn).toDate(),
  //       checkOut: Timestamp.fromDate(checkOut).toDate(),
  //       paymentStatus: paymentStatus,
  //       totalDays: totalDays.toString(),
  //       totalGuest: totalGuest.toString(),
  //       totalPrice: totalPrice,
  //       totalRooms: totalRooms.toString(),
  //       updatedAt: Timestamp.now().toDate(),
  //       userName: currentUser.name,
  //       paymentId: paymentId,
  //       paymentMethod: paymentMethod,
  //       bookingStatus: "Ongoing",
  //      roomsModel: roomsModel
  //   );
  //   /// For user
  //   _db.collection("users").doc(currentUserId).collection("booking").add(bookingModel.toJson()).then((value) {
  //     var id = value.id;
  //     _db.collection("users").doc(currentUserId).collection("booking").doc(id).update({"bookingId" : id});
  //     /// For Vendor (Seller)
  //     _db.collection("seller").doc(sellerId).collection("booking").add(bookingModel.toJson()).then((value) {
  //       _db.collection("seller").doc(sellerId).collection("booking").doc(id).update({"bookingId" : id});
  //     },);
  //   },);
  //
  //
  // }

  Future<void> roomBookingDetails({
    required String paymentId,
    required String paymentStatus,
  }) async {
    final currentUser = userData.value;

    List<String> bookedDates = [];
    DateTime date = checkIn;
    while (!date.isAfter(checkOut)) {
      bookedDates.add(DateFormat("yyyy-MM-dd").format(date));
      date = date.add(const Duration(days: 1));
    }

    // Generate a unique bookingId manually
    String bookingId = _db.collection("booking").doc().id;

    // Create booking model object
    BookingModel bookingModel = BookingModel(
      roomId: roomId,
      hotelId: hotelId,
      createdAt: Timestamp.now().toDate(),
      userId: currentUser.id,
      status: "Confirmed",
      bookedDates: bookedDates,
      checkIn: Timestamp.fromDate(checkIn).toDate(),
      checkOut: Timestamp.fromDate(checkOut).toDate(),
      paymentStatus: paymentStatus,
      totalDays: totalDays.toString(),
      totalGuest: totalGuest.toString(),
      totalPrice: totalPrice,
      totalRooms: totalRooms.toString(),
      updatedAt: Timestamp.now().toDate(),
      userName: currentUser.name,
      paymentId: paymentId,
      paymentMethod: paymentMethod,
      bookingStatus: "Ongoing",
      roomsModel: roomsModel,
      bookingId: bookingId, // Assign the generated bookingId
    );

    // /// Store for User
    // await _db.collection("users").doc(currentUserId).collection("booking").doc(bookingId).set(bookingModel.toJson());
    // /// Store for Seller
    // await _db.collection("seller").doc(sellerId).collection("booking").doc(bookingId).set(bookingModel.toJson());

    /// Store for User
    await _db.collection("booking").doc(bookingId).set(bookingModel.toJson());
    /// Store for Seller
    await _db.collection("booking").doc(bookingId).set(bookingModel.toJson());
  }


  void allBookings(){
    _db.collection("booking").snapshots().listen((snap) => allBookingList.value = snap.docs.map((doc) => BookingModel.fromJson(doc.data()),).toList(),);
    // _db.collection("users").doc(currentUserId).collection("booking").snapshots().listen((snap) => allBookingList.value = snap.docs.map((doc) => BookingModel.fromJson(doc.data()),).toList(),);

  }

  @override
  void onInit() {
    super.onInit();
    getCurrentUserDetails();
    initializeRazorpay();
    allBookings();
  }

}