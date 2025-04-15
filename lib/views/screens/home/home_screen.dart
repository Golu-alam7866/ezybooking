import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ezybooking/controllers/city_controller.dart';
import 'package:ezybooking/controllers/rooms_controller.dart';
import 'package:ezybooking/models/rooms_model.dart';
import 'package:ezybooking/views/screens/home/room_details_screen.dart';
import 'package:ezybooking/views/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/booking_controller.dart';
import '../../utils/app_constants/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int selectedIndex = 0;
  int selectedIndex = -1;
  final BookingController bookingController = Get.put(BookingController());
  final CityController _cityController = Get.put(CityController());
  final RoomsController _roomsController = Get.put(RoomsController());

  @override
  Widget build(BuildContext context) {
    // List<Cities> cities = [
    //   Cities(
    //       cityId: "1", cityName: "Bangalore", cityImage: AppImages.bangalore),
    //   Cities(cityId: "2", cityName: "Bihar", cityImage: AppImages.bihar),
    //   Cities(cityId: "3", cityName: "Chennai", cityImage: AppImages.chennai),
    //   Cities(cityId: "4", cityName: "Delhi", cityImage: AppImages.delhi),
    //   Cities(cityId: "5",
    //       cityName: "Himachal Pradesh",
    //       cityImage: AppImages.himachalPradesh),
    //   Cities(
    //       cityId: "6", cityName: "Hyderabad", cityImage: AppImages.hyderabad),
    //   Cities(cityId: "7",
    //       cityName: "Uttar Pradesh",
    //       cityImage: AppImages.uttarPradesh),
    //   Cities(
    //       cityId: "8", cityName: "All Cities", cityImage: AppImages.location),
    // ];
    ///
    // List<String> type = [
    //   "All",
    //   "Near Me",
    //   "Recommended",
    //   "Popular",
    //   "Trending",
    //   "Luxury Stays",
    //   "5-Star Hotels",
    //   "4-Star Hotels",
    //   "3-Star Hotels",
    //   "2-Star Hotels",
    //   "1-Star Hotels",
    //   "Budget Friendly",
    //   "Best Rated",
    //   "Top Picks",
    //   "New Arrivals",
    //   "Most Booked",
    //   "Exclusive Deals",
    //   "Premium Hotels",
    //   "Family Friendly",
    //   "Romantic Getaways",
    // ];
    ///
    // List<Rooms> rooms = [
    //
    //   /// Normal Type Rooms
    //   Rooms(roomId: "1",
    //       roomTitle: "SPOT ON Raj Hotel Vip Near Worlds fo Wonder",
    //       roomPrice: "1500",
    //       roomType: "Normal",
    //       roomImage: AppImages.roomImage1),
    //   Rooms(roomId: "2",
    //       roomTitle: "Hotel O Tilak Hotel",
    //       roomPrice: "1200",
    //       roomType: "Normal",
    //       roomImage: AppImages.roomImage2),
    //   Rooms(roomId: "3",
    //       roomTitle: "Hotel O Grand Imperial",
    //       roomPrice: "1400",
    //       roomType: "Recommended",
    //       roomImage: AppImages.roomImage3),
    //   Rooms(roomId: "4",
    //       roomTitle: "Hotel O Ashoka Inn Hotel Near Botanical Garden",
    //       roomPrice: "2000",
    //       roomType: "Popular",
    //       roomImage: AppImages.roomImage4),
    //   Rooms(roomId: "5",
    //       roomTitle: "Super Hotel O Wamson",
    //       roomPrice: "1700",
    //       roomType: "Popular",
    //       roomImage: AppImages.roomImage5),
    //   Rooms(roomId: "6",
    //       roomTitle: "Super Hotel O Metro Inn Near Worlds of Wonder",
    //       roomPrice: "1500",
    //       roomType: "Normal",
    //       roomImage: AppImages.roomImage6),
    //   Rooms(roomId: "7",
    //       roomTitle: "Collection O Ratiram Palace BY Wamson",
    //       roomPrice: "1200",
    //       roomType: "Normal",
    //       roomImage: AppImages.roomImage7),
    //   Rooms(roomId: "8",
    //       roomTitle: "Hotel O Ratiram Palace BY Wamson",
    //       roomPrice: "1700",
    //       roomType: "Trending",
    //       roomImage: AppImages.roomImage8),
    //   Rooms(roomId: "9",
    //       roomTitle: "Hotel O The Moon",
    //       roomPrice: "1800",
    //       roomType: "Trending",
    //       roomImage: AppImages.roomImage9),
    //
    //   /// Luxury Type Rooms
    //   Rooms(roomId: "10",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "3000",
    //       roomType: "Luxury Stays",
    //       roomImage: AppImages.luxuryRoomImage1),
    //   Rooms(roomId: "11",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "4000",
    //       roomType: "Luxury Stays",
    //       roomImage: AppImages.luxuryRoomImage2),
    //   Rooms(roomId: "12",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "3500",
    //       roomType: "Luxury Stays",
    //       roomImage: AppImages.luxuryRoomImage3),
    //   Rooms(roomId: "13",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "5000",
    //       roomType: "Romantic Getaways",
    //       roomImage: AppImages.luxuryRoomImage4),
    //
    //   /// 5 Star Room
    //   Rooms(roomId: "14",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "5000",
    //       roomType: "5-Star Hotels",
    //       roomImage: AppImages.fiveStarRoomImage1),
    //   Rooms(roomId: "15",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "7000",
    //       roomType: "5-Star Hotels",
    //       roomImage: AppImages.fiveStarRoomImage2),
    //   Rooms(roomId: "16",
    //       roomTitle: "Hotel O AK Residency",
    //       roomPrice: "10000",
    //       roomType: "5-Star Hotels",
    //       roomImage: AppImages.fiveStarRoomImage5),
    //
    // ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.loading, width: 50, height: 50),
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
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.black,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => SearchScreen(),));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10, left: 8, right: 8),
                        child: Container(
                          height: 45,
                          width: MediaQuery
                              .sizeOf(context)
                              .width * 1,
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Colors.white,),
                                SizedBox(width: 10,),
                                Text("Search...",
                                  style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),

                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Obx(() {
                          return Row(
                              // children: List.generate(_cityController.citiesList.length, (index) {
                              //   var city = _cityController.citiesList[index];
                              //   return Column(
                              //     children: [
                              //       ClipRRect(
                              //         borderRadius: BorderRadius.circular(100),
                              //         child: CachedNetworkImage(
                              //           imageUrl: city.cityImage.toString(),
                              //           placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                              //           errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
                              //           height: 50,
                              //           width: 50,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       ),
                              //       Padding(
                              //         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              //         child: SizedBox(
                              //           width: 70,
                              //           child: Center(child: Text(
                              //             city.cityName.toString(),
                              //             style: TextStyle(color: Colors.white),
                              //             maxLines: 1,
                              //             overflow: TextOverflow.ellipsis,)),
                              //         ),
                              //       )
                              //     ],
                              //   );
                              // },)
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.grey[700], // Or any color you prefer for the "All" icon
                                        child: Icon(Icons.location_on_outlined, color: Colors.white, size: 30),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: SizedBox(
                                        width: 70,
                                        child: Center(child: Text(
                                          "Nearby",
                                          style: TextStyle(color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // City list first
                              ...List.generate(_cityController.citiesList.length, (index) {
                                var city = _cityController.citiesList[index];
                                return Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: CachedNetworkImage(
                                        imageUrl: city.cityImage.toString(),
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: SizedBox(
                                        width: 70,
                                        child: Center(child: Text(
                                          city.cityName.toString(),
                                          style: TextStyle(color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,)),
                                      ),
                                    )
                                  ],
                                );
                              }),
                              // Add the "All" option at the end
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.grey[700], // Or any color you prefer for the "All" icon
                                        child: Icon(Icons.location_city, color: Colors.white, size: 30),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                      child: SizedBox(
                                        width: 70,
                                        child: Center(child: Text(
                                          "All",
                                          style: TextStyle(color: Colors.white),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,)),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Obx(() {
            //       return Row(
            //         children: List.generate(_cityController.roomTypeList.length, (index) {
            //           bool isSelected = (index == selectedIndex);
            //           return GestureDetector(
            //             onTap: () {
            //               setState(() {
            //                 selectedIndex = index;
            //               });
            //               bookingController.updateRoomType(_cityController.roomTypeList[selectedIndex].roomType.toString());
            //             },
            //             child: Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 4),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   color: isSelected ? Colors.green : Colors.transparent,
            //                   border: Border.all(color: Colors.green),
            //                   borderRadius: BorderRadius.circular(20),
            //                 ),
            //                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            //                 child: Text(_cityController.roomTypeList[index].roomType.toString(),
            //                   style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         }),
            //       );
            //     }),
            //   ),
            // ),
            // Expanded(
            //     child: Obx(() {
            //       var filteredRooms = _roomsController.roomsListList.where((rooms) =>
            //       rooms.type == bookingController.selectRoomType.value,).toList();
            //       return ListView.builder(
            //         itemCount: selectedIndex == 0 ? _roomsController.roomsListList.length : filteredRooms.length,
            //         itemBuilder: (context, index) {
            //           final room = selectedIndex == 0 ? _roomsController.roomsListList[index] : filteredRooms[index];
            //           return roomsCard(room);
            //         },
            //       );
            //     },)
            // )
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  return Row(
                    children: [
                      // Add "All" option as the first item
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = -1; // Special index for "All"
                          });
                          bookingController.updateRoomType("All");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex == -1 ? Colors.green : Colors.transparent,
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            child: Text(
                              "All",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Generate the rest of the filter options
                      ...List.generate(_cityController.roomTypeList.length, (index) {
                        bool isSelected = (index == selectedIndex);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            bookingController.updateRoomType(_cityController.roomTypeList[selectedIndex].roomType.toString());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.green : Colors.transparent,
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: Text(
                                _cityController.roomTypeList[index].roomType.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                }),
              ),
            ),
            Expanded(
                child: Obx(() {
                  // Show all rooms when "All" is selected (selectedIndex == -1)
                  var filteredRooms = selectedIndex == -1
                      ? _roomsController.roomsListList
                      : _roomsController.roomsListList.where((rooms) =>
                  rooms.type == bookingController.selectRoomType.value).toList();
                  return ListView.builder(
                    itemCount: filteredRooms.length,
                    itemBuilder: (context, index) {
                      final room = filteredRooms[index];
                      return roomsCard(room);
                    },
                  );
                })
            )
          ],
        ),
      ),
    );
  }

  // Widget typeBasedRooms(String title, bool isActive) {
  //   return GestureDetector(
  //     onTap: () {
  //       bookingController.updateRoomType(title);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
  //       decoration: BoxDecoration(
  //           color: isActive ? Colors.green : Colors.transparent,
  //           borderRadius: BorderRadius.circular(20),
  //           border: Border.all(color: Colors.green, width: 1.5)
  //       ),
  //       child: Text(title, style: TextStyle(
  //         color: isActive ? Colors.black : Colors.greenAccent,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 14,),),
  //     ),
  //   );
  // }

  Widget roomsCard(RoomsModel rooms) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => RoomDetailsScreen(roomData: rooms),));
      },
      child: Card(
        color: Color(0xFF1E1E1E),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              // child: Image.asset(rooms.images.toString(), height: 100,
              //   width: double.infinity,
              //   fit: BoxFit.cover,),
              child: CachedNetworkImage(
                imageUrl: rooms.images?[0],
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(rooms.title.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(height: 5),
                  Text(rooms.type.toString(), style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 5),
                  Text("₹ ${rooms.price}", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Cities {
  String? cityName;
  String? cityId;
  String? cityImage;

  Cities({this.cityName, this.cityId, this.cityImage});
}

class Rooms {
  String? roomName;
  String? roomId;
  String? roomTitle;
  String? roomType;
  String? roomPrice;
  String? roomImage;

  Rooms({this.roomId, this.roomName, this.roomTitle, this.roomType, this.roomPrice, this.roomImage});

}
