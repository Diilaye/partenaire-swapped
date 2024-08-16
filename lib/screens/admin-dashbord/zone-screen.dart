import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-valid-bloc.dart';
import 'package:partenaire/bloc/zone-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class ZoneScreen extends StatefulWidget {
  const ZoneScreen({super.key});

  @override
  State<ZoneScreen> createState() => _ZoneScreenState();
}

class _ZoneScreenState extends State<ZoneScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final zoneBloc = Provider.of<ZoneBloc>(context);
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
              'Partenaire > zone',
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
                      Text('Liste des zone'),
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
                        onTap: () => menuBloc.setMenu(80),
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: Center(child: Text("Ajouter zone")),
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
                    onChanged: (value) => zoneBloc.setDepart(value),
                    decoration: const InputDecoration(
                        labelText: 'Rechercher par zone '),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(flex: 1, child: Text("Zone")),
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
                        children: zoneBloc.zones!
                            .where((element) => element.title!
                                .toLowerCase()
                                .contains(zoneBloc.depart.toLowerCase()))
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
                                            child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                zoneBloc.getOne(e);
                                                menuBloc.setMenu(82);
                                              },
                                              child: Container(
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: noir)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      "Completer",
                                                      style: TextStyle(
                                                          color: noir,
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
                                            GestureDetector(
                                              onTap: () async {
                                                zoneBloc.getOne(e);
                                                menuBloc.setMenu(81);
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
                                              width: 32,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                zoneBloc.getOneSubZone(e);
                                                menuBloc.setMenu(83);
                                              },
                                              child: Container(
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    border: Border.all(
                                                        color: vert)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Text(
                                                      "Ajout manuel",
                                                      style: TextStyle(
                                                          color: vert,
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
                                            GestureDetector(
                                              onTap: () => dialogRequest(
                                                      context: context,
                                                      title:
                                                          "Voullez-vous suprimer cette zone ?")
                                                  .then((value) {
                                                if (value) {
                                                  zoneBloc.delete(e.id!);
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
