import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezybooking/models/add_rooms_types_model.dart';
import 'package:ezybooking/models/city_model.dart';
import 'package:get/get.dart';

class CityController extends GetxController{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  RxList<CityModel> citiesList = <CityModel>[].obs;
  RxList<AddRoomsTypesModel> roomTypeList = <AddRoomsTypesModel>[].obs;

  void getCityList(){
    _db.collection("city").snapshots().listen((snap) => citiesList.value = snap.docs.map((doc) => CityModel.fromJson(doc.data()),).toList(),);
  }

  void getRoomsTypeList(){
    print("roomTypeList => $roomTypeList");
    _db.collection("roomsType").snapshots().listen((snap) => roomTypeList.value = snap.docs.map((doc) => AddRoomsTypesModel.fromJson(doc.data()),).toList(),);
    print("roomTypeList => $roomTypeList");
  }

  @override
  void onInit() {
    getCityList();
    getRoomsTypeList();
    super.onInit();

  }
}