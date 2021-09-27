import 'package:get/get.dart';
import 'package:invitee_application/app/routes/app_routes.dart';
import 'package:invitee_application/app/ui/android/home/homePage.dart';
import 'package:invitee_application/app/ui/android/room_details/room_datails.dart';
import 'package:invitee_application/app/ui/details_reserves/details_reserves.dart';

class AppPages {

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.ROOM_DETAILS, page: () => RoomDetails()),
    GetPage(name: Routes.DETAILS_RESERVES, page: () => DetailsReserves())
  ];
  
}