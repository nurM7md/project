import 'package:dartz/dartz.dart';
import 'package:graduation/controllers/roomsNumbers_controller/room_number_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomRoomsNumbers extends GetView<RoomsNumbersController> {
  const CustomRoomsNumbers(
      {required this.title, required this.textEditingController, super.key});

  final String title;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child:
      Row(
        //mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
            // const TextStyle(
            //   color: Color(0xff242525),
            //   fontWeight: FontWeight.w600,
            //   fontSize: 30,
            //   fontStyle: FontStyle.italic,
            // ),
             GoogleFonts.artifika(
               color: Color(0xff242525),
                 fontWeight: FontWeight.w700,
                 fontSize: 25,
                 fontStyle: FontStyle.italic,
             ),
          ),
          const SizedBox(
            width: 30,
          ),
          Container(
            width: 150,
            height: 65,
            child: TextField(
              controller: textEditingController,
              //Set text style
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2.5,
                          color: Color(0xff242525),
                          strokeAlign: 0.5
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color(0xff242525),
                        width: 1,
                        strokeAlign: 0.5
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                  hintText: "enter number",
                //   hintStyle: TextStyle(
                //     color: Color(0xff242525),
                //     fontFamily: 'Kalam',
                // ) ,
                hintStyle: GoogleFonts.kalam(
                  color: Color(0xff242525),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
