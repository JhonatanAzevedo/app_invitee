import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Tech {
  String label;
  Color color;
  bool isSelected;
  Tech(this.label, this.color, this.isSelected);
}

class _HomePageState extends State<HomePage> {
  late String valueChoose = 'Defina a quantidade de pessoas';

  bool selected = false;
  List<Tech> _chipsList = [
    Tech("Wi-fi", Colors.grey, false),
    Tech("Projetor", Colors.grey, false),
  ];

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 1.8),

            //container que tera o texto "encontre sua sala de reuniao e o botao de filtro"
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 7),
              height: height * 12,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 30.0, // tem o efeito de suavizar a sombra
                    spreadRadius: 0.0, // tem o efeito de estender a sombra

                    /*      offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ), */
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  DropdownButton<String>(
                    icon: const Icon(
                      Icons.filter_list,
                    ),
                    value: valueChoose,
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChoose = newValue!;
                      });
                    },
                    items: <String>[
                      'Defina a quantidade de pessoas',
                      '2 - 4 Pessoas',
                      '4 - 8 Pessoas',
                      '8 - 12 Pessoas',
                      '12 - 20 Pessoas',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 1),
                        child: Wrap(
                          spacing: 10,
                          direction: Axis.horizontal,
                          children: techChips(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 3),

            roomCard(
                'salaA1',
                'Sala de Reunião A1',
                'Av.Paulista 500 - São Paulo',
                'Wi-fi',
                'Leste',
                'Quadro',
                'Projetor',
                '15:30 - 16:00',
                'R\$80',
                '17/Setembro',
                height,
                width),

            SizedBox(height: height * 3),

            roomCard(
                'salaA2',
                'Sala de Reunião A2',
                'Av.Paulista 500 - São Paulo',
                'Wi-fi',
                'Leste',
                'Televisão',
                'Ar-Condicionador',
                '14:00 - 17:00',
                'R\$100',
                '25/Novembro',
                height,
                width),

            SizedBox(height: height * 3),

            roomCard(
                'salaA3',
                'Sala de Reunião A3',
                'Av.Paulista 500 - São Paulo',
                'Wi-fi',
                'Leste',
                'Televisão',
                'Ar-Condicionador',
                '8:00 - 9:00',
                'R\$90',
                '10/novembro',
                height,
                width),
            SizedBox(height: height * 3),
          ],
        ),
      ),
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Container(
        height: 26,
        child: FilterChip(
          checkmarkColor: Colors.white,
          selectedColor: Color(0xff492e8d),
          visualDensity: VisualDensity.compact,
          label: Text(
            _chipsList[i].label,
            textAlign: TextAlign.center,
          ),
          labelStyle: TextStyle(color: Colors.white, fontSize: 11),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

//Este widget contrói todas as salas passando por atributos.
Widget roomCard(
  String image,
  String title,
  String local,
  String detail1,
  String busula,
  String detail2,
  String detail3,
  String time,
  String money,
  String day,
  double height,
  double width,
) {
  return InkWell(
    onTap: () => Get.toNamed('/room_details', arguments: {
      'image': image,
      'title': title,
      'local': local,
      'time': time,
      'money': money,
      'day': day,
    }),
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
                  image: AssetImage('assets/images/$image.jpg'),
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
                    title,
                    style: TextStyle(
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
                    busula,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
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
                  local,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: detail1,
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    TextSpan(
                        text: ' / ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: detail2,
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    TextSpan(
                        text: ' / ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: detail3,
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    TextSpan(
                        text: ' / ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
