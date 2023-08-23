import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/partenaire-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final partenaireBloc = Provider.of<PartenairesBloc>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: .0,
          elevation: .0,
        ),
        body: Stack(
          children: [
            Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage("assets/images/bg.jpeg"),
                        fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: .0, sigmaY: .0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                )),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black.withOpacity(.1),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        height: 30,
                        width: 120,
                        decoration: BoxDecoration(
                            color: blanc,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 0),
                                  color: noir.withOpacity(.3),
                                  blurRadius: 1)
                            ]),
                        child: const Center(
                          child: Text('Se connecter'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  if (partenaireBloc.addPartenaire == 0)
                    SizedBox(
                      height: size.height * .45,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logement, Mobilité et transport avec SwapeD'
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * .03,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Se sentir chez soit, ou Que je soi'.toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * .02,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => partenaireBloc.setAddPartenaire(),
                        child: Container(
                          height: 50,
                          width: 240,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(.2))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Être partenaire',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
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
                  if (partenaireBloc.addPartenaire == 1)
                    Container(
                      width: size.width * .95,
                      color: blanc,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: 'Nom de l\'entreprise',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: SizedBox(
                              height: 60,
                              width: size.width * .9,
                              child: FormField<String>(
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: "Type de service proposé",
                                        onChanged: (newValue) {
                                          setState(() {
                                            // filterBloc.changeTrierPar(newValue!);
                                            state.didChange(newValue);
                                          });
                                        },
                                        iconSize: 12,
                                        items: [
                                          "Type de service proposé",
                                          "Logement",
                                          "Mobilité",
                                          "Restaurant"
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: 'Présentation de l\'entreprise',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: 'Nom de l\'interlocteur',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: 'Prénom de l\'interlocteur',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: 'N° de Tel de l\'interlocteur',
                                  hintText: '+224 000 00 00 00',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  labelText: 'Descriptif de l\'entreprise',
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              readOnly: true,
                              decoration: InputDecoration(
                                  labelText:
                                      "2 photos (Hotels, Villa ou restaurant vu de l'extérieur )",
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * .05,
                              ),
                              Container(
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
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Cliquer pour"),
                                    Text("télécharger"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Container(
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
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Cliquer pour"),
                                    Text("télécharger"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  labelText:
                                      "Descriptif du service ( 3 à 5 phrases)",
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              readOnly: true,
                              decoration: InputDecoration(
                                  labelText:
                                      "3 photos (chambre vu de l'interieur ou menu)",
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * .05,
                              ),
                              Container(
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
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Cliquer pour"),
                                    Text("télécharger"),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Container(
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
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Cliquer pour"),
                                    Text("télécharger"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: size.width * .9,
                            child: const TextField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: 'Geolocalisation ou localisation',
                                  suffixIcon: const Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(end: 12.0),
                                    child: Icon(CupertinoIcons
                                        .compass), // myIcon is a 48px-wide widget.
                                  ),
                                  labelStyle: TextStyle(color: Colors.black),
                                  focusColor: Colors.black,
                                  fillColor: Colors.black,
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black))),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .05,
                              ),
                              SizedBox(
                                width: size.width * .9,
                                child: TextField(
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                      labelText:
                                          'Date et heure de rendez-vous souhaité',
                                      border: UnderlineInputBorder()),
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            locale: const Locale("fr", "FR"),
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2022),
                                            lastDate: DateTime(2030))
                                        .then((value) {
                                      print(value);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => partenaireBloc.setAddPartenaire(),
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
                                      Text(
                                        "S'enregister",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ));
  }
}
