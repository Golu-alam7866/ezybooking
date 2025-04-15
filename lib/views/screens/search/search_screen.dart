import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controllers/search_controller.dart';
import '../../utils/app_constants/app_images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchFunctionController searchController = Get.put(SearchFunctionController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.loading, width: 50, height: 50),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 20, color: Colors.white),
              child: AnimatedTextKit(
                animatedTexts: [WavyAnimatedText("Ezy Booking")],
                isRepeatingAnimation: true,
                onTap: () => print("Top Event"),
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              onChanged: (value) {
                searchController.searchQuery.value = value;
                searchController.performSearch();
              },
              controller: searchController.searchController,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.grey[900],
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (searchController.isLoading.value) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (searchController.searchResult.isEmpty &&
            searchController.searchQuery.isNotEmpty) {
          return const Center(child: Text('No results found.', style: TextStyle(color: Colors.white)));
        } else {
          return ListView.builder(
            itemCount: searchController.searchResult.length,
            itemBuilder: (context, index) {
              var doc = searchController.searchResult[index];
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
                        imageUrl: doc["images"][0],
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
                          Text(doc['title'] ?? 'Title not available', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                          SizedBox(height: 5),
                          Text(doc['type'] ?? 'Type not available', style: TextStyle(color: Colors.white70, fontSize: 14)),
                          // Text(doc.type.toString(), style: TextStyle(color: Colors.white70, fontSize: 14)),
                          SizedBox(height: 5),
                          Text("₹ ${doc['price'] ?? 'Price not available'}", style: TextStyle(color: Colors.white70, fontSize: 14)),
                          // Text("₹ ${doc.price}", style: TextStyle(color: Colors.white70, fontSize: 14)),

                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
