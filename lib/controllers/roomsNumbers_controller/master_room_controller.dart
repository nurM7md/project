import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/bedRooms.dart';
import 'package:graduation/features/departements/presentations/pages/kidsRoom.dart';
import 'package:graduation/models/master_room_model.dart';
import 'package:graduation/models/master_room_volume.dart';

class MasterRoomController extends GetxController {
  late List<MasterRoomModel> bedRoomsImages;
  late List<MasterRoomVolume> listMasterRoomVolume;
  TextEditingController lengthTextEditingController = TextEditingController();
  TextEditingController widthTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController fullPriceTextEditingController =
      TextEditingController();
  late int _masterRoomCount;
  int initialPage = 0;
  late PageController pageController;

  MasterRoomController({
    required int masterRoomCount,
  }) {
    _masterRoomCount = masterRoomCount;
  }

  void onClickSubmit(int length, Map arguments) {
    listMasterRoomVolume[initialPage].widthVolume =
        double.parse(widthTextEditingController.text);
    listMasterRoomVolume[initialPage].lengthVolume =
        double.parse(lengthTextEditingController.text);
    listMasterRoomVolume[initialPage].heightVolume =
        double.parse(heightTextEditingController.text);
    listMasterRoomVolume[initialPage].fullPrice =
        double.parse(fullPriceTextEditingController.text);
    if (initialPage < length - 1) {
      initialPage++;
    } else {
      Get.to(const BedRooms(), arguments: {
        "masterController": arguments,
        "listMasterRoomVolume": listMasterRoomVolume
      });
      // go to new page
    }
    widthTextEditingController.text =
        (listMasterRoomVolume[initialPage].widthVolume != 0.0
            ? listMasterRoomVolume[initialPage].widthVolume.toString()
            : "");
    lengthTextEditingController.text =
        listMasterRoomVolume[initialPage].lengthVolume != 0.0
            ? listMasterRoomVolume[initialPage].lengthVolume.toString()
            : "";
    heightTextEditingController.text =
        listMasterRoomVolume[initialPage].heightVolume != 0.0
            ? listMasterRoomVolume[initialPage].heightVolume.toString()
            : "";
    fullPriceTextEditingController.text =
        listMasterRoomVolume[initialPage].fullPrice != 0.0
            ? listMasterRoomVolume[initialPage].fullPrice.toString()
            : "";
    /* lengthTextEditingController.clear();
    widthTextEditingController.clear();
    fullPriceTextEditingController.clear();
    heightTextEditingController.clear();*/
    pageController.animateToPage(initialPage,
        duration: const Duration(microseconds: 1000), curve: Curves.easeIn);
  }

  void onClickBack(int length, BuildContext context) {
    if (initialPage > 0) {
      initialPage--;
      widthTextEditingController.text = widthTextEditingController.text =
          (listMasterRoomVolume[initialPage].widthVolume != 0.0
              ? listMasterRoomVolume[initialPage].widthVolume.toString()
              : "");
      lengthTextEditingController.text =
          listMasterRoomVolume[initialPage].lengthVolume != 0.0
              ? listMasterRoomVolume[initialPage].lengthVolume.toString()
              : "";
      heightTextEditingController.text =
          listMasterRoomVolume[initialPage].heightVolume != 0.0
              ? listMasterRoomVolume[initialPage].heightVolume.toString()
              : "";
      fullPriceTextEditingController.text =
          listMasterRoomVolume[initialPage].fullPrice != 0.0
              ? listMasterRoomVolume[initialPage].fullPrice.toString()
              : "";
    } else {
      Navigator.pop(context);
      // go to new page
    }
    /*  if (listMasterRoomVolume[initialPage].widthVolume == 0) {
      lengthTextEditingController.clear();
      widthTextEditingController.clear();
      fullPriceTextEditingController.clear();
      heightTextEditingController.clear();
    }*/
    pageController.animateToPage(initialPage,
        duration: const Duration(microseconds: 1000), curve: Curves.easeIn);
  }

  onPressedBuy(double price) {
    if (lengthTextEditingController.text.toString() == "" ||
        heightTextEditingController.text.toString() == "" ||
        widthTextEditingController.text.toString() == "") {
      Get.showSnackbar(
        const GetSnackBar(
          title: "warning ",
          message: "please fill required fields",
        ),
      );
    } else {
      int length = int.parse(lengthTextEditingController.text);
      int width = int.parse(widthTextEditingController.text);
      int height = int.parse(heightTextEditingController.text);
      double i = length * width * height * (price);
      fullPriceTextEditingController.text = i.toString();

      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: initialPage);
    listMasterRoomVolume = [];
    for (int i = 0; i < _masterRoomCount; i++) {
      listMasterRoomVolume.add(MasterRoomVolume(
          lengthVolume: 0, widthVolume: 0, heightVolume: 0, fullPrice: 0));
    }

    for (MasterRoomVolume a in listMasterRoomVolume) {
      print(
          "${a.heightVolume} ${a.widthVolume} ${a.lengthVolume} +++++++++++++++");
    }
    lengthTextEditingController.text = "";
    widthTextEditingController.text = "";
    heightTextEditingController.text = "";
    fullPriceTextEditingController.text = "";
    bedRoomsImages = [
      MasterRoomModel(AssetManagers.bedroom1, 2500),
      MasterRoomModel(AssetManagers.bedroom2, 200),
      MasterRoomModel(AssetManagers.bedroom3, 300),
      MasterRoomModel(AssetManagers.bedroom4, 300),
      MasterRoomModel(AssetManagers.bedroom5, 5000),
      MasterRoomModel(AssetManagers.bedroom6, 8000),
      MasterRoomModel(AssetManagers.bedroom7, 1000),
      MasterRoomModel(AssetManagers.bedroom8, 6000),
      MasterRoomModel(AssetManagers.bedroom9, 7000),
      MasterRoomModel(AssetManagers.bedroom10, 3000),
      MasterRoomModel(AssetManagers.bedroom11, 4500),
      MasterRoomModel(AssetManagers.bedroom12, 8500),
      MasterRoomModel(AssetManagers.bedroom13, 9508),
      MasterRoomModel(AssetManagers.bedroom14, 3005),
      MasterRoomModel(AssetManagers.bedroom15, 1200),
      MasterRoomModel(AssetManagers.bedroom16, 8000),
      MasterRoomModel(AssetManagers.bedroom17, 7000),
      MasterRoomModel(AssetManagers.bedroom18, 6500),
      MasterRoomModel(AssetManagers.bedroom19, 7000),
    ];
  }
}
