import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-valid-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class PartenaireUtilisateurScreen extends StatefulWidget {
  const PartenaireUtilisateurScreen({super.key});

  @override
  State<PartenaireUtilisateurScreen> createState() =>
      _PartenaireUtilisateurScreenState();
}

class _PartenaireUtilisateurScreenState
    extends State<PartenaireUtilisateurScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final partenaireBloc = Provider.of<PartenaireAdmonBloc>(context);
    final partenaireValidBloc = Provider.of<PartenaireValidBloc>(context);
    final menuBloc = Provider.of<AdminBloc>(context);

    return Column(
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
              'Partenaire > utilisateurs',
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
                      : partenaireBloc.listePartenaire!
                          .where((element) => element.status == "inactive")
                          .toList()
                          .length
                          .toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Suspendu",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!
                          .where((element) => element.status == "canceled")
                          .toList()
                          .length
                          .toString(),
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
        Expanded(
            child: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
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
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: Center(
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: partenaireBloc.selectedService,
                                    onChanged: (newValue) {
                                      setState(() {
                                        // filterBloc.changeTrierPar(newValue!);
                                        state.didChange(newValue);
                                      });
                                      partenaireBloc
                                          .setSelectedService(newValue!);
                                    },
                                    iconSize: 12,
                                    items: partenaireBloc.listeService
                                        .map((String value) {
                                      if (value == "") {
                                        return const DropdownMenuItem<String>(
                                          value: "",
                                          child: Text(
                                            "Tous les services",
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
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: Center(
                          child: FormField<String>(
                            builder: (FormFieldState<String> state) {
                              return InputDecorator(
                                decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: partenaireBloc.selectedStatus,
                                    onChanged: (newValue) {
                                      setState(() {
                                        // filterBloc.changeTrierPar(newValue!);
                                        state.didChange(newValue);
                                      });
                                      partenaireBloc
                                          .setSelectedStatus(newValue!);
                                    },
                                    iconSize: 12,
                                    items: partenaireBloc.listeStatus
                                        .map((String value) {
                                      if (value == "") {
                                        return const DropdownMenuItem<String>(
                                          value: "",
                                          child: Text(
                                            "Tous les status",
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
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    onChanged: (value) => partenaireBloc.setTelSearch(value),
                    decoration: const InputDecoration(
                        labelText: 'Rechercher par numero de telephone'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(flex: 1, child: Text("Service")),
                      Expanded(flex: 1, child: Text("Nom entreprise")),
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
                    Expanded(
                      child: ListView(
                        children: partenaireBloc.listePartenaire!
                            .where((element) =>
                                partenaireBloc.filterListePartenaire(element))
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(width: .5, color: noir)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                            child: Text(
                                          e.service!.toUpperCase(),
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Text(
                                          e.nomEntreprise!,
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Text(
                                          "${e.prenomInterlocuteur!} ${e.nomInterlocuteur!}",
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Text(
                                          e.telephoneInterlocuteur!
                                              .split(" ")
                                              .join("")
                                              .replaceAll("00", "+"),
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Text(
                                          e.localisation!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                partenaireBloc
                                                    .setSelectPartenaire(e);
                                                if (e.status == "active") {
                                                  await partenaireValidBloc
                                                      .getIdentifiant(e.id!);
                                                  menuBloc.setMenu(11);
                                                } else {
                                                  menuBloc.setMenu(10);
                                                }
                                              },
                                              child: Container(
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: jaune)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                              width: 12,
                                            ),
                                            GestureDetector(
                                              onTap: () => dialogRequest(
                                                      context: context,
                                                      title:
                                                          "Voullez-vous suprimer ce partenaire ?")
                                                  .then((value) {
                                                if (value) {
                                                  partenaireBloc
                                                      .deletePartenaireFun(
                                                          e.id!);
                                                }
                                              }),
                                              child: Container(
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: rouge)),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    e.status == "active"
                                                        ? Text(
                                                            "Bloquer",
                                                            style: TextStyle(
                                                                color: rouge,
                                                                fontSize: 10),
                                                          )
                                                        : Text(
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
                                            ),
                                            SizedBox(
                                              width: 32,
                                            ),
                                          ],
                                        )),
                                        SizedBox(
                                          width: 4,
                                        ),
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
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ))
      ],
    );
  }
}
