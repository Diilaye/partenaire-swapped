import 'package:flutter/material.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/screens/admin-logement/add-bien/add-four.dart';
import 'package:partenaire/screens/admin-logement/add-bien/add-one.dart';
import 'package:partenaire/screens/admin-logement/add-bien/add-three.dart';
import 'package:partenaire/screens/admin-logement/add-bien/add-two.dart';
import 'package:partenaire/screens/admin-logement/add-bien/recap-logement.dart';
import 'package:provider/provider.dart';

class AddLogementScreen extends StatelessWidget {
  const AddLogementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addLogementBloc = Provider.of<AddLogementBloc>(context);

    return addLogementBloc.menuAdd == 0
        ? const AddOneLogement()
        : addLogementBloc.menuAdd == 1
            ? const AddTwoLogement()
            : addLogementBloc.menuAdd == 2
                ? const AddThreeLogement()
                : addLogementBloc.menuAdd == 3
                    ? const AddFourLogement()
                    : const RecapLogement();
  }
}
