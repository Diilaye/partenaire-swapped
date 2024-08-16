import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/decaissement-bloc.dart';
import 'package:partenaire/bloc/zone-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';

class DecaissementScreen extends StatefulWidget {
  const DecaissementScreen({super.key});

  @override
  State<DecaissementScreen> createState() => _DecaissementScreenState();
}

class _DecaissementScreenState extends State<DecaissementScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final zoneBloc = Provider.of<ZoneBloc>(context);
    final decaissementBloc = Provider.of<DecaissementBloc>(context);
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
              'Partenaire > decaissement',
              style: TextStyle(fontSize: 16),
            ),
          ],
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
                      Text('Liste des decaissement'),
                      const Spacer(),
                      // SizedBox(
                      //   width: 8,
                      // ),
                      // SizedBox(
                      //   width: 150,
                      //   height: 40,
                      //   child: Center(
                      //     child: FormField<String>(
                      //       builder: (FormFieldState<String> state) {
                      //         return InputDecorator(
                      //           decoration: const InputDecoration(
                      //               border: UnderlineInputBorder(
                      //                   borderSide:
                      //                       BorderSide(color: Colors.black))),
                      //           child: DropdownButtonHideUnderline(
                      //             child: DropdownButton<String>(
                      //               value: partenaireBloc.selectedService,
                      //               onChanged: (newValue) {
                      //                 setState(() {
                      //                   // filterBloc.changeTrierPar(newValue!);
                      //                   state.didChange(newValue);
                      //                 });
                      //                 partenaireBloc
                      //                     .setSelectedService(newValue!);
                      //               },
                      //               iconSize: 12,
                      //               items: partenaireBloc.listeService
                      //                   .map((String value) {
                      //                 if (value == "") {
                      //                   return const DropdownMenuItem<String>(
                      //                     value: "",
                      //                     child: Text(
                      //                       "Tous les services",
                      //                     ),
                      //                   );
                      //                 } else {
                      //                   return DropdownMenuItem<String>(
                      //                     value: value,
                      //                     child: Text(
                      //                       value,
                      //                     ),
                      //                   );
                      //                 }
                      //               }).toList(),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // const Spacer(),
                      GestureDetector(
                        onTap: () => menuBloc.setMenu(90),
                        child: SizedBox(
                          // width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Text("Ajouter decaissement"),
                              SizedBox(
                                width: 16,
                              ),
                            ],
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
                    onChanged: (value) => decaissementBloc.setTitre(value),
                    decoration: const InputDecoration(
                        labelText: 'Rechercher par tittre '),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(flex: 1, child: Text("Titre")),
                      Expanded(flex: 1, child: Text("Prix minimunm")),
                      Expanded(child: Text("Prix maximum")),
                      Expanded(child: Text("Actions")),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  if (zoneBloc.zones != null)
                    Expanded(
                      child: ListView(
                        children: decaissementBloc.decaissements!
                            .where((element) => element.title!
                                .toLowerCase()
                                .contains(decaissementBloc.titre.toLowerCase()))
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
                                          e.title!.toUpperCase(),
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Text(
                                          e.minPrice!.toString(),
                                          style: TextStyle(
                                              color: noir, fontSize: 10),
                                        )),
                                        Expanded(
                                            child: Text(
                                          e.maxPrice!.toString(),
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
                                                decaissementBloc.getOne(e);
                                                menuBloc.setMenu(91);
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
                                                      "Modifier",
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
                                                          "Voullez-vous suprimer ce decaissement ?")
                                                  .then((value) {
                                                if (value) {
                                                  decaissementBloc
                                                      .delete(e.id!);
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
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      "Suprimer",
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
