import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers.dart';
import 'package:get/get.dart';
import 'package:graduation/models/bath_room_volume.dart';
import 'package:graduation/models/bed_room_volume.dart';
import 'package:graduation/models/kids_room_volume.dart';
import 'package:graduation/models/kitchen_volume.dart';
import 'package:graduation/models/master_room_volume.dart';
import 'package:graduation/models/salon_voume.dart';

class FullUnitPriceController extends GetxController {
  late TextEditingController fullUnitPriceController;
  late TextEditingController suggestedDealineController;

  // var selectedItem = "".obs;
  // void upDateSelectedItem(String value) {
  //   selectedItem.value = value;
  // }

  String? selectedValue;
  var method = ['Cash', 'Visa'];

  void onSelected(String value) {
    selectedValue = value;
    update();
    print(selectedValue);
    changeMethod(selectedValue);
  }

  changeMethod(String? selectedMethod) {
    switch (selectedMethod) {
      case 'Cash':
        Get.updateLocale(Locale('en_US'));
        print('Changed to Cash');
        break;
      case 'Visa':
        Get.updateLocale(Locale('en_US'));
        print('Changed to Visa');
        break;
      default:
        Get.updateLocale(Locale('en_US'));
        print('Fallback to Cash');
        break;
    }
  }

  late Map _arguments;

  void getAllFullPRice() {
    double full = 0;
    List<MasterRoomVolume> listMasterRoomVolume =
        _arguments['listMasterRoomVolume'];
    for (MasterRoomVolume masterRoomVolume in listMasterRoomVolume) {
      full += masterRoomVolume.fullPrice;
    }
    List<BedRoomVolume> listBedRoomVolume = _arguments['listBedRoomVolume'];
    for (BedRoomVolume bedRoomVolume in listBedRoomVolume) {
      full += bedRoomVolume.fullPrice;
    }
    List<KidsRoomVolume> listKidsRoomVolume = _arguments['listKidsRoomVolume'];
    for (KidsRoomVolume masterRoomVolume in listKidsRoomVolume) {
      full += masterRoomVolume.fullPrice;
    }
    List<BathRoomVolume> listBathRoomVolume = _arguments['listBathRoomVolume'];
    for (BathRoomVolume bathRoomVolume in listBathRoomVolume) {
      full += bathRoomVolume.fullPrice;
    }
    List<KitchenVolume> listKitchenVolume = _arguments['listKitchenVolume'];
    for (KitchenVolume kitchenVolume in listKitchenVolume) {
      full += kitchenVolume.fullPrice;
    }
    List<SalonVolume> listSalonVolume = _arguments['listSalonVolume'];
    for (SalonVolume salonVolume in listSalonVolume) {
      full += salonVolume.fullPrice;
    }
    print(full);
    fullUnitPriceController.text = full.toString();
  }

  FullUnitPriceController(Map arguments) {
    _arguments = arguments;
    fullUnitPriceController = TextEditingController();
    suggestedDealineController = TextEditingController();

    getAllFullPRice();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
