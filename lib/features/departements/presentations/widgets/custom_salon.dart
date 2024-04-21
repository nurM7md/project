import 'package:dartz/dartz.dart';
import 'package:graduation/controllers/roomsNumbers_controller/salon_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/core/resources/asset_managers5.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomSalon extends GetView<SalonController> {
  const CustomSalon({
    super.key,
    required this.price,
    required this.image,
    required this.onPressed,
  });

  final String price;
  final String image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // CircleAvatar(backgroundImage: AssetImage(image),radius: ),
            Container(
              decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {

              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff242525),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                height: 50,
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price :',
                      style: GoogleFonts.artifika(
                        color: Color(0xff242525),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff242525),
                      ),
                    ),
                    Text(
                      'L.E',
                      style: GoogleFonts.artifika(
                        color: Color(0xff242525),
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: onPressed,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff242525),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                height: 50,
                width: 150,
                child: Text(
                  'Buy',
                  style: GoogleFonts.artifika(
                    color: Color(0xff242525),
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
