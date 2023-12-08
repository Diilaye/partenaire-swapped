import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/bloc/reservation-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class OverViewScreenLogementAdmin extends StatelessWidget {
  const OverViewScreenLogementAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final logementAdminBloc = Provider.of<AdminPartenaireBloc>(context);
    final reservationBloc = Provider.of<ReservationBloc>(context);

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
                  title: "Total logements",
                  chiffre: logementAdminBloc.listeBien.length.toString(),
                  estimation: "0",
                  description: "vous n'avez pas encore d'activite"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Total reservations",
                  chiffre: reservationBloc.reservations.length.toString(),
                  estimation: "0",
                  description: "vous n'avez pas encore d'activite"),
              SizedBox(
                width: size.width * .01,
              ),
              const overviewStatWidget(
                  title: "Montants",
                  chiffre: "0 GNF",
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
                            const Text('Dernières réservations'),
                            const Spacer(),
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
                                Expanded(flex: 2, child: Text("Nom")),
                                Expanded(child: Text("Montant")),
                                Expanded(child: Text("Date debut")),
                                Expanded(child: Text("Date fin")),
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
                              children: reservationBloc.reservations.isEmpty
                                  ? const [CircularProgressIndicator()]
                                  : reservationBloc.reservations
                                      .map((e) => Container(
                                            color:
                                                e.status == 'accept-partenaire'
                                                    ? vert.withOpacity(.2)
                                                    : e.status ==
                                                            'create-partenaire'
                                                        ? meuveClair
                                                        : blanc,
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
                                                            "#${e.id!.substring(0, 6)}",
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: noir))),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                            e.bien!.titre!,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: noir))),
                                                    Expanded(
                                                        child: Text(
                                                            getFormatPrice(e
                                                                    .bien!
                                                                    .tarif! *
                                                                DateTime.parse(e
                                                                        .dateFin!)
                                                                    .difference(
                                                                        DateTime.parse(e
                                                                            .dateDebut!))
                                                                    .inDays),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: noir))),
                                                    Expanded(
                                                        child: Text(
                                                            e.dateDebut!
                                                                .split("T")
                                                                .first
                                                                .split("-")
                                                                .reversed
                                                                .join("-"),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: noir))),
                                                    Expanded(
                                                        child: Text(
                                                            e.dateFin!
                                                                .split("T")
                                                                .first
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
                                                                color: e.status! ==
                                                                        "create"
                                                                    ? orange
                                                                    : vertFonce,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                border: Border.all(
                                                                    color: e.status! ==
                                                                            "create"
                                                                        ? orange
                                                                        : vertFonce)),
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
                                                            // Expanded(
                                                            //     child: Center(
                                                            //   child: IconButton(
                                                            //     onPressed: () => reservationBloc
                                                            //         .selectedRangeDate(
                                                            //             DateTime.parse(e
                                                            //                 .dateDebut!),
                                                            //             DateTime.parse(
                                                            //                 e.dateFin!)),
                                                            //     icon: Icon(
                                                            //       CupertinoIcons
                                                            //           .calendar,
                                                            //       color: noir,
                                                            //     ),
                                                            //   ),
                                                            // )),
                                                            // const SizedBox(
                                                            //   width: 8,
                                                            // ),
                                                            Expanded(
                                                                child: Center(
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    if (e.prospect ==
                                                                        null) {
                                                                      logementAdminBloc
                                                                          .setMenu(
                                                                              4);
                                                                      reservationBloc
                                                                          .setSelectedReservation(
                                                                              e);
                                                                    }
                                                                  },
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .eye_fill,
                                                                    color:
                                                                        jaune,
                                                                  )),
                                                            )),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            Expanded(
                                                                child: Center(
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .checkmark,
                                                                color: vert,
                                                              ),
                                                            )),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Expanded(
                                                                child: Center(
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .delete,
                                                                color: rouge,
                                                              ),
                                                            )),
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
