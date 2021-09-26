import 'package:get/get.dart';
import 'package:invitee_application/app/routes/app_routes.dart';
import 'package:invitee_application/app/ui/android/home/homePage.dart';
import 'package:invitee_application/app/ui/android/room_details/room_datails.dart';

class AppPages {

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.ROOM_DETAILS, page: () => RoomDetails())

  ];
  
}