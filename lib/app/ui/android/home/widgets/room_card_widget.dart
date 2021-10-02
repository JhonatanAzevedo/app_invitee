import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitee_application/app/data/repositories/repository_room_card.dart';

import 'adaptive_text_size.dart';

class RoomCards extends StatelessWidget {
  final RoomCard data;

  const RoomCards({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    return RawMaterialButton(
      onPressed: () {
        Get.toNamed('/room_details', arguments: {
          'image': data.image,
          'title': data.title,
          'local': data.local,
          'time': data.time,
          'money': data.money,
          'day': data.day,
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 7),
        height: height * 35,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30.0, // tem o efeito de suavizar a sombra
              spreadRadius: 0.0, // tem o efeito de estender a sombra
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height * 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7), topRight: Radius.circular(7)),
                image: DecorationImage(
                    image: AssetImage('assets/images/${data.image}.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: height * 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 2),
                  child: Container(
                    child: Text(
                      data.title!,
                      style: TextStyle(
                          fontSize: AdaptiveTextSize()
                              .getadaptiveTextSize(context, 13),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(width: width * 20),
                Container(
                  height: height * 3,
                  width: width * 20,
                  decoration: BoxDecoration(
                      color: Color(0xff492e8d),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      data.busula!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            AdaptiveTextSize().getadaptiveTextSize(context, 10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 2),
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Color(0xff492e8d)),
                Container(
                  child: Text(
                    data.local!,
                    style: TextStyle(
                      fontSize:
                          AdaptiveTextSize().getadaptiveTextSize(context, 12),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(),
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: data.details!.length,
                  itemBuilder: (_, index) {
                    return Container(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: data.details![index],
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 12)),
                          ),
                          TextSpan(
                            text: ' / ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: AdaptiveTextSize()
                                    .getadaptiveTextSize(context, 12),
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
