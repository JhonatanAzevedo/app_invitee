import 'package:invitee_application/app/data/repositories/repository_room_card.dart';

List<RoomCard>? data;
changeData() {
  data = [
    RoomCard(
        image: 'salaA1',
        title: 'Sala de Reunião A1',
        local: 'Av.Paulista 500 - São Paulo',
        busula: 'Leste',
        amountPeople: '2-4 Pessoas',
        time: '10:00 - 12:00',
        money: 'R\$90',
        day: '10/novembro',
        details: [
          'Wi-fi',
          'Projetor',
          '8-12 Pessoas',
        ]),
    RoomCard(
        image: 'salaA2',
        title: 'Sala de Reunião A2',
        local: 'Av.Paulista 500 - São Paulo',
        busula: 'Leste',
        amountPeople: '8-12 Pessoas',
        time: '13:00 - 14:30',
        money: 'R\$190',
        day: '06/outubro',
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
        amountPeople: '12-20 Pessoas',
        time: '8:00 - 9:00',
        money: 'R\$110',
        day: '18/novembro',
        details: [
          'Wi-fi',
          'Projetor',
          '8-12 Pessoas',
        ]),
  ];
}
