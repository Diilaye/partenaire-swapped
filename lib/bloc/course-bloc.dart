import 'package:flutter/material.dart';
import 'package:partenaire/models/course-model.dart';
import 'package:partenaire/models/depense-model.dart';
import 'package:partenaire/services/course-service.dart';

class CoursesAdminBloc with ChangeNotifier {
  CourseService courseService = CourseService();

  List<CourseModel> courses = [];

  List<DepenseDashbordModel> livarisons = [];

  DepenseDashbordModel? fiche;

  setFiche(DepenseDashbordModel? f) {
    fiche = f;
    notifyListeners();
  }

  TextEditingController dateFin = TextEditingController();
  TextEditingController dateDebut = TextEditingController();

  setDateFin(DateTime? value) {
    dateFin.text =
        value!.toString().split(" ")[0].split("-").reversed.join("-");

    notifyListeners();
  }

  setDateDebut(DateTime? value) {
    dateDebut.text =
        value!.toString().split(" ")[0].split("-").reversed.join("-");

    notifyListeners();
  }

  getAllCourses() async {
    courses = await courseService.all();
    notifyListeners();
  }

  getLivraison() async {
    DateTime dF = DateTime.now();
    DateTime dD = dF.subtract(const Duration(days: 15));
    livarisons = await courseService.allLivraison(
        dD.toString().split(" ").first.split("-").reversed.join("-"),
        dF.toString().split(" ").first.split("-").reversed.join("-"));
    notifyListeners();
  }

  bool chargementLivraison = false;

  getLivraisonDate() async {
    chargementLivraison = true;
    livarisons = [];
    notifyListeners();
    livarisons = await courseService.allLivraison(dateDebut.text, dateFin.text);
    chargementLivraison = false;
    notifyListeners();
  }

  CoursesAdminBloc() {
    getLivraison();
    getAllCourses();
  }
}
