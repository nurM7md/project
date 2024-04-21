import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/kidsRoom.dart';
import 'package:graduation/models/bed_room_volume.dart';
import 'package:graduation/models/bed_rooms_model.dart';
import 'package:graduation/models/bed_rooms_model.dart';

class BedRoomsController extends GetxController {
  late List<BedRoomsModel> bedRoomsImages;
  late List<BedRoomVolume> listBedRoomVolume;
  TextEditingController lengthTextEditingController = TextEditingController();
  TextEditingController widthTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController fullPriceTextEditingController =
      TextEditingController();
  late int _bedRoomCount;
  int initialPage = 0;
  late PageController pageController;

  BedRoomsController({
    required int bedRoomCount,
  }) {
    _bedRoomCount = bedRoomCount;
    print(_bedRoomCount.toString());
  }

  void onClickSubmit(int length, Map arguments) {
    listBedRoomVolume[initialPage].widthVolume =
        double.parse(widthTextEditingController.text);
    listBedRoomVolume[initialPage].lengthVolume =
        double.parse(lengthTextEditingController.text);
    listBedRoomVolume[initialPage].heightVolume =
        double.parse(heightTextEditingController.text);
    listBedRoomVolume[initialPage].fullPrice =
        double.parse(fullPriceTextEditingController.text);
    if (initialPage < length - 1) {
      initialPage++;
    } else {
      print(arguments);
      Get.to(
        const KidsRoom(),
        arguments: {
          "masterController": arguments['masterController'],
          "listMasterRoomVolume": arguments['listMasterRoomVolume'],
          "listBedRoomVolume": listBedRoomVolume
        },
      );
      // go to new page
    }
    widthTextEditingController.text =
        (listBedRoomVolume[initialPage].widthVolume != 0.0
            ? listBedRoomVolume[initialPage].widthVolume.toString()
            : "");
    lengthTextEditingController.text =
        listBedRoomVolume[initialPage].lengthVolume != 0.0
            ? listBedRoomVolume[initialPage].lengthVolume.toString()
            : "";
    heightTextEditingController.text =
        listBedRoomVolume[initialPage].heightVolume != 0.0
            ? listBedRoomVolume[initialPage].heightVolume.toString()
            : "";
    fullPriceTextEditingController.text =
        listBedRoomVolume[initialPage].fullPrice != 0.0
            ? listBedRoomVolume[initialPage].fullPrice.toString()
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
          (listBedRoomVolume[initialPage].widthVolume != 0.0
              ? listBedRoomVolume[initialPage].widthVolume.toString()
              : "");
      lengthTextEditingController.text =
          listBedRoomVolume[initialPage].lengthVolume != 0.0
              ? listBedRoomVolume[initialPage].lengthVolume.toString()
              : "";
      heightTextEditingController.text =
          listBedRoomVolume[initialPage].heightVolume != 0.0
              ? listBedRoomVolume[initialPage].heightVolume.toString()
              : "";
      fullPriceTextEditingController.text =
          listBedRoomVolume[initialPage].fullPrice != 0.0
              ? listBedRoomVolume[initialPage].fullPrice.toString()
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

  //BedRoomsController() {}

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: initialPage);
    listBedRoomVolume = [];
    for (int i = 0; i < _bedRoomCount; i++) {
      listBedRoomVolume.add(BedRoomVolume(
          lengthVolume: 0, widthVolume: 0, heightVolume: 0, fullPrice: 0));
    }

    for (BedRoomVolume a in listBedRoomVolume) {
      print(
          "${a.heightVolume} ${a.widthVolume} ${a.lengthVolume} +++++++++++++++");
    }
    lengthTextEditingController.text = "";
    widthTextEditingController.text = "";
    heightTextEditingController.text = "";
    fullPriceTextEditingController.text = "";
    bedRoomsImages = [
      BedRoomsModel(AssetManagers.bedroom4, 1500),
      BedRoomsModel(AssetManagers.bedroom12, 8500),
      BedRoomsModel(AssetManagers.bedroom17, 8900),
      BedRoomsModel(AssetManagers.bedroom16, 7890),
      BedRoomsModel(AssetManagers.bedroom15, 5800),
      BedRoomsModel(AssetManagers.bedroom19, 6970),
      BedRoomsModel(AssetManagers.bedroom11, 1590),
      BedRoomsModel(AssetManagers.bedroom10, 4500),
      BedRoomsModel(AssetManagers.bedroom14, 9800),
      BedRoomsModel(AssetManagers.bedroom18, 3640),
      BedRoomsModel(AssetManagers.bedroom8, 1234),
      BedRoomsModel(AssetManagers.bedroom1, 5200),
      BedRoomsModel(AssetManagers.bedroom2, 3600),
      BedRoomsModel(AssetManagers.bedroom3, 5960),
      BedRoomsModel(AssetManagers.bedroom9, 7530),
      BedRoomsModel(AssetManagers.bedroom5, 9510),
      BedRoomsModel(AssetManagers.bedroom7, 8610),
      BedRoomsModel(AssetManagers.bedroom6, 3260),
      BedRoomsModel(AssetManagers.bedroom13, 1450),
    ];
  }
}
