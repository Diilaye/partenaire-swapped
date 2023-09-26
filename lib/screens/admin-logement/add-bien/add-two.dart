import 'package:flutter/material.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class AddTwoLogement extends StatelessWidget {
  const AddTwoLogement({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addLogementBloc = Provider.of<AddLogementBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            'AMEUBLEMENT DE VOTRE LOGEMENT ',
            style: TextStyle(fontSize: 28),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    Text('Chambres'.toUpperCase()),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: addLogementBloc.chambreCommodites
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => addLogementBloc
                                    .setSelectedChambreCommodite(e),
                                child: Container(
                                  height: 120,
                                  width: 120,
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
                                      SizedBox(
                                        height: 8,
                                      ),
                                      if (addLogementBloc
                                          .selectedChambreCommodite
                                          .contains(e))
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: noir),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            )
                                          ],
                                        ),
                                      Expanded(
                                          flex: 3,
                                          child:
                                              Image.asset(e['url'] as String)),
                                      Text(e['titre'] as String,
                                          textAlign: TextAlign.center),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            )),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    Text('Salon'.toUpperCase()),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: addLogementBloc.salonCommodites
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () =>
                                  addLogementBloc.setSelectedSalonCommodite(e),
                              child: Container(
                                height: 120,
                                width: 120,
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
                                    SizedBox(
                                      height: 8,
                                    ),
                                    if (addLogementBloc.selectedSalonCommodite
                                        .contains(e))
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: noir),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          )
                                        ],
                                      ),
                                    Expanded(
                                        flex: 3,
                                        child: Image.asset(e['url'] as String)),
                                    Text(e['titre'] as String,
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            )),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    Text('Cuisine'.toUpperCase()),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: addLogementBloc.cuisineCommodites
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => addLogementBloc
                                  .setSelectedCuisineCommodite(e),
                              child: Container(
                                height: 120,
                                width: 120,
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
                                    SizedBox(
                                      height: 8,
                                    ),
                                    if (addLogementBloc.selectedCuisineCommodite
                                        .contains(e))
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: noir),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          )
                                        ],
                                      ),
                                    Expanded(
                                        flex: 3,
                                        child: Image.asset(e['url'] as String)),
                                    Text(e['titre'] as String,
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            )),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    Text('Salle de bain'.toUpperCase()),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: addLogementBloc.salleDeBainCommodites
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => addLogementBloc
                                  .setSelectedSalleDeBainCommodite(e),
                              child: Container(
                                height: 120,
                                width: 120,
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
                                    SizedBox(
                                      height: 8,
                                    ),
                                    if (addLogementBloc
                                        .selectedSalleDeBainCommodite
                                        .contains(e))
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: noir),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          )
                                        ],
                                      ),
                                    Expanded(
                                        flex: 3,
                                        child: Image.asset(e['url'] as String)),
                                    Text(e['titre'] as String,
                                        textAlign: TextAlign.center),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            )),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => addLogementBloc.changeMenuAdd(0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: noir),
                    color: blanc),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'étape precedent'.toUpperCase(),
                      style: TextStyle(color: noir),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * .05,
            ),
            GestureDetector(
              onTap: () => addLogementBloc.changeMenuAdd(2),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: noir),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'étape suivante'.toUpperCase(),
                      style: TextStyle(color: blanc),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
      ],
    );
  }
}
