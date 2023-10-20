import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/add-offre-special-bloc.dart';
import 'package:partenaire/screens/admin-restaurant/add-offre-special/add-offre.dart';
import 'package:partenaire/screens/admin-restaurant/add-offre-special/view-offre.dart';
import 'package:provider/provider.dart';

class AddOffreScreen extends StatelessWidget {
  const AddOffreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addOffreSpecialBloc = Provider.of<AddOffreSpecialBloc>(context);

    return addOffreSpecialBloc.addMenu == 0
        ? const AddOffreSpecial()
        : addOffreSpecialBloc.addMenu == 1
            ? const ViewOffresScreen()
            : const Column();
  }
}
