import 'package:ezybooking/views/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/firebase_messaging/notification_controller.dart';
import 'firebase_options.dart';

@pragma("vm:entry-point")
Future<void> _firebaseBackgroundMessageHandler(RemoteMessage message)async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessageHandler);
  Get.put(NotificationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EZYBOOKING',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}



///


// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:share_plus/share_plus.dart';
// import 'dart:io';
//
// void main() {
//   runApp(const PhotoSharingApp());
// }
//
// class PhotoSharingApp extends StatelessWidget {
//   const PhotoSharingApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Photo Sharing App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const StartScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// // A. Start Screen
// class StartScreen extends StatelessWidget {
//   const StartScreen({Key? key}) : super(key: key);
//
//   Future<void> _openGallery(BuildContext context) async {
//     final ImagePicker picker = ImagePicker();
//     try {
//       final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//       if (image != null && context.mounted) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => FilterScreen(selectedImage: image),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.purple[300],
//             minimumSize: const Size(200, 50),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(25),
//             ),
//           ),
//           onPressed: () => _openGallery(context),
//           child: const Text(
//             'Start',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // Filter Screen
// class FilterScreen extends StatefulWidget {
//   final XFile selectedImage;
//
//   const FilterScreen({Key? key, required this.selectedImage}) : super(key: key);
//
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends State<FilterScreen> {
//   int _selectedFilterIndex = 0;
//   double _filterStrength = 1.0;
//
//   Widget _buildFilterOption(int index, Color color, String label) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedFilterIndex = index;
//         });
//       },
//       child: Column(
//         children: [
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: color,
//               shape: BoxShape.circle,
//               border: _selectedFilterIndex == index
//                   ? Border.all(color: Colors.white, width: 2)
//                   : null,
//             ),
//             child: index == 0
//                 ? const Icon(Icons.photo_library, color: Colors.white)
//                 : null,
//           ),
//           const SizedBox(height: 5),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 12, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<double> _getFilterMatrix() {
//     switch (_selectedFilterIndex) {
//       case 1: // Purple tint
//         return [
//           1 + 0.2 * _filterStrength, 0, 0, 0, 0,
//           0, 1, 0, 0, 0,
//           0, 0, 1 + 0.1 * _filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       case 2: // High contrast
//         return [
//           1 + _filterStrength, 0, 0, 0, 0,
//           0, 1 + _filterStrength, 0, 0, 0,
//           0, 0, 1 + _filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       case 3: // Cooler tone
//         return [
//           1 - 0.1 * _filterStrength, 0, 0, 0, 0,
//           0, 1, 0, 0, 0,
//           0, 0, 1 + 0.3 * _filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       case 4: // Warmer tone
//         return [
//           1 + 0.3 * _filterStrength, 0, 0, 0, 0,
//           0, 1 + 0.1 * _filterStrength, 0, 0, 0,
//           0, 0, 1 - 0.2 * _filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       default: // No filter
//         return [
//           1, 0, 0, 0, 0,
//           0, 1, 0, 0, 0,
//           0, 0, 1, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//     }
//   }
//
//   void _shareImage() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ShareScreen(
//           image: widget.selectedImage,
//           filterIndex: _selectedFilterIndex,
//           filterStrength: _filterStrength,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           'New Post',
//           style: TextStyle(color: Colors.black),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _shareImage,
//             child: Text(
//               'Next',
//               style: TextStyle(
//                 color: Colors.purple[300],
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Image preview area
//           Expanded(
//             child: ColorFiltered(
//               colorFilter: ColorFilter.matrix(_getFilterMatrix()),
//               child: Image.file(
//                 File(widget.selectedImage.path),
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//                 height: 100,
//               ),
//             ),
//           ),
//
//           // Filter options
//           Container(
//             color: Colors.black87,
//             padding: const EdgeInsets.symmetric(vertical: 15),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildFilterOption(0, Colors.purple[200]!, 'Browse'),
//                     _buildFilterOption(1, Colors.purple[300]!, 'Filter 1'),
//                     _buildFilterOption(2, Colors.purple[700]!, 'Filter 2'),
//                     _buildFilterOption(3, Colors.blue[400]!, 'Filter 3'),
//                     _buildFilterOption(4, Colors.lime[400]!, 'Filter 4'),
//                   ],
//                 ),
//                 if (_selectedFilterIndex != 0)
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 15,
//                       left: 20,
//                       right: 20,
//                     ),
//                     child: Row(
//                       children: [
//                         const Text(
//                           'Strength',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         Expanded(
//                           child: Slider(
//                             activeColor: Colors.purple[300],
//                             value: _filterStrength,
//                             min: 0.0,
//                             max: 1.0,
//                             onChanged: (value) {
//                               setState(() {
//                                 _filterStrength = value;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Share Screen
// class ShareScreen extends StatelessWidget {
//   final XFile image;
//   final int filterIndex;
//   final double filterStrength;
//
//   const ShareScreen({
//     Key? key,
//     required this.image,
//     required this.filterIndex,
//     required this.filterStrength,
//   }) : super(key: key);
//
//   Future<void> _openShareOptions() async {
//     try {
//       await Share.shareXFiles(
//         [image],
//         text: 'Check out my photo!',
//       );
//     } catch (e) {
//       print('Error sharing: $e');
//     }
//   }
//
//   List<double> _getFilterMatrix() {
//     switch (filterIndex) {
//       case 1: // Purple tint
//         return [
//           1 + 0.2 * filterStrength, 0, 0, 0, 0,
//           0, 1, 0, 0, 0,
//           0, 0, 1 + 0.1 * filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       case 2: // High contrast
//         return [
//           1 + filterStrength, 0, 0, 0, 0,
//           0, 1 + filterStrength, 0, 0, 0,
//           0, 0, 1 + filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       case 3: // Cooler tone
//         return [
//           1 - 0.1 * filterStrength, 0, 0, 0, 0,
//           0, 1, 0, 0, 0,
//           0, 0, 1 + 0.3 * filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       case 4: // Warmer tone
//         return [
//           1 + 0.3 * filterStrength, 0, 0, 0, 0,
//           0, 1 + 0.1 * filterStrength, 0, 0, 0,
//           0, 0, 1 - 0.2 * filterStrength, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//       default: // No filter
//         return [
//           1, 0, 0, 0, 0,
//           0, 1, 0, 0, 0,
//           0, 0, 1, 0, 0,
//           0, 0, 0, 1, 0,
//         ];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'New Post',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Image display
//           Expanded(
//             child: ColorFiltered(
//               colorFilter: ColorFilter.matrix(_getFilterMatrix()),
//               child: Image.file(
//                 File(image.path),
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//           ),
//
//           // Share button
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple[300],
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//               onPressed: _openShareOptions,
//               child: const Text(
//                 'Share',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
///
// import 'package:flutter/material.dart';
// import 'package:photo_manager/photo_manager.dart';
//
// void main() {
//   runApp(PhotoSharingApp());
// }
//
// class PhotoSharingApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: StartScreen(),
//     );
//   }
// }
//
// class StartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => GalleryScreen()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.purple,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               minimumSize: Size(double.infinity, 50),
//             ),
//             child: Text("Start", style: TextStyle(fontSize: 18, color: Colors.white)),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class GalleryScreen extends StatefulWidget {
//   @override
//   _GalleryScreenState createState() => _GalleryScreenState();
// }
//
// class _GalleryScreenState extends State<GalleryScreen> {
//   List<AssetEntity> mediaList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadGallery();
//   }
//
//   Future<void> loadGallery() async {
//     final permission = await PhotoManager.requestPermissionExtend();
//     if (permission.isAuth) {
//       List<AssetPathEntity> albums = await PhotoManager.getAssetPathList();
//       if (albums.isNotEmpty) {
//         List<AssetEntity> media = await albums[0].getAssetListPaged(page: 0, size: 50);
//         setState(() {
//           mediaList = media;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text("New Post", style: TextStyle(color: Colors.black)),
//         actions: [
//           TextButton(
//             onPressed: () {},
//             child: Text("Next", style: TextStyle(color: Colors.purple, fontSize: 16)),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 200,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: mediaList.isNotEmpty
//                       ? AssetEntityImageProvider(mediaList[0])
//                       : AssetImage("assets/placeholder.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(Icons.photo_library, color: Colors.grey),
//                 Icon(Icons.photo_camera, color: Colors.grey),
//                 Icon(Icons.video_library, color: Colors.grey),
//               ],
//             ),
//           ),
//           Expanded(
//             child: GridView.builder(
//               padding: EdgeInsets.all(8),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 crossAxisSpacing: 4,
//                 mainAxisSpacing: 4,
//               ),
//               itemCount: mediaList.length,
//               itemBuilder: (context, index) {
//                 return AssetEntityImage(mediaList[index], fit: BoxFit.cover);
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton(
//                   onPressed: () {},
//                   child: Text("Post", style: TextStyle(color: Colors.purple, fontSize: 16)),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text("Reel", style: TextStyle(color: Colors.black, fontSize: 16)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
