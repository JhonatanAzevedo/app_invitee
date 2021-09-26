import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff492e8d),
        title: Text(
          'Invitee',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Image(
              image: AssetImage('assets/images/$image.jpg'),
            ),
          ),
          SizedBox(height: height * 1),
          Container(
            child: Text(
              '$title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          SizedBox(
            height: height * 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 16, color: Color(0xff492e8d)),
              Container(
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
              Icon(Icons.access_alarms_sharp, size: 16, color: Color(0xff492e8d)),
              Container(
                child: Text('$time',style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),

          SizedBox(height: height * 1),

          Container(
            child: Text('$money', style: TextStyle(fontWeight: FontWeight.bold,)) ,
          ),

          SizedBox(height: height * 3),
          Padding(
            padding: EdgeInsets.only(left: width * 8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selecione o tipo de reserva:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: height * 1),

          Padding(
            padding:  EdgeInsets.only(left: width * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text('Reunião', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff9e7be2))),
                    ),

                    SizedBox(height: height * 2),
                    
                    Container(
                      alignment: Alignment.centerLeft,
                      height: height * 13,
                      width: width * 23,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/reuniao.png'),
                              fit: BoxFit.cover),
                              ),
                    ),
                  ],
                ),

                SizedBox(width: width * 3),

                Column(
                  children: [
                    Container(
                      child: Text('Estação de Trabalho', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff9e7be2))),
                    ),

                    SizedBox(height: height * 2),
                    
                    Container(
                      alignment: Alignment.centerLeft,
                      height: height * 13,
                      width: width * 23,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/estacao_trabalho.png'),
                              fit: BoxFit.cover),
                              ),
                    ),
                  ],
                ),




              ], 

            ),
          )
        ],
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
