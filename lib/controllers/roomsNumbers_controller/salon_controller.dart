import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers5.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/fullUntPrice.dart';
import 'package:graduation/models/salon_model.dart';
import 'package:graduation/models/salon_voume.dart';

class SalonController extends GetxController {
  late List<SalonModel> salonImages;
  late List<SalonVolume> listSalonVolume;
  TextEditingController lengthTextEditingController = TextEditingController();
  TextEditingController widthTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController fullPriceTextEditingController =
      TextEditingController();
  late int _salonCount;
  int initialPage = 0;
  late PageController pageController;

  SalonController({
    required int salonCount,
  }) {
    _salonCount = salonCount;
  }

  void onClickSubmit(int length, Map arguments) {
    listSalonVolume[initialPage].widthVolume =
        double.parse(widthTextEditingController.text);
    listSalonVolume[initialPage].lengthVolume =
        double.parse(lengthTextEditingController.text);
    listSalonVolume[initialPage].heightVolume =
        double.parse(heightTextEditingController.text);
    listSalonVolume[initialPage].fullPrice =
        double.parse(fullPriceTextEditingController.text);
    if (initialPage < length - 1) {
      initialPage++;
    } else {
      Get.to(
        const FullUnitPrice(),
        arguments: {
          "masterController": arguments['masterController'],
          "listMasterRoomVolume": arguments['listMasterRoomVolume'],
          "listBedRoomVolume": arguments['listBedRoomVolume'],
          "listKidsRoomVolume": arguments['listKidsRoomVolume'],
          "listBathRoomVolume": arguments['listBathRoomVolume'],
          "listKitchenVolume": arguments['listKitchenVolume'],
          "listSalonVolume": listSalonVolume,
        },
      );
      // go to new page
    }
    widthTextEditingController.text =
        (listSalonVolume[initialPage].widthVolume != 0.0
            ? listSalonVolume[initialPage].widthVolume.toString()
            : "");
    lengthTextEditingController.text =
        listSalonVolume[initialPage].lengthVolume != 0.0
            ? listSalonVolume[initialPage].lengthVolume.toString()
            : "";
    heightTextEditingController.text =
        listSalonVolume[initialPage].heightVolume != 0.0
            ? listSalonVolume[initialPage].heightVolume.toString()
            : "";
    fullPriceTextEditingController.text =
        listSalonVolume[initialPage].fullPrice != 0.0
            ? listSalonVolume[initialPage].fullPrice.toString()
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
          (listSalonVolume[initialPage].widthVolume != 0.0
              ? listSalonVolume[initialPage].widthVolume.toString()
              : "");
      lengthTextEditingController.text =
          listSalonVolume[initialPage].lengthVolume != 0.0
              ? listSalonVolume[initialPage].lengthVolume.toString()
              : "";
      heightTextEditingController.text =
          listSalonVolume[initialPage].heightVolume != 0.0
              ? listSalonVolume[initialPage].heightVolume.toString()
              : "";
      fullPriceTextEditingController.text =
          listSalonVolume[initialPage].fullPrice != 0.0
              ? listSalonVolume[initialPage].fullPrice.toString()
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
    listSalonVolume = [];
    for (int i = 0; i < _salonCount; i++) {
      listSalonVolume.add(SalonVolume(
          lengthVolume: 0, widthVolume: 0, heightVolume: 0, fullPrice: 0));
    }

    for (SalonVolume a in listSalonVolume) {
      print(
          "${a.heightVolume} ${a.widthVolume} ${a.lengthVolume} +++++++++++++++");
    }
    lengthTextEditingController.text = "";
    widthTextEditingController.text = "";
    heightTextEditingController.text = "";
    fullPriceTextEditingController.text = "";
    salonImages = [
      SalonModel(AssetManagers.salon1, 9600),
      SalonModel(AssetManagers.salon2, 8900),
      SalonModel(AssetManagers.salon3, 3000),
      SalonModel(AssetManagers.salon4, 9000),
      SalonModel(AssetManagers.salon5, 5000),
      SalonModel(AssetManagers.salon6, 3600),
      SalonModel(AssetManagers.salon7, 8900),
      SalonModel(AssetManagers.salon8, 7800),
      SalonModel(AssetManagers.salon9, 6500),
      SalonModel(AssetManagers.salon10, 3500),
      SalonModel(AssetManagers.salon11, 4500),
      SalonModel(AssetManagers.salon12, 3200),
      SalonModel(AssetManagers.salon13, 7800),
      SalonModel(AssetManagers.salon14, 4500),
      SalonModel(AssetManagers.salon15, 1200),
    ];
  }
}
