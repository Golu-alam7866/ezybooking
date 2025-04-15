import 'package:ezybooking/models/hotels_model.dart';
import 'package:ezybooking/views/utils/app_constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../controllers/booking_controller.dart';
import '../../../models/rooms_model.dart';

// class SelectDateScreen extends StatefulWidget {
//   final RoomsModel roomData;
//   const SelectDateScreen({super.key, required this.roomData});
//
//   @override
//   State<SelectDateScreen> createState() => _SelectDateScreenState();
// }
//
// class _SelectDateScreenState extends State<SelectDateScreen> {
//   DateTime checkInDate = DateTime.now();
//   DateTime? checkOutDate;
//   int guests = 1;
//   bool isSelectingCheckOut = false;
//   var year = DateFormat("yyyy").format(DateTime.now());
//   int stayDays = 1;
//   List<DynamicWidget> dynamicWidgetList = [];
//   Map<int, int> guestCount = {}; // Store guest count per room
//   int selectedMethod = 0;
//   var totalPrice = 0;
//   final BookingController bookingController = Get.put(BookingController());
//
//   void addWidgetDynamically() {
//     if (dynamicWidgetList.length >= 5) {
//       return;
//     }
//     setState(() {
//       int newRoomNumber = dynamicWidgetList.length + 1;
//       guestCount[newRoomNumber] = 1; // Default guest count to 1
//       dynamicWidgetList.add(
//         DynamicWidget(
//           roomNumber: newRoomNumber,
//           onGuestCountChanged: (count) {
//             setState(() {guestCount[newRoomNumber] = count;});},),);});}
//
//   void removeDynamicWidget(int index) {
//     setState(() {
//       int removedRoomNumber = dynamicWidgetList[index].roomNumber;
//       dynamicWidgetList.removeAt(index);
//       guestCount.remove(removedRoomNumber);
//       // Rebuild the list with updated room numbers
//       for (int i = 0; i < dynamicWidgetList.length; i++) {
//         int updatedRoomNumber = i + 1;
//         int previousRoomNumber = dynamicWidgetList[i].roomNumber;
//         dynamicWidgetList[i] = DynamicWidget(
//           roomNumber: updatedRoomNumber,
//           onGuestCountChanged: (count) {
//             setState(() {guestCount[updatedRoomNumber] = count;});},);
//         // Preserve previous guest count if exists
//         if (guestCount.containsKey(previousRoomNumber)) {
//           guestCount[updatedRoomNumber] = guestCount[previousRoomNumber]!;
//           guestCount.remove(previousRoomNumber);}}});}
//
//   @override
//   void initState() {
//     super.initState();
//     checkOutDate = checkInDate.add(const Duration(days: 1));
//     _calculateStayDays();
//   }
//
//   void _calculateStayDays() {
//     if (checkOutDate != null) {stayDays = checkOutDate!.difference(checkInDate).inDays;}}
//   int calculatePrice() {
//     var price = widget.roomData.price;
//     return int.parse(price.toString()) * stayDays;
//   }
//
//   void _handleDateSelection(DateTime selectedDay) {
//     setState(() {
//       // If no dates are selected or both dates are selected, start new selection
//       if (checkOutDate != null) {
//         checkInDate = selectedDay;
//         checkOutDate = null;
//         isSelectingCheckOut = true;
//       }
//       // If only check-in is selected
//       else {
//         // If selected date is before check-in date, make it new check-in date
//         if (selectedDay.isBefore(checkInDate)) {
//           checkInDate = selectedDay;
//         }
//         // If selected date is after check-in date, make it check-out date
//         else if (selectedDay.isAfter(checkInDate)) {
//           checkOutDate = selectedDay;
//           isSelectingCheckOut = false;
//         }
//         // If same date is selected, just update check-in and set check-out to next day
//         else {
//           checkInDate = selectedDay;
//           checkOutDate = selectedDay.add(const Duration(days: 1));
//           isSelectingCheckOut = false;
//         }
//       }
//       _calculateStayDays();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "Select Date",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF181818),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding: const EdgeInsets.all(4),
//                 child: TableCalendar(
//                   focusedDay: checkInDate,
//                   firstDay: DateTime.now(),
//                   lastDay: DateTime(int.parse(year), 12, 31),
//                   selectedDayPredicate: (day) {
//                     return day.isAtSameMomentAs(checkInDate) ||
//                         (checkOutDate != null && day.isAtSameMomentAs(checkOutDate!));
//                   },
//                   rangeStartDay: checkInDate,
//                   rangeEndDay: checkOutDate,
//                   rangeSelectionMode: RangeSelectionMode.enforced,
//                   calendarStyle: const CalendarStyle(
//                     todayDecoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                       color: Colors.green,
//                       shape: BoxShape.circle,
//                     ),
//                     defaultTextStyle: TextStyle(color: Colors.white),
//                     weekendTextStyle: TextStyle(color: Colors.white),
//                     withinRangeTextStyle: TextStyle(color: Colors.white),
//                     rangeHighlightColor: Colors.green,
//                     withinRangeDecoration: BoxDecoration(
//                       color: Colors.green,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   headerStyle: const HeaderStyle(
//                     formatButtonVisible: false,
//                     titleCentered: true,
//                     titleTextStyle: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
//                     rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
//                   ),
//                   calendarFormat: CalendarFormat.month,
//                   onDaySelected: (selectedDay, focusedDay) {
//                     _handleDateSelection(selectedDay);
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _buildDateCard("Check in", checkInDate),
//                   const Icon(Icons.arrow_forward, color: Colors.white),
//                   _buildDateCard("Check out", checkOutDate ?? checkInDate.add(const Duration(days: 1)),),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               _buildGuestSelector(),
//               const SizedBox(height: 20),
//               ListView.builder(
//                 shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: dynamicWidgetList.length,
//                   itemBuilder: (context, index) {
//                     return Stack(
//                       children: [
//                         dynamicWidgetList[index],
//                         Positioned(
//                           right: 0,
//                             top: 0,
//                             child: IconButton(onPressed: (){
//                               removeDynamicWidget(index);
//                             }, icon: Icon(Icons.close,color: Colors.white,)))],);},),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   addWidgetDynamically();
//                 },
//                 child: Container(
//                   height: 50,
//                   width: MediaQuery.sizeOf(context).width * 1,
//                   decoration: BoxDecoration(
//                     color: Colors.grey[900],
//                     borderRadius: BorderRadius.circular(12)
//                   ),
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add,color: Colors.white,),
//                         Text("Add another room",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)],),),),),
//               const SizedBox(height: 30),
//               Text("Total: ₹ ${calculatePrice()}", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,),),
//               const SizedBox(height: 10),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                   ),
//                   onPressed: () {
//                     showPaymentOptionsBottomSheet(context,selectedMethod,bookingController,widget.roomData);
//                   },
//                   child: const Text("Continue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
//                       color: Colors.white,),),),), const SizedBox(height: 20),],),),),);}
//   Widget _buildDateCard(String title, DateTime date) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14),),
//         const SizedBox(height: 5),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(color: const Color(0xFF181818), borderRadius: BorderRadius.circular(12)),
//           child: Text(DateFormat("MMM dd, yyyy").format(date), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),),],);}
//
//   Widget _buildGuestSelector() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Guest", style: TextStyle(color: Colors.grey, fontSize: 14),),
//         const SizedBox(height: 5),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(color: const Color(0xFF181818), borderRadius: BorderRadius.circular(12),),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.remove, color: Colors.white),
//                 onPressed: () {
//                   setState(() {
//                     if (guests > 1) guests--;});},),
//               Text("$guests", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
//               IconButton(
//                 icon: const Icon(Icons.add, color: Colors.white),
//                 onPressed: () {
//                   setState(() {
//                     if (guests < 4) guests++;});},),],),),],);}}
//
// class DynamicWidget extends StatefulWidget {
//   final int roomNumber;
//   final Function(int) onGuestCountChanged;
//
//   const DynamicWidget({
//     super.key,
//     required this.roomNumber,
//     required this.onGuestCountChanged,
//   });
//
//   @override
//   State<DynamicWidget> createState() => _DynamicWidgetState();
// }
//
// class _DynamicWidgetState extends State<DynamicWidget> {
//   int guests = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       padding: EdgeInsets.all(16.0),
//       decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(10),),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Room ${widget.roomNumber +1}", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
//               Text("Guests", style: TextStyle(color: Colors.white, fontSize: 16,),),],),
//           SizedBox(height: 10),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(color: const Color(0xFF181818), borderRadius: BorderRadius.circular(12),),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove, color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       if (guests > 1) {
//                         guests--;
//                         widget.onGuestCountChanged(guests);}});},),
//                 Text("$guests", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.white),
//                   onPressed: () {
//                     setState(() {
//                       if (guests < 4) {
//                         guests++;
//                         widget.onGuestCountChanged(guests);
//                       }});},),],),),],),);}}
//
// void showPaymentOptionsBottomSheet(BuildContext context,int selectedMethod,BookingController bookingController,RoomsModel roomData) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20)),),
//     backgroundColor: Colors.white,
//     builder: (context) {
//       return SingleChildScrollView(
//         child: StatefulBuilder(
//           builder: (context, setState) {
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _buildSavedCard(image: AppImages.razorPay, context, cardBrand: "Razor Pay", cardNumber: "", isSelected: selectedMethod == 0, onTap: () => setState(() => selectedMethod = 0),),
//                   const SizedBox(height: 10),
//                   _buildSavedCard(image: AppImages.cash, context, cardBrand: "Pay In Hotel", cardNumber: "", isSelected: selectedMethod == 1, onTap: () => setState(() => selectedMethod = 1),),
//                   const SizedBox(height: 10),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                       ),
//                       onPressed: () {
//                         if(selectedMethod == 0){
//                           bookingController.openCheckout(price: roomData.price.toString());
//                         }
//                         else if(selectedMethod == 1){}
//                       },
//                       child: const Text("Confirm Payment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
//                       ),),),),],),);},),);},);}
// Widget _buildSavedCard(BuildContext context, {required String cardBrand, required String image, required String cardNumber, required bool isSelected, required VoidCallback onTap, IconData? icon}) {
//   return ListTile(
//     leading: icon != null
//         ? Icon(icon, color: Colors.blue)
//         : Image.asset(image, height: 35,width: 60,fit: BoxFit.cover),
//     title: Padding(padding: const EdgeInsets.only(top: 20), child: Text(cardBrand),),
//     subtitle: Text(cardNumber, style: TextStyle(color: Colors.grey)),
//     trailing: Radio(value: isSelected, groupValue: true, onChanged: (_) => onTap(),),
//     onTap: onTap,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     tileColor: Colors.grey[200],
//   );
// }

class SelectDateScreen extends StatefulWidget {
  final RoomsModel roomData;

  const SelectDateScreen({super.key, required this.roomData});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime checkInDate = DateTime.now();
  DateTime? checkOutDate;
  int guests = 1;
  bool isSelectingCheckOut = false;
  var year = DateFormat("yyyy").format(DateTime.now());
  int stayDays = 1;
  List<DynamicWidget> dynamicWidgetList = [];
  Map<int, int> guestCount = {}; // Store guest count per room
  int selectedMethod = 0;
  var totalPrice = 0;
  final BookingController bookingController = Get.put(BookingController());

  @override
  void initState() {
    super.initState();
    checkOutDate = checkInDate.add(const Duration(days: 1));
    _calculateStayDays();
  }

  void addWidgetDynamically() {
    if (dynamicWidgetList.length >= 5) {
      return;
    }
    setState(() {
      int newRoomNumber = dynamicWidgetList.length + 1;
      guestCount[newRoomNumber] = 1; // Default guest count to 1
      dynamicWidgetList.add(
        DynamicWidget(
          roomNumber: newRoomNumber,
          onGuestCountChanged: (count) {
            setState(() {
              guestCount[newRoomNumber] = count;
            });
          },
        ),
      );
    });
  }

  void removeDynamicWidget(int index) {
    setState(() {
      int removedRoomNumber = dynamicWidgetList[index].roomNumber;
      dynamicWidgetList.removeAt(index);
      guestCount.remove(removedRoomNumber);
      // Rebuild the list with updated room numbers
      for (int i = 0; i < dynamicWidgetList.length; i++) {
        int updatedRoomNumber = i + 1;
        int previousRoomNumber = dynamicWidgetList[i].roomNumber;
        dynamicWidgetList[i] = DynamicWidget(
          roomNumber: updatedRoomNumber,
          onGuestCountChanged: (count) {
            setState(() {
              guestCount[updatedRoomNumber] = count;
            });
          },
        );
        // Preserve previous guest count if exists
        if (guestCount.containsKey(previousRoomNumber)) {
          guestCount[updatedRoomNumber] = guestCount[previousRoomNumber]!;
          guestCount.remove(previousRoomNumber);
        }
      }
    });
  }

  void _calculateStayDays() {
    if (checkOutDate != null) {
      stayDays = checkOutDate!.difference(checkInDate).inDays;
    }
  }

  int calculatePrice() {
    var price = widget.roomData.price;
    return int.parse(price.toString()) * stayDays;
  }

  void _handleDateSelection(DateTime selectedDay) {
    setState(() {
      if (checkOutDate != null) {
        checkInDate = selectedDay;
        checkOutDate = null;
        isSelectingCheckOut = true;
      } else {
        if (selectedDay.isBefore(checkInDate)) {
          checkInDate = selectedDay;
        } else if (selectedDay.isAfter(checkInDate)) {
          checkOutDate = selectedDay;
          isSelectingCheckOut = false;
        } else {
          checkInDate = selectedDay;
          checkOutDate = selectedDay.add(const Duration(days: 1));
          isSelectingCheckOut = false;
        }
      }
      _calculateStayDays();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Select Date",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF181818),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: TableCalendar(
                    focusedDay: checkInDate,
                    firstDay: DateTime.now(),
                    lastDay: DateTime(int.parse(year), 12, 31),
                    selectedDayPredicate: (day) {
                      return day.isAtSameMomentAs(checkInDate) ||
                          (checkOutDate != null &&
                              day.isAtSameMomentAs(checkOutDate!));
                    },
                    rangeStartDay: checkInDate,
                    rangeEndDay: checkOutDate,
                    rangeSelectionMode: RangeSelectionMode.enforced,
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white),
                      withinRangeTextStyle: TextStyle(color: Colors.white),
                      rangeHighlightColor: Colors.green,
                      withinRangeDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.white),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.white),
                    ),
                    calendarFormat: CalendarFormat.month,
                    onDaySelected: (selectedDay, focusedDay) {
                      _handleDateSelection(selectedDay);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateCard("Check in", checkInDate),
                    const Icon(Icons.arrow_forward, color: Colors.white),
                    _buildDateCard(
                      "Check out",
                      checkOutDate ?? checkInDate.add(const Duration(days: 1)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _buildGuestSelector(),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dynamicWidgetList.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        dynamicWidgetList[index],
                        Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                                onPressed: () {
                                  removeDynamicWidget(index);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                )))
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    addWidgetDynamically();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width * 1,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Add another room",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Total: ₹ ${calculatePrice()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      bookingController.checkIn = checkInDate;
                      bookingController.checkOut = checkOutDate!;
                      bookingController.totalDays = stayDays;
                      bookingController.totalGuest = guests;
                      bookingController.totalPrice = calculatePrice();
                      bookingController.totalRooms = dynamicWidgetList.length + 1;
                      bookingController.roomId = widget.roomData.roomId.toString();
                      bookingController.hotelId = widget.roomData.hotelId.toString();
                      bookingController.sellerId = widget.roomData.hotelOwnerId.toString();
                      bookingController.roomsModel = RoomsModel(
                        hotelId: widget.roomData.hotelId,
                        roomId: widget.roomData.roomId,
                        type: widget.roomData.type,
                        hotelModel: HotelsModel(
                          images: widget.roomData.hotelModel?.images,
                          amenities: widget.roomData.hotelModel?.amenities,
                          hotelId: widget.roomData.hotelModel?.hotelId,
                          updatedAt: widget.roomData.hotelModel?.updatedAt,
                          createdAt: widget.roomData.hotelModel?.createdAt,
                          totalReviews: widget.roomData.hotelModel?.totalReviews,
                          rating: widget.roomData.hotelModel?.rating,
                          hotelDescription: widget.roomData.hotelModel?.hotelDescription,
                          hotelName: widget.roomData.hotelModel?.hotelName,
                          ownerId: widget.roomData.hotelModel?.ownerId,
                          cityId: widget.roomData.hotelModel?.cityId,
                          hotelCity: widget.roomData.hotelModel?.hotelCity,
                          hotelAddress: HotelAddress(
                            coordinates: Coordinates(latitude: widget.roomData.hotelModel?.hotelAddress?.coordinates?.latitude,longitude: widget.roomData.hotelModel?.hotelAddress?.coordinates?.longitude),
                            country: widget.roomData.hotelModel?.hotelAddress?.country,
                            state: widget.roomData.hotelModel?.hotelAddress?.state,
                            city: widget.roomData.hotelModel?.hotelAddress?.city,
                            street: widget.roomData.hotelModel?.hotelAddress?.street
                          )
                        ),
                        available: widget.roomData.available,
                        price: widget.roomData.price,
                        capacity: widget.roomData.capacity,
                        hotelOwnerId: widget.roomData.hotelOwnerId,
                        amenities: widget.roomData.amenities,
                        images: widget.roomData.images,
                        description: widget.roomData.description,
                        title: widget.roomData.title,
                        typeId: widget.roomData.typeId
                      );

                      showPaymentOptionsBottomSheet(context, selectedMethod, bookingController, widget.roomData);
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  Widget _buildDateCard(String title, DateTime date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: const Color(0xFF181818),
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            DateFormat("MMM dd, yyyy").format(date),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGuestSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Guest",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF181818),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (guests > 1) guests--;
                  });
                },
              ),
              Text(
                "$guests",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  setState(() {
                    if (guests < 4) guests++;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DynamicWidget extends StatefulWidget {
  final int roomNumber;
  final Function(int) onGuestCountChanged;

  const DynamicWidget({
    super.key,
    required this.roomNumber,
    required this.onGuestCountChanged,
  });

  @override
  State<DynamicWidget> createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  int guests = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Room ${widget.roomNumber + 1}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Guests",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF181818),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (guests > 1) {
                        guests--;
                        widget.onGuestCountChanged(guests);
                      }
                    });
                  },
                ),
                Text(
                  "$guests",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      if (guests < 4) {
                        guests++;
                        widget.onGuestCountChanged(guests);
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showPaymentOptionsBottomSheet(BuildContext context, int selectedMethod,
    BookingController bookingController, RoomsModel roomData) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return SingleChildScrollView(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSavedCard(
                    image: AppImages.razorPay,
                    context,
                    cardBrand: "Razor Pay",
                    cardNumber: "",
                    isSelected: selectedMethod == 0,
                    onTap: () => setState(() => selectedMethod = 0),
                  ),
                  const SizedBox(height: 10),
                  _buildSavedCard(
                    image: AppImages.cash,
                    context,
                    cardBrand: "Pay In Hotel",
                    cardNumber: "",
                    isSelected: selectedMethod == 1,
                    onTap: () => setState(() => selectedMethod = 1),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (selectedMethod == 0) {
                          bookingController.paymentMethod = "RazorPay";
                          bookingController.openCheckout(price: roomData.price.toString());
                        } else if (selectedMethod == 1) {
                          bookingController.paymentMethod = "Cash";
                          bookingController.roomBookingDetails(
                              paymentId: "cash_payment${DateTime.now().microsecondsSinceEpoch.toString()}",
                              paymentStatus: "Pending");
                        }
                      },
                      child: const Text(
                        "Confirm Payment",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildSavedCard(BuildContext context,
    {required String cardBrand,
    required String image,
    required String cardNumber,
    required bool isSelected,
    required VoidCallback onTap,
    IconData? icon}) {
  return ListTile(
    leading: icon != null
        ? Icon(icon, color: Colors.blue)
        : Image.asset(image, height: 35, width: 60, fit: BoxFit.cover),
    title: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(cardBrand),
    ),
    subtitle: Text(cardNumber, style: TextStyle(color: Colors.grey)),
    trailing: Radio(
      value: isSelected,
      groupValue: true,
      onChanged: (_) => onTap(),
    ),
    onTap: onTap,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    tileColor: Colors.grey[200],
  );
}
