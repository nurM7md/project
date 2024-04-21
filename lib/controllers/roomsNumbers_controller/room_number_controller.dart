import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation/core/resources/asset_managers.dart';
import 'package:get/get.dart';
import 'package:graduation/features/departements/presentations/pages/masterRoom.dart';

class RoomsNumbersController extends GetxController {
  late TextEditingController masterRoomController;
  late TextEditingController bedRoomController;
  late TextEditingController kidsRoomController;
  late TextEditingController bathRoomController;
  late TextEditingController kitchenController;
  late TextEditingController salonController;

  void goToMasterRoom() {
    Get.to(const MasterRoom(), arguments: {
      "masterRoomController": masterRoomController.text,
      "bedRoomController": bedRoomController.text,
      "kidsRoomController": kidsRoomController.text,
      "bathRoomController": bathRoomController.text,
      "kitchenController": kitchenController.text,
      "salonController": salonController.text,
    });
  }

  RoomsNumbersController() {}

  @override
  void onInit() {
    // TODO: implement onInit
    masterRoomController = TextEditingController();
    bedRoomController = TextEditingController();
    kidsRoomController = TextEditingController();
    bathRoomController = TextEditingController();
    kitchenController = TextEditingController();
    salonController = TextEditingController();
    super.onInit();
  }
}
