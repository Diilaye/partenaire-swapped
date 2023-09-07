import 'package:flutter/material.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:table_calendar/table_calendar.dart';

class ListeReservation extends StatelessWidget {
  const ListeReservation({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        TableCalendar(
          locale: 'fr_FR',
          startingDayOfWeek: StartingDayOfWeek.monday,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
        SizedBox(height: size.height * .02),
        SizedBox(
          height: size.height * .5,
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
                                  0,
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
      ],
    );
  }
}
