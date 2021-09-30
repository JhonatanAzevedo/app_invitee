import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Tech {
  final String? label;
  final Color? color;
  bool? isSelected;
  Tech(this.label, this.color, this.isSelected);
}

class _HomePageState extends State<HomePage> {
  List<RoomCard>? data;

  late String valueChoose = 'Defina a quantidade de pessoas';

  bool selected = false;
  List<Tech>? _chipsList = [
    Tech("Wi-fi", Colors.grey, false),
    Tech("Projetor", Colors.grey, false),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    changeData();

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
          Expanded(
            flex: 1,
            child: Container(
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

                  // Chips do Filtro
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width * 1),
                        child: Wrap(
                          spacing: 10,
                          direction: Axis.horizontal,
                          children: techChips(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Aplicar filtro',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(primary: Colors.purple),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: height * 2),

          Expanded(
              flex: 4,
              child: ListView.separated(
                itemBuilder: (_, i) {
                  return roomCard(data![i], height, width);
                },
                separatorBuilder: (_, __) {
                  return SizedBox(height: height * 3);
                },
                itemCount: data!.length,
                shrinkWrap: true,
              )),
        ],
      ),
    );
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList!.length; i++) {
      Widget item = Container(
        height: 26,
        child: FilterChip(
          checkmarkColor: Colors.white,
          selectedColor: Color(0xff492e8d),
          visualDensity: VisualDensity.compact,
          label: Text(
            _chipsList![i].label!,
            textAlign: TextAlign.center,
          ),
          labelStyle: TextStyle(color: Colors.white, fontSize: 11),
          backgroundColor: _chipsList![i].color,
          selected: _chipsList![i].isSelected!,
          onSelected: (bool value) {
            setState(() {
              _chipsList![i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  changeData() {
    data = [
      RoomCard(
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
      ),
      RoomCard(
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
      ),
      RoomCard(
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
      ),
    ];

    setState(() {});
  }
}

//Este widget contrói todas as salas passando por atributos.
Widget roomCard(
  RoomCard data,
  double height,
  double width,
) {
  return InkWell(
    onTap: () => Get.toNamed('/room_details', arguments: {
      'image': data.image,
      'title': data.title,
      'local': data.local,
      'time': data.time,
      'money': data.money,
      'day': data.day,
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
                  data.local!,
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
                        text: data.detail1,
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    TextSpan(
                        text: ' / ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: data.detail2,
                        style: TextStyle(color: Colors.purple, fontSize: 11)),
                    TextSpan(
                        text: ' / ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: data.detail3,
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

class RoomCard {
  final String? image;
  final String? title;
  final String? local;
  final String? detail1;
  final String? busula;
  final String? detail2;
  final String? detail3;
  final String? time;
  final String? money;
  final String? day;

  RoomCard(
    this.image,
    this.title,
    this.local,
    this.detail1,
    this.busula,
    this.detail2,
    this.detail3,
    this.time,
    this.money,
    this.day,
  );
}
