import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/partenaire-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/show-date-by-dii.dart';
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
        body: partenaireBloc.partenaireModel == null
            ? Stack(
                children: [
                  Container(
                      height: size.height,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("assets/images/bg.jpeg"),
                              fit: BoxFit.cover)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: .0, sigmaY: .0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      )),
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.black.withOpacity(.1),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.popAndPushNamed(context, "/login"),
                              child: Container(
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
                            ),
                            const SizedBox(
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
                              'Logement, Restauration et Mobilité  avec SwapeD'
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: size.width * .03,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Se sentir chez soit, ou Que je soi'
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: size.width * .02,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
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
                                child: const Row(
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
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: partenaireBloc.nomEnreprise,
                                    decoration: const InputDecoration(
                                        labelText: 'Nom de l\'entreprise',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
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
                                          decoration: const InputDecoration(
                                              border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black))),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: partenaireBloc
                                                  .selectedService,
                                              onChanged: (newValue) {
                                                setState(() {
                                                  // filterBloc.changeTrierPar(newValue!);
                                                  state.didChange(newValue);
                                                });
                                                partenaireBloc
                                                    .setSelectedService(
                                                        newValue!);
                                              },
                                              iconSize: 12,
                                              items: partenaireBloc.listeService
                                                  .map((String value) {
                                                if (value == "") {
                                                  return const DropdownMenuItem<
                                                      String>(
                                                    value: "",
                                                    child: Text(
                                                      "Type de service proposé",
                                                    ),
                                                  );
                                                } else {
                                                  return DropdownMenuItem<
                                                      String>(
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
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: size.width * .9,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller:
                                        partenaireBloc.descriptifEnreprise,
                                    decoration: const InputDecoration(
                                        labelText:
                                            'Présentation de l\'entreprise',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: size.width * .9,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: partenaireBloc
                                        .nomInterlocuteurEnreprise,
                                    decoration: const InputDecoration(
                                        labelText: 'Nom de l\'interlocteur',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: size.width * .9,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: partenaireBloc
                                        .prenomInterlocuteurEnreprise,
                                    decoration: const InputDecoration(
                                        labelText: 'Prénom de l\'interlocteur',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: size.width * .9,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: partenaireBloc
                                        .telephoneInterlocuteurEnreprise,
                                    decoration: const InputDecoration(
                                        labelText:
                                            'N° de Tel de l\'interlocteur',
                                        hintText: '+224 000 00 00 00',
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 8,
                                // ),
                                // SizedBox(
                                //   width: size.width * .9,
                                //   child: TextField(
                                //     cursorColor: Colors.black,
                                //     controller:
                                //         partenaireBloc.descriptifEnreprise,
                                //     maxLines: 3,
                                //     decoration: const InputDecoration(
                                //         labelText:
                                //             'Descriptif de l\'entreprise',
                                //         labelStyle:
                                //             TextStyle(color: Colors.black),
                                //         focusColor: Colors.black,
                                //         fillColor: Colors.black,
                                //         border: UnderlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Colors.black))),
                                //   ),
                                // ),
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
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
                                    GestureDetector(
                                      onTap: () =>
                                          partenaireBloc.getPhoto1Exterieur(),
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: partenaireBloc
                                                    .photo1Exterieur[0] !=
                                                null
                                            ? BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: blanc,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: MemoryImage(
                                                        partenaireBloc
                                                                .photo1Exterieur[
                                                            1])),
                                                boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            const Offset(0, 0),
                                                        blurRadius: 1,
                                                        color: noir
                                                            .withOpacity(.2))
                                                  ])
                                            : BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: blanc,
                                                boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            const Offset(0, 0),
                                                        blurRadius: 1,
                                                        color: noir
                                                            .withOpacity(.2))
                                                  ]),
                                        child: partenaireBloc
                                                    .photo1Exterieur[0] !=
                                                null
                                            ? const SizedBox()
                                            : partenaireBloc
                                                    .chargement1PhotoExterieur
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      backgroundColor: blanc,
                                                      color: noir,
                                                    ),
                                                  )
                                                : const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Cliquer pour"),
                                                      Text("télécharger"),
                                                    ],
                                                  ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .025,
                                    ),
                                    GestureDetector(
                                      onTap: () =>
                                          partenaireBloc.getPhoto2Exterieur(),
                                      child: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: partenaireBloc
                                                    .photo2Exterieur[0] !=
                                                null
                                            ? BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: blanc,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: MemoryImage(
                                                        partenaireBloc
                                                                .photo2Exterieur[
                                                            1])),
                                                boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            const Offset(0, 0),
                                                        blurRadius: 1,
                                                        color: noir
                                                            .withOpacity(.2))
                                                  ])
                                            : BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: blanc,
                                                boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            const Offset(0, 0),
                                                        blurRadius: 1,
                                                        color: noir
                                                            .withOpacity(.2))
                                                  ]),
                                        child: partenaireBloc
                                                    .photo2Exterieur[0] !=
                                                null
                                            ? const SizedBox()
                                            : partenaireBloc
                                                    .chargement2PhotoExterieur
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      backgroundColor: blanc,
                                                      color: noir,
                                                    ),
                                                  )
                                                : const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Cliquer pour"),
                                                      Text("télécharger"),
                                                    ],
                                                  ),
                                      ),
                                    ),
                                  ],
                                ),
                                // const SizedBox(
                                //   height: 8,
                                // ),
                                // SizedBox(
                                //   width: size.width * .9,
                                //   child: const TextField(
                                //     cursorColor: Colors.black,
                                //     maxLines: 3,
                                //     decoration: InputDecoration(
                                //         labelText:
                                //             "Descriptif du service ( 3 à 5 phrases)",
                                //         labelStyle:
                                //             TextStyle(color: Colors.black),
                                //         focusColor: Colors.black,
                                //         fillColor: Colors.black,
                                //         border: UnderlineInputBorder(
                                //             borderSide: BorderSide(
                                //                 color: Colors.black))),
                                //   ),
                                // ),
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
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 130,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width: size.width * .05,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => partenaireBloc
                                              .getPhoto1Interieur(),
                                          child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: partenaireBloc
                                                        .photo1Interieur[0] !=
                                                    null
                                                ? BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blanc,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: MemoryImage(
                                                            partenaireBloc
                                                                    .photo1Interieur[
                                                                1])),
                                                    boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 1,
                                                            color: noir
                                                                .withOpacity(
                                                                    .2))
                                                      ])
                                                : BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blanc,
                                                    boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 1,
                                                            color: noir
                                                                .withOpacity(
                                                                    .2))
                                                      ]),
                                            child: partenaireBloc
                                                        .photo1Interieur[0] !=
                                                    null
                                                ? const SizedBox()
                                                : partenaireBloc
                                                        .chargement1PhotoInterieur
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          backgroundColor:
                                                              blanc,
                                                          color: noir,
                                                        ),
                                                      )
                                                    : const Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text("Cliquer pour"),
                                                          Text("télécharger"),
                                                        ],
                                                      ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * .025,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => partenaireBloc
                                              .getPhoto2Interieur(),
                                          child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: partenaireBloc
                                                        .photo2Interieur[0] !=
                                                    null
                                                ? BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blanc,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: MemoryImage(
                                                            partenaireBloc
                                                                    .photo2Interieur[
                                                                1])),
                                                    boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 1,
                                                            color: noir
                                                                .withOpacity(
                                                                    .2))
                                                      ])
                                                : BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blanc,
                                                    boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 1,
                                                            color: noir
                                                                .withOpacity(
                                                                    .2))
                                                      ]),
                                            child: partenaireBloc
                                                        .photo2Interieur[0] !=
                                                    null
                                                ? const SizedBox()
                                                : partenaireBloc
                                                        .chargement2PhotoInterieur
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          backgroundColor:
                                                              blanc,
                                                          color: noir,
                                                        ),
                                                      )
                                                    : const Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text("Cliquer pour"),
                                                          Text("télécharger"),
                                                        ],
                                                      ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * .025,
                                      ),
                                      Center(
                                        child: GestureDetector(
                                          onTap: () => partenaireBloc
                                              .getPhoto3Interieur(),
                                          child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: partenaireBloc
                                                        .photo3Interieur[0] !=
                                                    null
                                                ? BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blanc,
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: MemoryImage(
                                                            partenaireBloc
                                                                    .photo3Interieur[
                                                                1])),
                                                    boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 1,
                                                            color: noir
                                                                .withOpacity(
                                                                    .2))
                                                      ])
                                                : BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: blanc,
                                                    boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                const Offset(
                                                                    0, 0),
                                                            blurRadius: 1,
                                                            color: noir
                                                                .withOpacity(
                                                                    .2))
                                                      ]),
                                            child: partenaireBloc
                                                        .photo3Interieur[0] !=
                                                    null
                                                ? const SizedBox()
                                                : partenaireBloc
                                                        .chargement3PhotoInterieur
                                                    ? Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          backgroundColor:
                                                              blanc,
                                                          color: noir,
                                                        ),
                                                      )
                                                    : const Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text("Cliquer pour"),
                                                          Text("télécharger"),
                                                        ],
                                                      ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * .025,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: size.width * .9,
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    controller: partenaireBloc
                                        .geolocatisationEntreprise,
                                    onChanged: (value) => partenaireBloc
                                        .setListePlaceAutocomplet(),
                                    decoration: const InputDecoration(
                                        labelText:
                                            'Geolocalisation ou localisation (Entreprise)',
                                        suffixIcon: Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              end: 12.0),
                                          child: Icon(CupertinoIcons
                                              .compass), // myIcon is a 48px-wide widget.
                                        ),
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        focusColor: Colors.black,
                                        fillColor: Colors.black,
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black))),
                                  ),
                                ),
                                if (partenaireBloc
                                    .listePlaceAutocomplet.isNotEmpty)
                                  const SizedBox(
                                    height: 16,
                                  ),
                                if (partenaireBloc
                                    .listePlaceAutocomplet.isNotEmpty)
                                  Column(
                                    children: partenaireBloc
                                        .listePlaceAutocomplet
                                        .map((e) => Row(
                                              children: [
                                                SizedBox(
                                                  width: size.width * .035,
                                                ),
                                                GestureDetector(
                                                  onTap: () => partenaireBloc
                                                      .selectPlaceSlected(e),
                                                  child: SizedBox(
                                                    width: size.width * .95,
                                                    child: Container(
                                                      width: size.width * .95,
                                                      decoration: BoxDecoration(
                                                          color: blanc,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                offset:
                                                                    const Offset(
                                                                        0, 0),
                                                                blurRadius: .5,
                                                                color: noir
                                                                    .withOpacity(
                                                                        .1))
                                                          ]),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          ListTile(
                                                            title: Text(e
                                                                .description!
                                                                .toUpperCase()),
                                                          ),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                        .toList(),
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
                                        controller: partenaireBloc.dateRV,
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Date de rendez-vous souhaité',
                                            border: UnderlineInputBorder()),
                                        onTap: () async =>
                                            showDateByDii(context).then(
                                                (value) => partenaireBloc
                                                    .setDateRv(value)),
                                      ),
                                    ),
                                  ],
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
                                        controller: partenaireBloc.heureRV,
                                        decoration: const InputDecoration(
                                            labelText:
                                                'Heure de rendez-vous souhaité',
                                            border: UnderlineInputBorder()),
                                        onTap: () async =>
                                            showTimeByDii(context).then(
                                                (value) => partenaireBloc
                                                    .setHeureRv(value)),
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
                                      onTap: () {
                                        // partenaireBloc.setAddPartenaire();

                                        partenaireBloc.addPartenaireFunction();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 240,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 2,
                                                  color: Colors.white
                                                      .withOpacity(.2))
                                            ]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            partenaireBloc.chargement
                                                ? CircularProgressIndicator(
                                                    backgroundColor: noir,
                                                    color: blanc,
                                                  )
                                                : Text(
                                                    "S'enregister",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
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
              )
            : Stack(
                children: [
                  Container(
                      height: size.height,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("assets/images/bg.jpeg"),
                              fit: BoxFit.cover)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: .0, sigmaY: .0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      )),
                  Container(
                    height: size.height,
                    width: size.width,
                    color: Colors.black.withOpacity(.1),
                    child: ListView(
                      children: [
                        const SizedBox(
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
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        if (partenaireBloc.partenaireModel != null)
                          SizedBox(
                            height: size.height * .45,
                          ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Logement, Restauration et Mobilité  avec SwapeD'
                        //           .toUpperCase(),
                        //       style: TextStyle(
                        //           fontSize: size.width * .03,
                        //           fontWeight: FontWeight.w900,
                        //           color: Colors.white),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 16,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Se sentir chez soit, ou Que je soi'
                        //           .toUpperCase(),
                        //       style: TextStyle(
                        //           fontSize: size.width * .02,
                        //           fontWeight: FontWeight.w700,
                        //           color: Colors.white),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Cher partenaire,",
                              style: TextStyle(color: blanc, fontSize: 24),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                        Text(
                          """Nous vous remercions d'avoir complété votre inscription sur SwapeD. Un commercial ne manquera pas de vous contacter pour valider vos informations, vous communiquer vos accès et vous assister tout au long de la procédure de finalisation.

À très vite !
L'équipe SwapeD

+224 626 50 16 51
swaped@deally.fr""",
                          style: TextStyle(color: blanc, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ));
  }
}
