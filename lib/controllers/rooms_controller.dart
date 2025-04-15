import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezybooking/models/rooms_model.dart';
import 'package:get/get.dart';

class RoomsController extends GetxController{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  RxList<RoomsModel> roomsListList = <RoomsModel>[].obs;
  // RxList<CityModel> citiesListList = <CityModel>[].obs;
  // RxList<AddRoomsTypesModel> roomTypeList = <AddRoomsTypesModel>[].obs;

  // void getCityList(){
  //   _db.collection("city").snapshots().listen((snap) => citiesList.value = snap.docs.map((doc) => CityModel.fromJson(doc.data()),).toList(),);
  // }

  void getRoomsList(){
    _db.collection("Rooms").snapshots().listen((snap) => roomsListList.value = snap.docs.map((doc) => RoomsModel.fromJson(doc.data()),).toList(),);
  }

  @override
  void onInit() {
    // getCityList();
    getRoomsList();
    super.onInit();

  }
}