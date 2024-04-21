import 'package:graduation/controllers/roomsNumbers_controller/full_unit_price_controller.dart';
import 'package:graduation/controllers/roomsNumbers_controller/room_number_controller.dart';
import 'package:graduation/features/departements/presentations/pages/bedRooms.dart';
import 'package:graduation/features/departements/presentations/pages/masterRoom.dart';
import 'package:graduation/features/departements/presentations/widgets/custom_full_unit_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/resources/asset_managers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/bath_room_volume.dart';
import 'package:graduation/models/bed_room_volume.dart';
import 'package:graduation/models/kids_room_volume.dart';
import 'package:graduation/models/kitchen_volume.dart';
import 'package:graduation/models/master_room_volume.dart';
import 'package:graduation/models/salon_voume.dart';

class FullUnitPrice extends StatelessWidget {
  const FullUnitPrice({super.key});

  //final List paymentList =["Cash" , "Visa"];

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;


    FullUnitPriceController controller = Get.put(FullUnitPriceController(arguments));
    return Scaffold(
      backgroundColor: const Color(0xffA6A6A6),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 270,
                  height: 200,
                  child: const Image(
                    image: AssetImage('assets/images/logo.jpg'),
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
                CustomFullUnitPrice(
                    title: 'Full Unit Price :',
                    textEditingController: controller.fullUnitPriceController),
                const SizedBox(
                  height: 13,
                ),
                CustomFullUnitPrice(
                    title: 'Suggested DeadLine :',
                    textEditingController:
                        controller.suggestedDealineController),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.maxFinite,
                  height: 150,
                  child: TextField(
                    //controller: textEditingController,
                    //Set text style
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
                    keyboardType: TextInputType.multiline,
                    minLines: 9,
                    maxLines: 10,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2.5,
                              color: Color(0xff242525),
                              strokeAlign: 0.5),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff242525),
                            width: 1,
                            strokeAlign: 0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Type Any Notes",
                      //   hintStyle: TextStyle(
                      //     color: Color(0xff242525),
                      //     fontFamily: 'Kalam',
                      // ) ,
                      hintStyle: GoogleFonts.kalam(
                        color: const Color(0xff242525),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                const SizedBox(height: 10.0),
                DropdownButton(
                    borderRadius: BorderRadius.circular(15.0),
                    dropdownColor: const Color(0xff6E6E6E),
                    iconSize: 50,
                    iconDisabledColor: const Color(0xff242525),
                    hint: Text(
                      'Payment Method Selection',
                      style: GoogleFonts.artifika(
                        color: const Color(0xff242525),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    value: controller.selectedValue,
                    onChanged: (newValue) {
                      controller.onSelected(newValue!);
                      if (newValue == 'Visa') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MasterRoom()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BedRooms()));
                      }
                    },
                    elevation: 10,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Cash",
                          style: GoogleFonts.artifika(
                            color: Color(0xff242525),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        value: 'Cash',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "Visa",
                          style: GoogleFonts.artifika(
                            color: Color(0xff242525),
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        value: 'Visa',
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
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
                  icon: Icon(
                    Icons.keyboard_double_arrow_left,
                    color: Color(0xff242525),
                  ),
                  iconSize: 45,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff242525)),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MasterRoom()));
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff242525),
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 170,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff242525),
                    ),
                  )),
            )
          ],
        ),
        width: double.infinity,
      ),
    );
  }
}
