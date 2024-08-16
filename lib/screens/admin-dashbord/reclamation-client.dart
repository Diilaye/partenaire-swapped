import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/reclamation-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class ReclamationsClientScreen extends StatefulWidget {
  const ReclamationsClientScreen({super.key});

  @override
  State<ReclamationsClientScreen> createState() =>
      _ReclamationsClientScreenState();
}

class _ReclamationsClientScreenState extends State<ReclamationsClientScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final reclamationBloc = Provider.of<ReclamationBloc>(context);
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
              'Reclamations > client',
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
                  title: "Total reclations",
                  chiffre: reclamationBloc.reclamations.length.toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Reclamations en attente",
                  chiffre: reclamationBloc.reclamations
                      .where((e) => e.statusReclamation == 'pending')
                      .toList()
                      .length
                      .toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Traitées",
                  chiffre: reclamationBloc.reclamations
                      .where((e) => e.statusReclamation == 'finish')
                      .toList()
                      .length
                      .toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Critiques",
                  chiffre: reclamationBloc.reclamations
                      .where((e) =>
                          e.statusReclamation == 'pending' &&
                          e.niveauReclamations != 'Loup')
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
                      Text('Liste des reclamations'.toUpperCase()),
                      const Spacer(),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 200,
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
                                    value: reclamationBloc.selectedService,
                                    onChanged: (newValue) {
                                      setState(() {
                                        // filterBloc.changeTrierPar(newValue!);
                                        state.didChange(newValue);
                                      });
                                      reclamationBloc
                                          .setSelectedService(newValue!);
                                    },
                                    iconSize: 12,
                                    items: reclamationBloc.listeService
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
                                            value == 'restaurant'
                                                ? 'Livraison repas'
                                                : value,
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
                        width: 200,
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
                                    value: reclamationBloc.selectedStatus,
                                    onChanged: (newValue) {
                                      setState(() {
                                        // filterBloc.changeTrierPar(newValue!);
                                        state.didChange(newValue);
                                      });
                                      reclamationBloc
                                          .setSelectedStatus(newValue!);
                                    },
                                    iconSize: 12,
                                    items: reclamationBloc.listeStatus
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
                                            value == 'pending'
                                                ? 'En attente'
                                                : value == 'call-client'
                                                    ? 'En cour de traitement'
                                                    : 'Traitée',
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
                    onChanged: (value) => reclamationBloc.setTelSearch(value),
                    decoration: InputDecoration(
                        labelText:
                            'Rechercher par numero de ticket'.toUpperCase()),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(flex: 1, child: Text("n° ticket".toUpperCase())),
                      Expanded(flex: 1, child: Text("Service".toUpperCase())),
                      Expanded(flex: 1, child: Text("Type".toUpperCase())),
                      Expanded(child: Text("Nom complet".toUpperCase())),
                      Expanded(
                        child: Text("Téléphone".toUpperCase()),
                      ),
                      Expanded(child: Text("Niveau".toUpperCase())),
                      Expanded(child: Text("status".toUpperCase())),
                      Expanded(child: Text("Actions".toUpperCase())),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView(
                      children: reclamationBloc.reclamations
                          .where((element) =>
                              reclamationBloc.filterListeReclamation(element))
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(width: .5, color: noir)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                          child: Text(
                                        e.ticketReclamation!.toUpperCase(),
                                        style: TextStyle(
                                            color: noir, fontSize: 10),
                                      )),
                                      Expanded(
                                          child: Text(
                                        e.typeService!.toUpperCase(),
                                        style: TextStyle(
                                            color: noir, fontSize: 10),
                                      )),
                                      Expanded(
                                          child: Text(
                                        e.type!.toUpperCase(),
                                        style: TextStyle(
                                            color: noir, fontSize: 10),
                                      )),
                                      Expanded(
                                          child: Text(
                                        "${e.obect!.client!.prenom!} ${e.obect!.client!.nom!}"
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: noir, fontSize: 10),
                                      )),
                                      Expanded(
                                          child: Text(
                                        e.obect!.client!.telephone!
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: noir, fontSize: 10),
                                      )),
                                      Expanded(
                                          child: Text(
                                        e.niveauReclamations!.toUpperCase(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: noir, fontSize: 10),
                                      )),
                                      Expanded(
                                          child: Text(
                                        e.statusReclamation!.toUpperCase(),
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
                                              await reclamationBloc
                                                  .setReclamationSelected(e);
                                              if (reclamationBloc
                                                      .reclamationSelected !=
                                                  null) {
                                                menuBloc.setMenu(13);
                                              }
                                            },
                                            child: Container(
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border:
                                                      Border.all(color: jaune)),
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
                  ),
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
