import 'package:graduation/controllers/roomsNumbers_controller/room_number_controller.dart';
import 'package:graduation/features/departements/presentations/pages/masterRoom.dart';
import 'package:graduation/features/departements/presentations/widgets/custom_room_numbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/resources/asset_managers.dart';

class RoomsNumbers extends StatelessWidget {
  const RoomsNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    RoomsNumbersController controller = Get.put(RoomsNumbersController());
    return Scaffold(
      backgroundColor: const Color(0xffA6A6A6),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  width: 270,
                  height: 200,
                  child: Image(image: AssetImage('assets/images/logo.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 2,
                  height: 1,
                  color: Color(0xff242525),
                ),
                //RoomsNumbers(),
                const SizedBox(
                  height: 13,
                ),
                CustomRoomsNumbers(
                    title: 'MasterRoom :',
                    textEditingController: controller.masterRoomController),
                const SizedBox(
                  height: 15,
                ),
                CustomRoomsNumbers(
                    title: 'BedRooms :',
                    textEditingController: controller.bedRoomController),
                const SizedBox(
                  height: 15,
                ),
                CustomRoomsNumbers(
                    title: 'KidsRooms :',
                    textEditingController: controller.kidsRoomController),
                const SizedBox(
                  height: 15,
                ),
                CustomRoomsNumbers(
                    title: 'BathRooms :',
                    textEditingController: controller.bathRoomController),
                const SizedBox(
                  height: 15,
                ),
                CustomRoomsNumbers(
                    title: 'Kitchen :',
                    textEditingController: controller.kitchenController),
                const SizedBox(
                  height: 15,
                ),
                CustomRoomsNumbers(
                    title: 'Salon :',
                    textEditingController: controller.salonController),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only( bottom: 10,),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_double_arrow_left,
                      color: Color(0xff242525),
                ),
                  iconSize: 45,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff242525)
                    ),
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                controller.goToMasterRoom();
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff242525),
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 170,
                  child: const Text(
                      'Submit',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff242525),
                    ),

                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
