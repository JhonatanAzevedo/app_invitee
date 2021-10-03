import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitee_application/app/controller/home_controller.dart';
import 'package:invitee_application/app/ui/android/home/widgets/room_card_widget.dart';
import 'widgets/adaptive_text_size.dart';
import 'widgets/dialog_filter_widget.dart';

class HomePage extends StatelessWidget {
  final listRoomController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff492e8d),
        title: Text(
          'Invitee',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 1.8),

          //container que tera o texto "encontre sua sala de reuniao e o botao de filtro"
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 7),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 30.0, // tem o efeito de suavizar a sombra
                  spreadRadius: 0.0, // tem o efeito de estender a sombra
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => DialogFilterWidget(),
                );
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Encontre sua sala de reunião',
                        style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 14)),
                      ),
                      Icon(Icons.filter_list),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: height * 2),

          Expanded(
            flex: 1,
            child: GetX<HomeController>(initState: (state) {
              listRoomController.getLisRoom();
            }, builder: (listRoomController) {
              return ListView.builder(
                itemCount: listRoomController.listRoom.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding:  EdgeInsets.only(top: height * 3),
                    child: RoomCards(data: listRoomController.listRoom[index]),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
