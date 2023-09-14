import 'package:flutter/material.dart';
import 'package:partenaire/models/message-model.dart';
import 'package:partenaire/models/reservation-model.dart';
import 'package:partenaire/services/message-service.dart';
import 'package:partenaire/services/reservation-service.dart';

class ReservationBloc with ChangeNotifier {
  ReservationService reservationService = ReservationService();

  MessageService messageService = MessageService();

  int menuReservation = 0;

  setMenuReservation(int menu) {
    menuReservation = menu;
    notifyListeners();
  }

  updateStatusReservation(String id) async {
    Map<String, dynamic> body = {"status": "accept-partenaire"};

    String? result = await reservationService.update(id, body);

    if (result != null) {
      menuReservation = 0;
      getAllReservation();
    }
  }

  List<ReservationModel> reservations = [];
  ReservationModel? selectedReservation;

  setSelectedReservation(ReservationModel? select) {
    selectedReservation = select;
    menuReservation = 1;
    notifyListeners();
  }

  getAllReservation() async {
    reservations = await reservationService.all();
    notifyListeners();
  }

  ReservationBloc() {
    getAllReservation();
  }

  TextEditingController textMessage = TextEditingController();

  addMessage() async {
    Map<String, dynamic> body = {
      "text": textMessage.text,
      "reservation": selectedReservation!.id!,
      "statusSender": "partenaire"
    };

    print(body);

    String? result = await messageService.add(body);

    if (result != null) {
      MessageModel message = MessageModel(
          id: "1", statusSender: 'partenaire', text: textMessage.text);
      selectedReservation!.messages!.add(message);

      textMessage.text = "";

      notifyListeners();
    }

    print(result);
  }

  DateTime? rangeStart;
  DateTime? rangeEnd;
  DateTime? selectedDay = DateTime.now();
  DateTime? focusDay = DateTime.now();

  selectedRangeDate(DateTime? start, DateTime? end) {
    selectedDay = null;
    rangeEnd = end;
    rangeStart = start;
    notifyListeners();
  }

  onDaySelected(DateTime focus) {
    selectedDay = focus;
    notifyListeners();
  }
}
