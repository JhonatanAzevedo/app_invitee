import 'package:invitee_application/app/data/provider/mock_data_room.dart';

class RoomRepository {

   MockProvider roomProvider = MockProvider();

   fetchDataRoom(){
     return roomProvider.fetchDataRoom();
   }

}