import 'package:graduation/features/departements/presentations/pages/roomsNumbers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:graduation/features/departements/presentations/pages/masterRoom.dart';
// import 'package:graduation/features/departements/presentations/pages/bedRooms.dart';
// import 'package:graduation/features/departements/presentations/pages/kidsRoom.dart';
// import 'package:graduation/features/departements/presentations/pages/bathRoom.dart';
// import 'package:graduation/features/departements/presentations/pages/kitchen.dart';
// import 'package:graduation/features/departements/presentations/pages/salon.dart';
//import 'package:graduation/features/departements/presentations/pages/fullUntPrice.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme:const TextTheme(
          displayLarge: TextStyle(
            color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      getPages: [
        GetPage(name: '/', page: () => const RoomsNumbers()),
       // GetPage(name: '/', page: () => const MasterRoom()),
        // GetPage(name: '/', page: () => const BedRooms()),
        //GetPage(name: '/', page: () => const KidsRoom()),
        //GetPage(name: '/', page: () => const BathRoom()),
        //GetPage(name: '/', page: () => const Salon()),
        //GetPage(name: '/', page: () => const FullUnitPrice()),

      ],
      );

  }
}