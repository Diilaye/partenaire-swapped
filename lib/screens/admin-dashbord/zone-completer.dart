import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/zone-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class ZoneCompleterScreen extends StatelessWidget {
  const ZoneCompleterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final zoneBloc = Provider.of<ZoneBloc>(context);
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
              'Partenaire > completer zone ',
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
                      Text('Completer zone'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => menuBloc.setMenu(8),
                        child: SizedBox(
                          width: 120,
                          height: 40,
                          child: Center(child: Text("retour")),
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
                  Expanded(
                    child: ListView(
                      children: zoneBloc.zone!.subZone!.map((e) {
                        var i = zoneBloc.zone!.subZone!.indexOf(e);

                        return Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                // width: size.width * .9,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  controller: zoneBloc.tabTitleT[i],
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                      labelText: 'titre',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      focusColor: Colors.black,
                                      fillColor: Colors.black,
                                      border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: SizedBox(
                                // width: size.width * .9,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  controller: zoneBloc.tabPrixT[i],
                                  decoration: const InputDecoration(
                                      labelText: 'Prix ',
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                      focusColor: Colors.black,
                                      fillColor: Colors.black,
                                      border: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black))),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await zoneBloc.completerZone();

                          menuBloc.setMenu(8);
                        },
                        child: Container(
                          height: 50,
                          width: 240,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 2,
                                    color: Colors.white.withOpacity(.2))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              zoneBloc.chargement
                                  ? CircularProgressIndicator(
                                      backgroundColor: noir,
                                      color: blanc,
                                    )
                                  : Text(
                                      "Completer",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
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
