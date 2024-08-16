import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/decaissement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class DecaissementUpdateScreen extends StatefulWidget {
  const DecaissementUpdateScreen({super.key});

  @override
  State<DecaissementUpdateScreen> createState() =>
      _DecaissementUpdateScreenState();
}

class _DecaissementUpdateScreenState extends State<DecaissementUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              'Partenaire > modifier decaissement',
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
                      Text('Modifier decaissement'),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => menuBloc.setMenu(9),
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
                  SizedBox(
                    width: size.width * .9,
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: decaissementBloc.titileT,
                      decoration: const InputDecoration(
                          labelText: 'Titre decaissement',
                          labelStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          fillColor: Colors.black,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: decaissementBloc.minPriceT,
                      decoration: const InputDecoration(
                          labelText: 'Prix minimum decaissement',
                          labelStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          fillColor: Colors.black,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: size.width * .9,
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: decaissementBloc.maxPriceT,
                      decoration: const InputDecoration(
                          labelText: 'Prix maximum decaissement',
                          labelStyle: TextStyle(color: Colors.black),
                          focusColor: Colors.black,
                          fillColor: Colors.black,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
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
                          // partenaireBloc.setAddPartenaire();

                          await decaissementBloc.updateDecaissement();

                          menuBloc.setMenu(9);
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
                              decaissementBloc.chargement
                                  ? CircularProgressIndicator(
                                      backgroundColor: noir,
                                      color: blanc,
                                    )
                                  : Text(
                                      "Modifier",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
