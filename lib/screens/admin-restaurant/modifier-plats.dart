import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/add-plats-restaurant-bloc.dart';
import 'package:partenaire/screens/admin-restaurant/update-plats/update-one.dart';
import 'package:partenaire/screens/admin-restaurant/update-plats/view-update-plat.dart';
import 'package:provider/provider.dart';

class UpdatePlatsScreen extends StatelessWidget {
  const UpdatePlatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addPlatRestaurantBloc = Provider.of<AddPlatRestaurantBloc>(context);

    return addPlatRestaurantBloc.menuAdd == 0
        ? const UpdateOnePlats()
        : addPlatRestaurantBloc.menuAdd == 1
            ? const ViewUpdatePlatScreen()
            : const Column();
  }
}
