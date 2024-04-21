import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers2.dart';

//import 'package:graduation/core/resources/asset_managers.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/bathRoom.dart';
import 'package:graduation/models/kids_room_model.dart';
import 'package:graduation/models/kids_room_volume.dart';

class KidsRoomController extends GetxController {
  late List<KidsRoomModel> kidsRoomImages;
  late List<KidsRoomVolume> listKidsRoomVolume;
  TextEditingController lengthTextEditingController = TextEditingController();
  TextEditingController widthTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController fullPriceTextEditingController =
      TextEditingController();
  late int _kidsRoomCount;
  int initialPage = 0;
  late PageController pageController;

  KidsRoomController({
    required int kidsRoomCount,
  }) {
    _kidsRoomCount = kidsRoomCount;
  }

  void onClickSubmit(int length, Map arguments) {
    listKidsRoomVolume[initialPage].widthVolume =
        double.parse(widthTextEditingController.text);
    listKidsRoomVolume[initialPage].lengthVolume =
        double.parse(lengthTextEditingController.text);
    listKidsRoomVolume[initialPage].heightVolume =
        double.parse(heightTextEditingController.text);
    listKidsRoomVolume[initialPage].fullPrice =
        double.parse(fullPriceTextEditingController.text);
    if (initialPage < length - 1) {
      initialPage++;
    } else {
      Get.to(
        const BathRoom(),
        arguments: {
          "masterController": arguments['masterController'],
          "listMasterRoomVolume": arguments['listMasterRoomVolume'],
          "listBedRoomVolume": arguments['listBedRoomVolume'],
          "listKidsRoomVolume": listKidsRoomVolume,
        },
      );
      // go to new page
    }
    widthTextEditingController.text =
        (listKidsRoomVolume[initialPage].widthVolume != 0.0
            ? listKidsRoomVolume[initialPage].widthVolume.toString()
            : "");
    lengthTextEditingController.text =
        listKidsRoomVolume[initialPage].lengthVolume != 0.0
            ? listKidsRoomVolume[initialPage].lengthVolume.toString()
            : "";
    heightTextEditingController.text =
        listKidsRoomVolume[initialPage].heightVolume != 0.0
            ? listKidsRoomVolume[initialPage].heightVolume.toString()
            : "";
    fullPriceTextEditingController.text =
        listKidsRoomVolume[initialPage].fullPrice != 0.0
            ? listKidsRoomVolume[initialPage].fullPrice.toString()
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
          (listKidsRoomVolume[initialPage].widthVolume != 0.0
              ? listKidsRoomVolume[initialPage].widthVolume.toString()
              : "");
      lengthTextEditingController.text =
          listKidsRoomVolume[initialPage].lengthVolume != 0.0
              ? listKidsRoomVolume[initialPage].lengthVolume.toString()
              : "";
      heightTextEditingController.text =
          listKidsRoomVolume[initialPage].heightVolume != 0.0
              ? listKidsRoomVolume[initialPage].heightVolume.toString()
              : "";
      fullPriceTextEditingController.text =
          listKidsRoomVolume[initialPage].fullPrice != 0.0
              ? listKidsRoomVolume[initialPage].fullPrice.toString()
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
        GetSnackBar(
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
    listKidsRoomVolume = [];
    for (int i = 0; i < _kidsRoomCount; i++) {
      listKidsRoomVolume.add(KidsRoomVolume(
          lengthVolume: 0, widthVolume: 0, heightVolume: 0, fullPrice: 0));
    }

    for (KidsRoomVolume a in listKidsRoomVolume) {
      print(
          "${a.heightVolume} ${a.widthVolume} ${a.lengthVolume} +++++++++++++++");
    }
    lengthTextEditingController.text = "";
    widthTextEditingController.text = "";
    heightTextEditingController.text = "";
    fullPriceTextEditingController.text = "";
    kidsRoomImages = [
      KidsRoomModel(AssetManagers.kidsroom1, 1230),
      KidsRoomModel(AssetManagers.kidsroom2, 7500),
      KidsRoomModel(AssetManagers.kidsroom3, 7800),
      KidsRoomModel(AssetManagers.kidsroom4, 9510),
      KidsRoomModel(AssetManagers.kidsroom5, 3570),
      KidsRoomModel(AssetManagers.kidsroom6, 8520),
      KidsRoomModel(AssetManagers.kidsroom7, 1450),
      KidsRoomModel(AssetManagers.kidsroom8, 3600),
      KidsRoomModel(AssetManagers.kidsroom9, 2560),
      KidsRoomModel(AssetManagers.kidsroom10, 4560),
      KidsRoomModel(AssetManagers.kidsroom11, 7850),
      KidsRoomModel(AssetManagers.kidsroom12, 5200),
      KidsRoomModel(AssetManagers.kidsroom13, 9870),
      KidsRoomModel(AssetManagers.kidsroom14, 1470),
      KidsRoomModel(AssetManagers.kidsroom15, 3690),
      KidsRoomModel(AssetManagers.kidsroom16, 3210),
      KidsRoomModel(AssetManagers.kidsroom17, 6540),
      KidsRoomModel(AssetManagers.kidsroom18, 9870),
      KidsRoomModel(AssetManagers.kidsroom19, 1250),
    ];
  }
}
