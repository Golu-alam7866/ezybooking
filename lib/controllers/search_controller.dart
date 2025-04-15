import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFunctionController extends GetxController {
  RxString searchQuery = "".obs;
  RxList searchResult = [].obs;
  RxBool isLoading = false.obs;
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    debounce(searchQuery, (callback) => performSearch(),time: Duration(milliseconds: 500));
  }

  Future<void> performSearch() async {
    isLoading.value = true;
    searchResult.clear();

    if (searchQuery.value.isNotEmpty) {
      try {
        var result = await performMultiCollectionSearch(searchQuery.value);
        searchResult.addAll(result);
      } catch (e) {
        print('Error during search: $e');
        Get.snackbar("Search Error", "An error occurred during search.");
      }
    }

    isLoading.value = false;
  }

  Future<List> performMultiCollectionSearch(String searchQuery) async {
    Set<String> uniqueDocIds = {};
    List<QueryDocumentSnapshot> allResults = [];

    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;


      // Rooms Collection Queries
      List<QuerySnapshot> roomsSnapshots = await Future.wait([
        firestore.collection('Rooms')
            .where('title', isGreaterThanOrEqualTo: searchQuery)
            .where('title', isLessThan: '$searchQuery\uf8ff')
            .get(),
        firestore.collection('Rooms')
            .where('description', isGreaterThanOrEqualTo: searchQuery)
            .where('description', isLessThan: '$searchQuery\uf8ff')
            .get(),
        firestore.collection('Rooms')
            .where('hotelCity', isGreaterThanOrEqualTo: searchQuery)
            .where('hotelCity', isLessThan: '$searchQuery\uf8ff')
            .get(),
      ]);

      // Services Collection Queries
      List<QuerySnapshot> servicesSnapshots = await Future.wait([
        firestore.collection('services')
            .where('title', isGreaterThanOrEqualTo: searchQuery)
            .where('title', isLessThan: '$searchQuery\uf8ff')
            .get(),
        firestore.collection('services')
            .where('description', isGreaterThanOrEqualTo: searchQuery)
            .where('description', isLessThan: '$searchQuery\uf8ff')
            .get(),
        firestore.collection('services')
            .where('city', isGreaterThanOrEqualTo: searchQuery)
            .where('city', isLessThan: '$searchQuery\uf8ff')
            .get(),
      ]);

      // Merging all results while removing duplicates
      for (var snapshot in [...roomsSnapshots, ...servicesSnapshots]) {
        for (var doc in snapshot.docs) {
          if (!uniqueDocIds.contains(doc.id)) {
            uniqueDocIds.add(doc.id);
            allResults.add(doc);
          }
        }
      }
    } catch (e) {
      print("Error during multi-collection search: $e");
      rethrow;
    }

    return allResults;
  }


}
