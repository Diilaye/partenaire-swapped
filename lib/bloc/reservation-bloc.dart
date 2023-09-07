import 'package:flutter/material.dart';
import 'package:partenaire/models/reservation-model.dart';
import 'package:partenaire/services/reservation-service.dart';

class ReservationBloc with ChangeNotifier {
  ReservationService reservationService = ReservationService();

  List<ReservationModel> reservations = [];

  getAllReservation() async {
    reservations = await reservationService.all();
    notifyListeners();
  }

  ReservationBloc() {
    getAllReservation();
  }
}
