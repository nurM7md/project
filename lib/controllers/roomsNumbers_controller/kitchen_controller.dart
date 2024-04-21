import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers4.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/salon.dart';
import 'package:graduation/models/kitchen_model.dart';
import 'package:graduation/models/kitchen_volume.dart';

class KitchenController extends GetxController {
  late List<KitchenModel> kitchenImages;
  late List<KitchenVolume> listKitchenVolume;
  TextEditingController lengthTextEditingController = TextEditingController();
  TextEditingController widthTextEditingController = TextEditingController();
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController fullPriceTextEditingController =
      TextEditingController();

  late int _kitchenCount;
  int initialPage = 0;
  late PageController pageController;

  KitchenController({
    required int kitchenCount,
  }) {
    _kitchenCount = kitchenCount;
  }

  void onClickSubmit(int length, Map arguments) {
    listKitchenVolume[initialPage].widthVolume =
        double.parse(widthTextEditingController.text);
    listKitchenVolume[initialPage].lengthVolume =
        double.parse(lengthTextEditingController.text);
    listKitchenVolume[initialPage].heightVolume =
        double.parse(heightTextEditingController.text);
    listKitchenVolume[initialPage].fullPrice =
        double.parse(fullPriceTextEditingController.text);
    if (initialPage < length - 1) {
      initialPage++;
    } else {
      Get.to(
        const Salon(),
        arguments: {
          "masterController": arguments['masterController'],
          "listMasterRoomVolume": arguments['listMasterRoomVolume'],
          "listBedRoomVolume": arguments['listBedRoomVolume'],
          "listKidsRoomVolume": arguments['listKidsRoomVolume'],
          "listBathRoomVolume": arguments['listBathRoomVolume'],
          "listKitchenVolume": listKitchenVolume,
        },
      );
      // go to new page
    }

    widthTextEditingController.text =
        (listKitchenVolume[initialPage].widthVolume != 0.0
            ? listKitchenVolume[initialPage].widthVolume.toString()
            : "");
    lengthTextEditingController.text =
        listKitchenVolume[initialPage].lengthVolume != 0.0
            ? listKitchenVolume[initialPage].lengthVolume.toString()
            : "";
    heightTextEditingController.text =
        listKitchenVolume[initialPage].heightVolume != 0.0
            ? listKitchenVolume[initialPage].heightVolume.toString()
            : "";
    fullPriceTextEditingController.text =
        listKitchenVolume[initialPage].fullPrice != 0.0
            ? listKitchenVolume[initialPage].fullPrice.toString()
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
          (listKitchenVolume[initialPage].widthVolume != 0.0
              ? listKitchenVolume[initialPage].widthVolume.toString()
              : "");
      lengthTextEditingController.text =
          listKitchenVolume[initialPage].lengthVolume != 0.0
              ? listKitchenVolume[initialPage].lengthVolume.toString()
              : "";
      heightTextEditingController.text =
          listKitchenVolume[initialPage].heightVolume != 0.0
              ? listKitchenVolume[initialPage].heightVolume.toString()
              : "";
      fullPriceTextEditingController.text =
          listKitchenVolume[initialPage].fullPrice != 0.0
              ? listKitchenVolume[initialPage].fullPrice.toString()
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
    listKitchenVolume = [];
    for (int i = 0; i < _kitchenCount; i++) {
      listKitchenVolume.add(KitchenVolume(
          lengthVolume: 0, widthVolume: 0, heightVolume: 0, fullPrice: 0));
    }

    for (KitchenVolume a in listKitchenVolume) {
      print(
          "${a.heightVolume} ${a.widthVolume} ${a.lengthVolume} +++++++++++++++");
    }
    lengthTextEditingController.text = "";
    widthTextEditingController.text = "";
    heightTextEditingController.text = "";
    fullPriceTextEditingController.text = "";
    kitchenImages = [
      KitchenModel(AssetManagers.kitchen1, 2580),
      KitchenModel(AssetManagers.kitchen2, 1230),
      KitchenModel(AssetManagers.kitchen3, 9870),
      KitchenModel(AssetManagers.kitchen4, 4560),
      KitchenModel(AssetManagers.kitchen5, 5000),
      KitchenModel(AssetManagers.kitchen6, 8000),
      KitchenModel(AssetManagers.kitchen7, 1000),
      KitchenModel(AssetManagers.kitchen8, 6000),
      KitchenModel(AssetManagers.kitchen9, 7000),
      KitchenModel(AssetManagers.kitchen10, 2500),
      KitchenModel(AssetManagers.kitchen11, 4690),
      KitchenModel(AssetManagers.kitchen12, 8708),
      KitchenModel(AssetManagers.kitchen13, 2568),
      KitchenModel(AssetManagers.kitchen14, 1560),
      KitchenModel(AssetManagers.kitchen15, 1200),
    ];
  }
}
