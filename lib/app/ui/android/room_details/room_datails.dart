import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitee_application/app/ui/android/home/widgets/adaptive_text_size.dart';

class RoomDetails extends StatelessWidget {
  const RoomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    Map? data = ModalRoute.of(context)!.settings.arguments as Map?;
    String image = data!['image'];
    String title = data['title'];
    String local = data['local'];
    String time = data['time'];
    String money = data['money'];
    String day = data['day'];

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff492e8d),
        title: Text(
          'Invitee',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tras a imagem de qual sala que foi escolhida.
            Container(
              width: width * 100,
              height: height * 38,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/$image.jpg'),
                    fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: height * 1),
            //tras o titulo de qual sala que foi escolhida.
            Container(
              child: Text(
                '$title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),

            SizedBox(height: height * 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, size: 16, color: Color(0xff492e8d)),
                Container(
                  //tras o local de qual sala que foi escolhida.
                  child: Text(
                    '$local',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today, size: 16, color: Color(0xff492e8d)),
                Container(
                  child: Text('$day',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            SizedBox(height: height * 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_alarms_sharp,
                    size: 16, color: Color(0xff492e8d)),

                //tras o horario disponivel da sala que foi escolhida.
                Container(
                  child: Text('$time',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            SizedBox(height: height * 1),

            //tras o valor da sala que foi escolhida.
            Container(
              child: Text('$money',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),

            SizedBox(height: height * 3),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Selecione o tipo de reserva:',
                style: TextStyle(
                  fontSize:
                      AdaptiveTextSize().getadaptiveTextSize(context, 20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: height * 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text('Reunião',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9e7be2))),
                    ),
                    SizedBox(height: height * 2),
                    InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: Text(
                                  'Deseja reservar está sala para reunião?',
                                  style: TextStyle(
                                    fontSize: width * 5,
                                  ),
                                ),
                                actions: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text('Não'),
                                        ),
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.offNamed('/detail_reserves',
                                                arguments: {
                                                  'image': image,
                                                  'title': title,
                                                  'local': local,
                                                  'time': time,
                                                  'money': money,
                                                  'day': day,
                                                  'reunion': true,
                                                });
                                          },
                                          child: Text('Sim'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: height * 13,
                        width: width * 23,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius:
                                  30.0, // tem o efeito de suavizar a sombra
                              spreadRadius:
                                  0.0, // tem o efeito de estender a sombra
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/reuniao.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: width * 3),
                Column(
                  children: [
                    Container(
                      child: Text('Estação de Trabalho',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9e7be2))),
                    ),
                    SizedBox(height: height * 2),
                    InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(
                            'Deseja reservar está sala para estação de trabalho?',
                            style: TextStyle(
                              fontSize: width * 5,
                            ),
                          ),
                          actions: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text('Não'),
                                  ),
                                ),
                                Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.offNamed('/detail_reserves',
                                          arguments: {
                                            'image': image,
                                            'title': title,
                                            'local': local,
                                            'time': time,
                                            'money': money,
                                            'day': day,
                                            'reunion': false,
                                          });
                                    },
                                    child: Text('Sim'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: height * 13,
                        width: width * 23,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius:
                                  30.0, // tem o efeito de suavizar a sombra
                              spreadRadius:
                                  0.0, // tem o efeito de estender a sombra
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/estacao_trabalho.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff492e8d),
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offNamed('/');
        },
      ),
    );
  }
}
