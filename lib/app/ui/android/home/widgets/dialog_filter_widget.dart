import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitee_application/app/controller/controller_dialog.dart';

import 'adaptive_text_size.dart';

class DialogFilterWidget extends StatefulWidget {
  @override
  _DialogFilterWidgetState createState() => _DialogFilterWidgetState();
}

class Tech {
  final String? label;
  final Color? color;
  bool? isSelected;
  Tech(this.label, this.color, this.isSelected);
}

class _DialogFilterWidgetState extends State<DialogFilterWidget> {
  List<Tech>? _chipsListCharacteristics = [
    Tech("Wi - Fi", Colors.grey, false),
    Tech("Projetor", Colors.grey, false),
  ];

  List<Tech>? _chipsListPeople = [
    Tech("2 - 4 Pessoas", Colors.grey, false),
    Tech("4 - 8 Pessoas", Colors.grey, false),
    Tech("8 - 12 Pessoas", Colors.grey, false),
    Tech("12 - 20 Pessoas", Colors.grey, false),
    Tech("20 - 30 Pessoas", Colors.grey, false),
    Tech("30 - 40 Pessoas", Colors.grey, false),
  ];

  @override
  Widget build(BuildContext context) {
    final dialogController = Get.put(ControllerDialog());

    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;

    return AlertDialog(
      title: Container(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Carecterísticas da sala'),
            SizedBox(
              height: height * 1,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Wrap(
                spacing: 10,
                children: techChipsCharacteristics(dialogController),
              )
            ]),
            SizedBox(
              height: height * 3,
            ),
            Text('Quantidade de Pessoas'),
            SizedBox(
              height: height * 1,
            ),
            Container(
              width: width * 35,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      spacing: 10,
                      children: techChipsPeople(dialogController),
                    )
                  ]),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Aplicar'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> techChipsCharacteristics(ControllerDialog dialogController) {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsListCharacteristics!.length; i++) {
      Widget item = Container(
          height: 26,
          child: Obx(() {
            return FilterChip(
              checkmarkColor: Colors.white,
              selectedColor: Color(0xff492e8d),
              visualDensity: VisualDensity.compact,
              label: Text(
                _chipsListCharacteristics![i].label!,
                textAlign: TextAlign.center,
              ),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize:
                      AdaptiveTextSize().getadaptiveTextSize(context, 12)),
              backgroundColor: _chipsListCharacteristics![i].color,
              selected: dialogController.getCharacteristics(i),
              onSelected: (value) {
                dialogController.setCharacteristics(i);
              },
            );
          }));
      chips.add(item);
    }
    return chips;
  }

  List<Widget> techChipsPeople(ControllerDialog dialogController) {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsListPeople!.length; i++) {
      Widget item = Container(
          height: 26,
          child: Obx(() {
            return FilterChip(
              checkmarkColor: Colors.white,
              selectedColor: Color(0xff492e8d),
              visualDensity: VisualDensity.compact,
              label: Text(
                _chipsListPeople![i].label!,
                textAlign: TextAlign.center,
              ),
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize:
                      AdaptiveTextSize().getadaptiveTextSize(context, 12)),
              backgroundColor: _chipsListPeople![i].color,
              selected: dialogController.getPeople(i),
              onSelected: (value) {
                dialogController.setPeople(i);
              },
            );
          }));
      chips.add(item);
    }
    return chips;
  }
}
