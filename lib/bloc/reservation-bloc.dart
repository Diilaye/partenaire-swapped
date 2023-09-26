import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    print("updateStatusReservation");
    print(result);
    if (result != null) {
      menuReservation = 0;
      getAllReservation();
      notifyListeners();
    }
  }

  ReservationModel? addReserve;

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

  bool chargementAdd = false;

  addReservation(String id) async {
    chargementAdd = true;
    notifyListeners();
    Map<String, dynamic> body = {
      "bien": id,
      "dateDebut": debut,
      "dateFin": fin,
      "nomComplet": nomComplet.text,
      "telephone": tel.text,
    };

    addReserve = await reservationService.add(body);

    if (addReserve != null) {
      Fluttertoast.showToast(
          msg: "Réservation ajouté avec réussite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #2E8C1F, #2E8C1F)",
          fontSize: 14.0);
      resetData();
    } else {
      Fluttertoast.showToast(
          msg: "Une erreur a été saisie",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #9D0208, #9D0208)",
          fontSize: 14.0);
    }

    chargementAdd = false;
    notifyListeners();
  }

  resetData() {
    dateDebut.text = "";
    dateFin.text = "";
    nomComplet.text = "";
    tel.text = "";
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

    if (textMessage.text.isNotEmpty) {
      String? result = await messageService.add(body);

      if (result != null) {
        MessageModel message = MessageModel(
            id: "1", statusSender: 'partenaire', text: textMessage.text);
        selectedReservation!.messages!.add(message);

        textMessage.text = "";

        notifyListeners();
      }
    }
  }

  DateTime? rangeStart;
  DateTime? rangeEnd;
  DateTime? selectedDay = DateTime.now();
  DateTime? focusDay = DateTime.now();

  TextEditingController nomComplet = TextEditingController();
  TextEditingController tel = TextEditingController();

  TextEditingController dateDebut = TextEditingController();
  DateTime? debut;
  TextEditingController dateFin = TextEditingController();
  DateTime? fin;

  setDateDebut(DateTime? value) {
    debut = value;
    dateDebut.text =
        value!.toString().split(" ")[0].split("-").reversed.join("-");
    notifyListeners();
  }

  setDateFin(DateTime? value) {
    fin = value;
    dateFin.text =
        value!.toString().split(" ")[0].split("-").reversed.join("-");

    notifyListeners();
  }

  selectedRangeDate(DateTime? start, DateTime? end) {
    selectedDay = null;
    rangeEnd = end;
    rangeStart = start;

    setDateDebut(start);

    setDateFin(end);

    notifyListeners();
  }

  onDaySelected(DateTime focus) {
    selectedDay = focus;
    notifyListeners();
  }
}
