import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers3.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/kitchen.dart';
import 'package:graduation/models/bath_room_model.dart';
import 'package:graduation/models/bath_room_volume.dart';

class BathRoomController extends GetxController {
  late List<BathRoomModel> bathRoomImages;
  late List<BathRoomVolume> listBathRoomVolume;
  TextEditingController lengthTextEditingController = TextEditingController();
  TextEditingController widthTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController fullPriceTextEditingController =
      TextEditingController();
  late int _bathRoomCount;
  int initialPage = 0;
  late PageController pageController;

  BathRoomController({
    required int bathRoomCount,
  }) {
    _bathRoomCount = bathRoomCount;
  }

  void onClickSubmit(int length, Map arguments) {
    listBathRoomVolume[initialPage].widthVolume =
        double.parse(widthTextEditingController.text);
    listBathRoomVolume[initialPage].lengthVolume =
        double.parse(lengthTextEditingController.text);
    listBathRoomVolume[initialPage].heightVolume =
        double.parse(heightTextEditingController.text);
    listBathRoomVolume[initialPage].fullPrice =
        double.parse(fullPriceTextEditingController.text);
    if (initialPage < length - 1) {
      initialPage++;
    } else {
      Get.to(
        const Kitchen(),
        arguments: {
          "masterController": arguments['masterController'],
          "listMasterRoomVolume": arguments['listMasterRoomVolume'],
          "listBedRoomVolume": arguments['listBedRoomVolume'],
          "listKidsRoomVolume": arguments['listKidsRoomVolume'],
          "listBathRoomVolume": listBathRoomVolume,
        },
      );
      // go to new page
    }
    widthTextEditingController.text =
        (listBathRoomVolume[initialPage].widthVolume != 0.0
            ? listBathRoomVolume[initialPage].widthVolume.toString()
            : "");
    lengthTextEditingController.text =
        listBathRoomVolume[initialPage].lengthVolume != 0.0
            ? listBathRoomVolume[initialPage].lengthVolume.toString()
            : "";
    heightTextEditingController.text =
        listBathRoomVolume[initialPage].heightVolume != 0.0
            ? listBathRoomVolume[initialPage].heightVolume.toString()
            : "";
    fullPriceTextEditingController.text =
        listBathRoomVolume[initialPage].fullPrice != 0.0
            ? listBathRoomVolume[initialPage].fullPrice.toString()
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
          (listBathRoomVolume[initialPage].widthVolume != 0.0
              ? listBathRoomVolume[initialPage].widthVolume.toString()
              : "");
      lengthTextEditingController.text =
          listBathRoomVolume[initialPage].lengthVolume != 0.0
              ? listBathRoomVolume[initialPage].lengthVolume.toString()
              : "";
      heightTextEditingController.text =
          listBathRoomVolume[initialPage].heightVolume != 0.0
              ? listBathRoomVolume[initialPage].heightVolume.toString()
              : "";
      fullPriceTextEditingController.text =
          listBathRoomVolume[initialPage].fullPrice != 0.0
              ? listBathRoomVolume[initialPage].fullPrice.toString()
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
    listBathRoomVolume = [];
    for (int i = 0; i < _bathRoomCount; i++) {
      listBathRoomVolume.add(BathRoomVolume(
          lengthVolume: 0, widthVolume: 0, heightVolume: 0, fullPrice: 0));
    }

    for (BathRoomVolume a in listBathRoomVolume) {
      print(
          "${a.heightVolume} ${a.widthVolume} ${a.lengthVolume} +++++++++++++++");
    }
    lengthTextEditingController.text = "";
    widthTextEditingController.text = "";
    heightTextEditingController.text = "";
    fullPriceTextEditingController.text = "";
    bathRoomImages = [
      BathRoomModel(AssetManagers.bathroom1, 1560),
      BathRoomModel(AssetManagers.bathroom2, 2005),
      BathRoomModel(AssetManagers.bathroom3, 1350),
      BathRoomModel(AssetManagers.bathroom4, 9807),
      BathRoomModel(AssetManagers.bathroom5, 6800),
      BathRoomModel(AssetManagers.bathroom6, 8000),
      BathRoomModel(AssetManagers.bathroom7, 1540),
      BathRoomModel(AssetManagers.bathroom8, 9870),
      BathRoomModel(AssetManagers.bathroom9, 7000),
      BathRoomModel(AssetManagers.bathroom10, 5000),
      BathRoomModel(AssetManagers.bathroom11, 9700),
      BathRoomModel(AssetManagers.bathroom12, 8900),
      BathRoomModel(AssetManagers.bathroom13, 8700),
      BathRoomModel(AssetManagers.bathroom14, 6500),
      BathRoomModel(AssetManagers.bathroom15, 3600),
      BathRoomModel(AssetManagers.bathroom16, 4900),
      BathRoomModel(AssetManagers.bathroom17, 8905),
      BathRoomModel(AssetManagers.bathroom18, 7500),
      BathRoomModel(AssetManagers.bathroom19, 7000),
    ];
  }
}
