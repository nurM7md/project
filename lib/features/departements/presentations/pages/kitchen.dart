import 'package:graduation/controllers/roomsNumbers_controller/kitchen_controller.dart';
import 'package:graduation/features/departements/presentations/pages/salon.dart';
import 'package:graduation/features/departements/presentations/widgets/custom_kitchen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/resources/asset_managers.dart';
import 'package:google_fonts/google_fonts.dart';

class Kitchen extends StatelessWidget {
  const Kitchen({super.key});

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    KitchenController controller = Get.put(KitchenController(
        kitchenCount: int.parse(arguments["masterController"]['kitchenController'])
    ));
    controller.onInit();
    return Scaffold(
      backgroundColor:const Color(0xffA6A6A6),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 120,
                height: 130,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                  ),
                )),
           const Divider(
              thickness: 2,
              height: 1,
              color: Color(0xff242525),
            ),
            Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: int.parse(arguments["masterController"]['kitchenController']),
                    itemBuilder: (context, index) => Column(children: [

           const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                 Text(
                    'Kitchen',
                    style: GoogleFonts.artifika(
                      color: Color(0xff242525),
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
               const SizedBox(
                  width: 5,
                ),
                Text(
                  '${index+1}',
                  style: GoogleFonts.artifika(
                    color: const Color(0xff242525),
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 115,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: controller.lengthTextEditingController,
                    //Set text style
                    style: const TextStyle(fontSize: 13),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xff242525),
                              strokeAlign: 0.5),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                            color: Color(0xff242525),
                            width: 1,
                            strokeAlign: 0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "enter length",
                      hintStyle: GoogleFonts.kalam(
                        color:const Color(0xff242525),
                      ),
                    ),
                  ),
                ),
               const Text(
                  '*',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color(0xff242525),
                  ),
                ),
                Container(
                  width: 115,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: controller.widthTextEditingController,
                    //Set text style
                    style: const TextStyle(fontSize: 13),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xff242525),
                              strokeAlign: 0.5),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                            color: Color(0xff242525),
                            width: 1,
                            strokeAlign: 0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "enter width",
                      hintStyle: GoogleFonts.kalam(
                        color: Color(0xff242525),
                      ),
                    ),
                  ),
                ),
               const Text(
                  '*',
                  style: TextStyle(
                    fontSize: 35,
                    color: Color(0xff242525),
                  ),
                ),
                Container(
                  width: 115,
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: controller.heightTextEditingController,
                    //Set text style
                    style: const TextStyle(fontSize: 13),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xff242525),
                              strokeAlign: 0.5),
                          borderRadius: BorderRadius.circular(50)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(
                            color: Color(0xff242525),
                            width: 1,
                            strokeAlign: 0.5),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "enter height",
                      hintStyle: GoogleFonts.kalam(
                        color:const Color(0xff242525),
                      ),
                    ),
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Full Room Price :',
                    style: GoogleFonts.artifika(
                      color: Color(0xff242525),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 115,
                      height: 40,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        controller: controller.fullPriceTextEditingController,
                        //Set text style
                        style: const TextStyle(fontSize: 13),
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Color(0xff242525),
                                  strokeAlign: 0.5),
                              borderRadius: BorderRadius.circular(50)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:const BorderSide(
                                color: Color(0xff242525),
                                width: 1,
                                strokeAlign: 0.5),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
           const SizedBox(
              height: 15,
            ),
            Expanded(
                child: GridView.builder(
                  itemCount: controller.kitchenImages.length,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 3 / 4),
                  itemBuilder: (context, index) => GetBuilder<KitchenController>(
                    builder: (controller) => CustomKitchen(
                      onPressed: () {

                        controller.onPressedBuy(controller.kitchenImages[index].price);
                      },
                      price: controller.kitchenImages[index].price.toString(),
                      image: controller.kitchenImages[index].image,
                    ),
                  ),
                ))
                    ]),
      ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding:const EdgeInsets.only(
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
                    controller.onClickBack(int.parse(arguments["masterController"]['kitchenController']), context);
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
                controller.onClickSubmit(int.parse(arguments["masterController"]['kitchenController']),arguments);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const BedRooms()));
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
