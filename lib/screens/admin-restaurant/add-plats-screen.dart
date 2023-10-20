import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/add-plats-restaurant-bloc.dart';
import 'package:partenaire/screens/admin-restaurant/add-plats/add-one.dart';
import 'package:partenaire/screens/admin-restaurant/add-plats/view-plat.dart';
import 'package:provider/provider.dart';

class AddPlatsScreen extends StatelessWidget {
  const AddPlatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addPlatRestaurantBloc = Provider.of<AddPlatRestaurantBloc>(context);

    return addPlatRestaurantBloc.menuAdd == 0
        ? const AddOnePlats()
        : addPlatRestaurantBloc.menuAdd == 1
            ? const ViewPlatScreen()
            : const Column();
  }
}
