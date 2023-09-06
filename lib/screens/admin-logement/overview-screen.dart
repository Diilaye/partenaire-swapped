import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class OverViewScreenLogementAdmin extends StatelessWidget {
  const OverViewScreenLogementAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final logementAdminBloc = Provider.of<AdminPartenaireBloc>(context);

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
                  title: "Total articles",
                  chiffre: logementAdminBloc.listeBien.length.toString(),
                  estimation: "2",
                  description: "vous avez fait un ajout de 3 bien ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              const overviewStatWidget(
                  title: "Total reservations",
                  chiffre: "11",
                  estimation: "2",
                  description: "vous avez fait un ajout de 3 bien ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              const overviewStatWidget(
                  title: "Montants",
                  chiffre: "105,865,000 FGN",
                  estimation: "70",
                  description: "vous avez fait 10,000,000 FGN  ce mois ci"),
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
                                              flex: 3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200),
                                                ),
                                              )),
                                          Expanded(
                                              flex: 2,
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
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 2,
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
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 4,
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
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
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
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 2,
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
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 4,
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
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
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
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 2,
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
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 4,
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
                                                flex: 2,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 3,
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
                                                flex: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 2,
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
                                                flex: 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 4,
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
                                      "6%",
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
                                                          "Montant: 654,900,000 FGN ",
                                                          style: TextStyle(
                                                              fontSize: 10)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          "une évolution de 10%"),
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
                                Expanded(child: Text("N° cmd")),
                                Expanded(
                                    flex: 2, child: Text("Détails produit")),
                                Expanded(child: Text("Montant")),
                                Expanded(child: Text("Date")),
                                Expanded(child: Text("Statut")),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                  6,
                                  (index) => Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                  child: Text("#12345",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                      "Hambourger Bambou",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Text("150,000",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Text("29-08-2023",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color:
                                                                  vertFonce)),
                                                      child: Center(
                                                          child: Text(
                                                        "Expédié",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: vertFonce),
                                                      )))),
                                              SizedBox(
                                                width: 16,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                  child: Text("#12345",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                      "Hambourger Bambou",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Text("150,000",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Text("29-08-2023",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: jaune)),
                                                      child: Center(
                                                          child: Text(
                                                        "En attente",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: jaune),
                                                      )))),
                                              SizedBox(
                                                width: 16,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                  child: Text("#12345",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                      "Hambourger Bambou",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Text("150,000",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Text("29-08-2023",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: noir))),
                                              Expanded(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                              color: rouge)),
                                                      child: Center(
                                                          child: Text(
                                                        "Annulé",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: rouge),
                                                      )))),
                                              SizedBox(
                                                width: 16,
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                            )
                          ],
                        )),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              // SizedBox(
              //   width: size.width * .01,
              // ),
              // Expanded(
              //     flex: 2,
              //     child: Column(
              //       children: [
              //         Expanded(
              //             flex: 2,
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(8),
              //                   color: blanc,
              //                   boxShadow: [
              //                     BoxShadow(
              //                         offset: const Offset(0, 0),
              //                         blurRadius: 1,
              //                         color: noir.withOpacity(.2))
              //                   ]),
              //               child: Column(
              //                 children: [
              //                   const SizedBox(
              //                     height: 8,
              //                   ),
              //                   Row(
              //                     children: [
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                       Text('Réclamations'),
              //                       const Spacer(),
              //                       Text('Voir +'),
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                     ],
              //                   ),
              //                   Expanded(
              //                       child: Row(
              //                     children: [
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                       Expanded(
              //                         child: Row(
              //                           children: [
              //                             Expanded(
              //                                 flex: 4,
              //                                 child: CircularChartReclamation(
              //                                   color: vertFonce,
              //                                 )),
              //                             Expanded(
              //                               flex: 2,
              //                               child: Column(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment.center,
              //                                 children: [
              //                                   Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       Icon(
              //                                         Icons.square,
              //                                         color:
              //                                             noir.withOpacity(.4),
              //                                       ),
              //                                       SizedBox(
              //                                         width: 8,
              //                                       ),
              //                                       Text('30%')
              //                                     ],
              //                                   ),
              //                                   SizedBox(
              //                                     height: 16,
              //                                   ),
              //                                   Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.center,
              //                                     children: [
              //                                       Icon(
              //                                         Icons.square,
              //                                         color: vertFonce,
              //                                       ),
              //                                       SizedBox(
              //                                         width: 8,
              //                                       ),
              //                                       Text('70%')
              //                                     ],
              //                                   ),
              //                                 ],
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                     ],
              //                   )),
              //                   const SizedBox(
              //                     height: 8,
              //                   ),
              //                 ],
              //               ),
              //             )),
              //         SizedBox(
              //           height: size.height * .01,
              //         ),
              //         Expanded(
              //             flex: 3,
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(8),
              //                   color: blanc,
              //                   boxShadow: [
              //                     BoxShadow(
              //                         offset: const Offset(0, 0),
              //                         blurRadius: 1,
              //                         color: noir.withOpacity(.2))
              //                   ]),
              //               child: Column(
              //                 children: [
              //                   const SizedBox(
              //                     height: 8,
              //                   ),
              //                   Row(
              //                     children: [
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                       Text('Top partenaires'),
              //                       const Spacer(),
              //                       Text('Voir +'),
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                     ],
              //                   ),
              //                   const SizedBox(
              //                     height: 8,
              //                   ),
              //                   Expanded(
              //                       child: Row(
              //                     children: [
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                       Expanded(
              //                           child: Column(
              //                         children: [
              //                           Row(
              //                             children: [
              //                               SizedBox(
              //                                 width: 4,
              //                               ),
              //                               Expanded(
              //                                   flex: 2, child: Text("Nom")),
              //                               Expanded(
              //                                   child: Row(
              //                                 children: [
              //                                   Text("Montant"),
              //                                 ],
              //                               )),
              //                               Expanded(
              //                                   child: Row(
              //                                 children: [
              //                                   const Spacer(),
              //                                   Text("%"),
              //                                 ],
              //                               )),
              //                               SizedBox(
              //                                 width: 4,
              //                               ),
              //                             ],
              //                           ),
              //                           SizedBox(
              //                             height: 8,
              //                           ),
              //                           Column(
              //                             children: List.generate(
              //                                 4,
              //                                 (index) => Column(
              //                                       children: [
              //                                         Row(
              //                                           children: [
              //                                             SizedBox(
              //                                               width: 4,
              //                                             ),
              //                                             Expanded(
              //                                                 flex: 2,
              //                                                 child: Text(
              //                                                   "Restaurant Le Bambou",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 )),
              //                                             Expanded(
              //                                                 child: Row(
              //                                               children: [
              //                                                 Text(
              //                                                   "150,000,000",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 ),
              //                                               ],
              //                                             )),
              //                                             Expanded(
              //                                                 child: Row(
              //                                               children: [
              //                                                 const Spacer(),
              //                                                 Text(
              //                                                   "12%",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 ),
              //                                               ],
              //                                             )),
              //                                             SizedBox(
              //                                               width: 4,
              //                                             ),
              //                                           ],
              //                                         ),
              //                                         SizedBox(
              //                                           height: 8,
              //                                         ),
              //                                         Row(
              //                                           children: [
              //                                             SizedBox(
              //                                               width: 4,
              //                                             ),
              //                                             Expanded(
              //                                                 flex: 2,
              //                                                 child: Text(
              //                                                   "Hôtel Milinium",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 )),
              //                                             Expanded(
              //                                                 child: Row(
              //                                               children: [
              //                                                 Text(
              //                                                   "120,000,000",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 ),
              //                                               ],
              //                                             )),
              //                                             Expanded(
              //                                                 child: Row(
              //                                               children: [
              //                                                 const Spacer(),
              //                                                 Text(
              //                                                   "10%",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 ),
              //                                               ],
              //                                             )),
              //                                             SizedBox(
              //                                               width: 4,
              //                                             ),
              //                                           ],
              //                                         ),
              //                                         SizedBox(
              //                                           height: 8,
              //                                         ),
              //                                         Row(
              //                                           children: [
              //                                             SizedBox(
              //                                               width: 4,
              //                                             ),
              //                                             Expanded(
              //                                                 flex: 2,
              //                                                 child: Text(
              //                                                   "Immo Tapi",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 )),
              //                                             Expanded(
              //                                                 child: Row(
              //                                               children: [
              //                                                 Text(
              //                                                   "30,000,000",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 ),
              //                                               ],
              //                                             )),
              //                                             Expanded(
              //                                                 child: Row(
              //                                               children: [
              //                                                 const Spacer(),
              //                                                 Text(
              //                                                   "19%",
              //                                                   style: TextStyle(
              //                                                       color: noir,
              //                                                       fontSize:
              //                                                           10),
              //                                                 ),
              //                                               ],
              //                                             )),
              //                                             SizedBox(
              //                                               width: 4,
              //                                             ),
              //                                           ],
              //                                         ),
              //                                         SizedBox(
              //                                           height: 8,
              //                                         ),
              //                                       ],
              //                                     )),
              //                           )
              //                         ],
              //                       )),
              //                       SizedBox(
              //                         width: 8,
              //                       ),
              //                     ],
              //                   )),
              //                   const SizedBox(
              //                     height: 8,
              //                   ),
              //                 ],
              //               ),
              //             )),
              //       ],
              //     )),
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
