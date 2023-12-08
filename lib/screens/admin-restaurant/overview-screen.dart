import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class OverViewScreenRestaurantAdmin extends StatefulWidget {
  const OverViewScreenRestaurantAdmin({super.key});

  @override
  State<OverViewScreenRestaurantAdmin> createState() =>
      _OverViewScreenRestaurantAdminState();
}

class _OverViewScreenRestaurantAdminState
    extends State<OverViewScreenRestaurantAdmin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);

    return ListView(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            const Text(
              'Overview',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: size.height * .15,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Total commandes",
                  chiffre: adminRestaurantBloc.listeCommandes == null
                      ? "0"
                      : adminRestaurantBloc.listeCommandes!.length.toString(),
                  estimation: "0",
                  description: "vous n'avez pas encore d'activite"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "commande en cours",
                  chiffre: adminRestaurantBloc.listeCommandes == null
                      ? "0"
                      : adminRestaurantBloc.listeCommandes!
                          .where((element) =>
                              element.etatLivraison == "PENDING" ||
                              element.etatLivraison == "PREPARATION")
                          .length
                          .toString(),
                  estimation: "0",
                  description: "vous n'avez pas encore d'activite"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Réservation de table",
                  chiffre:
                      adminRestaurantBloc.listeReservations.length.toString(),
                  estimation: "0",
                  description: "Nombre de réservations est de 12%"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Montants",
                  chiffre: adminRestaurantBloc.listeCommandes == null
                      ? "0 GNF"
                      : getAllMontant(adminRestaurantBloc.listeCommandes!),
                  estimation: "0",
                  description: "vous n'avez pas encore d'activite"),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: size.height * .4,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blanc,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 1,
                              color: noir.withOpacity(.2))
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text('Activité de vente'),
                            Spacer(),
                            Text('Derniers 12 mois'),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(child: Text('+ M ')),
                                Expanded(child: Text('8 M ')),
                                Expanded(child: Text('6 M ')),
                                Expanded(child: Text('4 M ')),
                                Expanded(child: Text('2 M ')),
                                Expanded(child: Text('0 M ')),
                              ],
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          color: gris.withOpacity(.5)),
                                      child: Column(
                                        children: [
                                          Expanded(
                                              flex: 5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200),
                                                ),
                                              )),
                                          Expanded(
                                              flex: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                    color: vertFonce
                                                        .withOpacity(.8)),
                                              )),
                                        ],
                                      ),
                                    )),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Jan',
                                  style: TextStyle(fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                )
                              ],
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Fev',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Mar',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Avr',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Mai',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Jui',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Jul',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Aou',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Sep',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Oct',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Nov',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: gris.withOpacity(.5)),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 0,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              200),
                                                      color: vertFonce
                                                          .withOpacity(.8)),
                                                )),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'Dec',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blanc,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 1,
                              color: noir.withOpacity(.2))
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Chiffre en terme de wallet'),
                            const Spacer(),
                            Container(
                                height: 25,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: vert.withOpacity(.4)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: vert),
                                      child: Center(
                                        child: ImageIcon(
                                          const AssetImage(
                                              "assets/images/evolution.png"),
                                          size: 10,
                                          color: blanc,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text(
                                      "0%",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              "assets/images/deally.png",
                              "assets/images/mtn-logo.png",
                              "assets/images/orange-money.png",
                              "assets/images/paypal.png"
                            ]
                                .map((e) => Expanded(
                                      child: GestureDetector(
                                          // onTap: () => walletSwappeBloc.changeSelectedMoyen(e),
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: size.width * .02,
                                            ),
                                            Image.asset(
                                              e,
                                              width: 50,
                                            ),
                                            SizedBox(
                                              width: size.width * .02,
                                            ),
                                            const Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          "Montant: 000,000,000 FGN ",
                                                          style: TextStyle(
                                                              fontSize: 10)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("0% d'activite"),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Icon(
                                              Icons.add_box_rounded,
                                              color: noir,
                                            ),
                                            SizedBox(
                                              width: size.width * .04,
                                            )
                                          ],
                                        ),
                                      )),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: size.height * .7,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blanc,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 1,
                              color: noir.withOpacity(.2))
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Dernières commandes'),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: Center(
                                child: FormField<String>(
                                  builder: (FormFieldState<String> state) {
                                    return InputDecorator(
                                      decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black))),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: adminRestaurantBloc
                                              .selectedStatus,
                                          onChanged: (newValue) {
                                            setState(() {
                                              state.didChange(newValue);
                                            });
                                            adminRestaurantBloc
                                                .setSelectedStatus(newValue!);
                                          },
                                          iconSize: 12,
                                          items: adminRestaurantBloc.listeStatus
                                              .map((String value) {
                                            if (value == "") {
                                              return const DropdownMenuItem<
                                                  String>(
                                                value: "",
                                                child: Text(
                                                  "Tous les commandes",
                                                ),
                                              );
                                            } else {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                ),
                                              );
                                            }
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                dialogRequestInfo(
                                    context: context,
                                    text1:
                                        "La préparation de la commande est en cours du côté du restaurateur. Une fois préparée, la commande est confiée à l'un de nos livreurs à moto. ",
                                    text2:
                                        "La commande est en cours de livraison par un de nos livreurs.",
                                    text3:
                                        "La livraison a été effectuée avec succès et la commande a été remis au destinataire.");
                              },
                              icon: const Icon(Icons.info),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                width: 90,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: noir)),
                                child: Center(child: Text('Voir tous'))),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(child: Text("N°")),
                                Expanded(child: Text("Montant TTC")),
                                Expanded(child: Text("Date")),
                                Expanded(child: Text("Statut")),
                                Expanded(flex: 3, child: Text("Action")),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Column(
                              // ignore: unnecessary_null_comparison
                              children:
                                  adminRestaurantBloc.listeCommandes == null
                                      ? const [CircularProgressIndicator()]
                                      : adminRestaurantBloc.listeCommandes!
                                          .where((element) =>
                                              (element.etatLivraison ==
                                                  adminRestaurantBloc
                                                      .selectedStatus) ||
                                              adminRestaurantBloc
                                                      .selectedStatus ==
                                                  "")
                                          .map((e) => Container(
                                                color:
                                                    e.etatLivraison == "PENDING"
                                                        ? blanc
                                                        : e.etatLivraison ==
                                                                "PREPARATION"
                                                            ? orange
                                                            : vert,
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
                                                                "${e.reference}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        noir))),
                                                        Expanded(
                                                            child: Text(
                                                                getFormatPrice(e
                                                                    .prixOffre!),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        noir))),
                                                        Expanded(
                                                            child: Text(
                                                                e
                                                                    .dateTransactionSuccess!,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        noir))),
                                                        Expanded(
                                                          child: Text(
                                                              e.etatLivraison!,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: noir)),
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                    child: Center(
                                                                        child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed: () => dialogRequest(
                                                                              context: context,
                                                                              title: "Vous êtes sur de lancer la PREPARATION".toUpperCase())
                                                                          .then((value) async {
                                                                        if (value) {
                                                                          await adminRestaurantBloc.updateStatusCommandePannier(
                                                                              e,
                                                                              "PREPARATION");
                                                                          adminRestaurantBloc
                                                                              .setMenu(0);
                                                                        }
                                                                      }),
                                                                      icon: const ImageIcon(
                                                                          AssetImage(
                                                                              "assets/images/preparion.png")),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                  ],
                                                                ))),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Expanded(
                                                                    child: Center(
                                                                        child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed: () => dialogRequest(
                                                                              context: context,
                                                                              title: "Vous êtes sur de lancer la Livraison".toUpperCase())
                                                                          .then((value) async {
                                                                        if (value) {
                                                                          await adminRestaurantBloc.updateStatusCommandePannier(
                                                                              e,
                                                                              "LIVRAISON");
                                                                          adminRestaurantBloc
                                                                              .setMenu(0);
                                                                        }
                                                                      }),
                                                                      icon: const ImageIcon(
                                                                          AssetImage(
                                                                              "assets/images/livraison.png")),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                  ],
                                                                ))),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Expanded(
                                                                    child: Center(
                                                                        child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        adminRestaurantBloc
                                                                            .setSelectedCommande(e);
                                                                        adminRestaurantBloc
                                                                            .setMenu(13);
                                                                      },
                                                                      icon: const Icon(
                                                                          CupertinoIcons
                                                                              .eye_solid),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                  ],
                                                                ))),
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
                        )),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
      ],
    );
  }
}
