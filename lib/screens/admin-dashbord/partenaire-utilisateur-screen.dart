import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class PartenaireUtilisateurScreen extends StatelessWidget {
  const PartenaireUtilisateurScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final partenaireBloc = Provider.of<PartenaireAdmonBloc>(context);
    final menuBloc = Provider.of<AdminBloc>(context);

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
              'Partenaire > utilusateurs',
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
                  title: "Total utilisateur",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!.length.toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Utilisateur en attente",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!.length.toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Suspendu",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!.length.toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
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
          height: size.height * .76,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
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
                        SizedBox(
                          width: 8,
                        ),
                        Text('Liste des partenaires'),
                        const Spacer(),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                            // width: 90,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: noir)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 4,
                                  ),
                                  const Text('Tous services'),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_down_circle,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                            )),
                        const Spacer(),
                        Container(
                            // width: 90,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: noir)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 4,
                                  ),
                                  const Text('Tous les status'),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_down_circle,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(flex: 1, child: Text("Service")),
                                Expanded(
                                    flex: 1, child: Text("Nom entreprise")),
                                Expanded(child: Text("Nom complet")),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Téléphone"),
                                      ],
                                    ),
                                  ],
                                )),
                                Expanded(child: Text("Localisation")),
                                Expanded(child: Text("Date rv")),
                                Expanded(child: Text("Actions")),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            if (partenaireBloc.listePartenaire != null)
                              Column(
                                children: partenaireBloc.listePartenaire!
                                    .map((e) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  e.service!.toUpperCase(),
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  e.nomEntreprise!,
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  "${e.prenomInterlocuteur!} ${e.nomInterlocuteur!}",
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  e.telephoneInterlocuteur!
                                                      .split(" ")
                                                      .join("")
                                                      .replaceAll("00", "+"),
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  e.localisation!,
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  "${e.dateRv} à ${e.heureRv}",
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        partenaireBloc
                                                            .setSelectPartenaire(
                                                                e);
                                                        menuBloc.setMenu(10);
                                                      },
                                                      child: Container(
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            border: Border.all(
                                                                color: jaune)),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "Voir",
                                                              style: TextStyle(
                                                                  color: jaune,
                                                                  fontSize: 10),
                                                            ),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          border: Border.all(
                                                              color: rouge)),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            "Supprimer",
                                                            style: TextStyle(
                                                                color: rouge,
                                                                fontSize: 10),
                                                          ),
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              )
                          ],
                        )),
                        const SizedBox(
                          width: 8,
                        ),
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
        )
      ],
    );
  }
}
