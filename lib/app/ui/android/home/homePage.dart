import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invitee_application/app/design_system/widgets/room_cards_widget/room_card_widget.dart';

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
  String? newValue;
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
                    onChanged: (newValue) {
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
                    ].map<DropdownMenuItem<String>>((value) {
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
                return RoomCards(data: data![i]);
              },
              separatorBuilder: (_, __) {
                return SizedBox(height: height * 3);
              },
              itemCount: data!.length,
              shrinkWrap: true,
            ),
          ),
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
          onSelected: (value) {
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
          image: 'salaA1',
          title: 'Sala de Reunião A3',
          local: 'Av.Paulista 500 - São Paulo',
          busula: 'Leste',
          amountPeople: '8-12 Pessoas',
          time: '8:00 - 9:00',
          money: 'R\$90',
          day: '10/novembro',
          details: [
            'Wi-fi',
            'Projetor',
            '8-12 Pessoas',
          ]),
      RoomCard(
          image: 'salaA2',
          title: 'Sala de Reunião A3',
          local: 'Av.Paulista 500 - São Paulo',
          busula: 'Leste',
          amountPeople: '8-12 Pessoas',
          time: '8:00 - 9:00',
          money: 'R\$90',
          day: '10/novembro',
          details: [
            'Wi-fi',
            'Projetor',
            '8-12 Pessoas',
          ]),
      RoomCard(
          image: 'salaA3',
          title: 'Sala de Reunião A3',
          local: 'Av.Paulista 500 - São Paulo',
          busula: 'Leste',
          amountPeople: '8-12 Pessoas',
          time: '8:00 - 9:00',
          money: 'R\$90',
          day: '10/novembro',
          details: [
            'Wi-fi',
            'Projetor',
            '8-12 Pessoas',
          ]),
    ];

    setState(() {});
  }
}

class RoomCard {
  final String? image;
  final String? title;
  final String? local;
  final String? busula;
  final String? amountPeople;
  final String? time;
  final String? money;
  final String? day;

  final List<String>? details;

  RoomCard({
    this.image,
    this.title,
    this.local,
    this.busula,
    this.amountPeople,
    this.time,
    this.money,
    this.day,
    this.details,
  });
}
