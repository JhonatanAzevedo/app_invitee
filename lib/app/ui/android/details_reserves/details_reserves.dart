import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitee_application/app/ui/android/home/widgets/types_checks_widgt.dart';

class DetailsReserves extends StatefulWidget {
  @override
  _DetailsReservesState createState() => _DetailsReservesState();
}

class _DetailsReservesState extends State<DetailsReserves> {
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
    bool isReunion = data['reunion'];

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 1),
              child: Text(
                'Suas Reservas',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 3),
            Container(
              width: width * 100,
              height: height * 23,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 8),
                    child: Container(
                      height: height * 15,
                      width: width * 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/$image.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 3),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              '$title',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: height * 0.2),
                          Container(
                              child: isReunion
                                  ? Text('Reserva do tipo reunião',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start)
                                  : Text('Reserva do tipo estação',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start),
                                      ),
                          SizedBox(height: height * 0.2),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Color(0xff492e8d)),
                              Container(
                                child: Text('$local',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.2),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 16, color: Color(0xff492e8d)),
                              Container(
                                child: Text('$day',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.2),
                          Row(
                            children: [
                              Icon(Icons.access_alarms_sharp,
                                  size: 16, color: Color(0xff492e8d)),
                              Container(
                                child: Text('$time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.2),
                          Container(
                            child: Text('$money',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),

                          SizedBox(height: height * 1),

                          Row(
                            children: [
                              //Botao de Check-in
                              TypeChecks(
                                  name: 'Check-in',
                                  title: 'Deseja confirma o Check-in?',
                                  snackbarTitle:
                                      'Check-in realizado com sucesso'),

                              SizedBox(width: width * 4),
                              
                              //Botao de Check-out
                              TypeChecks(
                                name: 'Check-out',
                                title: 'Deseja confirma o Check-out?',
                                snackbarTitle:
                                    'Check-out realizado com sucesso',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff492e8d),
        child: Icon(Icons.add),
        onPressed: () {
          Get.offNamed('/');
        },
      ),
    );
  }
}
