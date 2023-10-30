import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';

class ListeReservationRestaurantScreen extends StatelessWidget {
  const ListeReservationRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);

    return Column(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              'Liste des reservations'.toUpperCase(),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Expanded(
            child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: blanc,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(blurRadius: .3, color: noir.withOpacity(.2))
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(child: Text("N°")),
                        Expanded(flex: 2, child: Text("Nom Client")),
                        Expanded(child: Text("Téléphone")),
                        Expanded(child: Text("Crénaux ")),
                        Expanded(child: Text("Date ")),
                        Expanded(child: Text("Statut")),
                        Expanded(flex: 2, child: Text("Action")),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: adminRestaurantBloc.listeReservations
                          .map((e) => Container(
                                color: blanc,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            child: Text(
                                                "${e.id!.substring(0, 6)}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: noir))),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                "${e.client!.prenom} ${e.client!.nom} ",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: noir))),
                                        Expanded(
                                            child: Text(
                                                "${e.client!.telephone}",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: noir))),
                                        Expanded(
                                            child: Text(e.creneaux!,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: noir))),
                                        Expanded(
                                            child: Text(
                                                e.date!
                                                    .split("T")[0]
                                                    .split("-")
                                                    .reversed
                                                    .join("-"),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: noir))),
                                        Expanded(
                                            child: Center(
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: e.statusRes == 'active'
                                                      ? orange
                                                      : e.statusRes ==
                                                              'valide-restaurant'
                                                          ? vertFonce
                                                          : rouge,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                            ],
                                          ),
                                        )),
                                        Expanded(
                                            flex: 2,
                                            child: Row(
                                              children: [
                                                Center(
                                                  child: IconButton(
                                                    onPressed: () => dialogRequest(
                                                            context: context,
                                                            title:
                                                                "Vous voullez vraimment valider cette réservation ? ")
                                                        .then((value) {
                                                      if (value) {
                                                        adminRestaurantBloc
                                                            .validReservation(
                                                                e.id!);
                                                      }
                                                    }),
                                                    icon: Icon(
                                                      CupertinoIcons.checkmark,
                                                      color: vert,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 24,
                                                ),
                                                Center(
                                                  child: IconButton(
                                                    onPressed: () => dialogRequest(
                                                            context: context,
                                                            title:
                                                                'Vous voullez vraimment annuler cette réservation ? ')
                                                        .then((value) {
                                                      if (value) {
                                                        adminRestaurantBloc
                                                            .anullerReservation(
                                                                e.id!);
                                                      }
                                                    }),
                                                    icon: Icon(
                                                      CupertinoIcons.delete,
                                                      color: rouge,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          width: 16,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        )),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
