import 'package:flutter/material.dart';
import 'package:partenaire/bloc/update-logement-bloc.dart';
import 'package:partenaire/models/biens-model.dart';
import 'package:partenaire/screens/admin-logement/update-bien.dart/recap-logement-update.dart';
import 'package:partenaire/screens/admin-logement/update-bien.dart/update-four.dart';
import 'package:partenaire/screens/admin-logement/update-bien.dart/update-one.dart';
import 'package:partenaire/screens/admin-logement/update-bien.dart/update-three.dart';
import 'package:partenaire/screens/admin-logement/update-bien.dart/update-two.dart';
import 'package:provider/provider.dart';

class UpdateLogementScreen extends StatelessWidget {
  final BiensModels bien;
  const UpdateLogementScreen({super.key, required this.bien});

  @override
  Widget build(BuildContext context) {
    final updateLogementBloc = Provider.of<UpdateLogementBloc>(context);

    return updateLogementBloc.menuUpdate == 0
        ? const UpdateOneLogement()
        : updateLogementBloc.menuUpdate == 1
            ? const UpdateTwoLogement()
            : updateLogementBloc.menuUpdate == 2
                ? const UpdateThreeLogement()
                : updateLogementBloc.menuUpdate == 3
                    ? const UpdateFourLogement()
                    : updateLogementBloc.menuUpdate == 4
                        ? const RecapLogementUpdate()
                        : const Column();
  }
}
