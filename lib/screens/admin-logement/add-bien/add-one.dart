import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';

class AddOneLogement extends StatelessWidget {
  const AddOneLogement({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addLogementBloc = Provider.of<AddLogementBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'VOTRE LOGEMENT',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Row(
          children: [
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: SizedBox(
                height: 145,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text('choisir les types de logements')
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Row(
                            children: addLogementBloc.listeTypeLogements
                                .map((e) => Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: 120,
                                          width: 120,
                                          child: GestureDetector(
                                            onTap: () => addLogementBloc
                                                .setSelectedType(e),
                                            child: Container(
                                              decoration: BoxDecoration(
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
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                    child: addLogementBloc
                                                                .seletectedType ==
                                                            e
                                                        ? Row(
                                                            children: [
                                                              const Spacer(),
                                                              Container(
                                                                height: 15,
                                                                width: 15,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                    color:
                                                                        noir),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        .01,
                                                              )
                                                            ],
                                                          )
                                                        : const SizedBox(),
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Image.asset(
                                                          e["url"] as String)),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Text(e["titre"]
                                                          as String)),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                                .toList())),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            )
          ],
        ),
        if (addLogementBloc.seletectedType != null &&
            addLogementBloc.seletectedType!['titre'] == 'Hôtels')
          Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Expanded(
                    child: Container(
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [Text('choisir les types de chambres')],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                              child: Row(
                                  children: addLogementBloc
                                      .listeTypeLogementsHotels
                                      .map((e) => Row(
                                            children: [
                                              Container(
                                                child: GestureDetector(
                                                  onTap: () => addLogementBloc
                                                      .setSelectedTypeHotel(e),
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
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
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                          child: addLogementBloc
                                                                      .seletectedTypeHotel ==
                                                                  e
                                                              ? Row(
                                                                  children: [
                                                                    const Spacer(),
                                                                    Container(
                                                                      height:
                                                                          10,
                                                                      width: 10,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              20),
                                                                          color:
                                                                              noir),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          .01,
                                                                    )
                                                                  ],
                                                                )
                                                              : const SizedBox(),
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child: Image.asset(
                                                                e["url"]
                                                                    as String)),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Expanded(
                                                            flex: 1,
                                                            child: Text(
                                                              e["titre"]
                                                                  as String,
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                            ],
                                          ))
                                      .toList())),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .01,
                  )
                ],
              ),
            ],
          ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.adresse,
                onChanged: (value) =>
                    addLogementBloc.setListePlaceAutocomplet(),
                decoration: const InputDecoration(
                    labelText: 'Où est situé votre logement ?',
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      child: Icon(CupertinoIcons
                          .compass), // myIcon is a 48px-wide widget.
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        if (addLogementBloc.listePlaceAutocomplet.isNotEmpty)
          Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                child: Column(
                  children: addLogementBloc.listePlaceAutocomplet
                      .map((e) => Row(
                            children: [
                              SizedBox(
                                width: size.width * .01,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      addLogementBloc.selectPlaceSlected(e),
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: blanc, boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 0),
                                          blurRadius: .5,
                                          color: noir.withOpacity(.1))
                                    ]),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 6,
                                        ),
                                        ListTile(
                                          title: Text(
                                              e.description!.toUpperCase()),
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
              ),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        SizedBox(
          height: size.height * .01,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.titreChambre,
                decoration: const InputDecoration(
                    labelText: 'Titre de votre logement',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.nbreChambre,
                decoration: const InputDecoration(
                    labelText: 'Nombre de Chambre Disponible',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.nbreVoyageur,
                decoration: const InputDecoration(
                    labelText: 'Nombre de Voyageurs (maximun)',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.nbreLit,
                decoration: const InputDecoration(
                    labelText: 'Nombre de Lit Disponible ',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.nbreSalleBain,
                decoration: const InputDecoration(
                    labelText: 'Nombre de Salle de bain Disponible ',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Column(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => addLogementBloc.getPhotoCouverture(),
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
                            child: addLogementBloc.photoCouverture[0] == null
                                ? addLogementBloc.chargementPhotoCouverture
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        color: noir,
                                        backgroundColor: blanc,
                                      ))
                                    : Center(
                                        child: Text("Photo couverture"),
                                      )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.memory(
                                      addLogementBloc.photoCouverture[1],
                                      fit: BoxFit.cover,
                                      height: 250,
                                    ),
                                  )),
                      ),
                      if (addLogementBloc.photoCouverture[0] != null)
                        Positioned(
                            right: 8,
                            top: 8,
                            child: GestureDetector(
                              onTap: () => dialogRequest(
                                      context: context,
                                      title:
                                          'Voulez-vous supprimer cette photo')
                                  .then((value) {
                                if (value) {
                                  addLogementBloc.removePhotoCouverture();
                                }
                              }),
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: blanc,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(0, 0),
                                          blurRadius: 2,
                                          color: noir.withOpacity(.5))
                                    ]),
                                child: Center(
                                  child: Icon(
                                    CupertinoIcons.delete,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )),
                      if (addLogementBloc.photoCouverture[0] != null)
                        Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              height: 25,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: blanc,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: 2,
                                        color: noir.withOpacity(.3))
                                  ]),
                              child: Center(
                                child: Text('photo couverture'),
                              ),
                            ))
                    ],
                  )),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                  child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () => addLogementBloc.getPhoto1(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: blanc,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 1,
                                                  color: noir.withOpacity(.2))
                                            ]),
                                        child: addLogementBloc.photo1[0] == null
                                            ? addLogementBloc.chargementPhoto1
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    color: noir,
                                                    backgroundColor: blanc,
                                                  ))
                                                : Center(
                                                    child: Text("1er photo"),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.memory(
                                                  addLogementBloc.photo1[1],
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                ),
                                              )),
                                  ),
                                  if (addLogementBloc.photo1[0] != null)
                                    Positioned(
                                        right: 8,
                                        top: 8,
                                        child: GestureDetector(
                                          onTap: () => dialogRequest(
                                                  context: context,
                                                  title:
                                                      'Voulez-vous supprimer cette photo')
                                              .then((value) {
                                            if (value) {
                                              addLogementBloc.removePhoto1();
                                            }
                                          }),
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: blanc,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 2,
                                                      color:
                                                          noir.withOpacity(.5))
                                                ]),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.delete,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        )),
                                  if (addLogementBloc.photo1[0] != null)
                                    Positioned(
                                        left: 8,
                                        top: 8,
                                        child: Container(
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: blanc,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 0),
                                                    blurRadius: 2,
                                                    color: noir.withOpacity(.3))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text('1er photo'),
                                              SizedBox(
                                                width: 4,
                                              ),
                                            ],
                                          ),
                                        ))
                                ],
                              )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () => addLogementBloc.getPhoto2(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: blanc,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 1,
                                                  color: noir.withOpacity(.2))
                                            ]),
                                        child: addLogementBloc.photo2[0] == null
                                            ? addLogementBloc.chargementPhoto2
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    color: noir,
                                                    backgroundColor: blanc,
                                                  ))
                                                : Center(
                                                    child: Text("2ieme photo"),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.memory(
                                                  addLogementBloc.photo2[1],
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                ),
                                              )),
                                  ),
                                  if (addLogementBloc.photo2[0] != null)
                                    Positioned(
                                        right: 8,
                                        top: 8,
                                        child: GestureDetector(
                                          onTap: () => dialogRequest(
                                                  context: context,
                                                  title:
                                                      'Voulez-vous supprimer cette photo')
                                              .then((value) {
                                            if (value) {
                                              addLogementBloc.removePhoto2();
                                            }
                                          }),
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: blanc,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 2,
                                                      color:
                                                          noir.withOpacity(.5))
                                                ]),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.delete,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        )),
                                  if (addLogementBloc.photo2[0] != null)
                                    Positioned(
                                        left: 8,
                                        top: 8,
                                        child: Container(
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: blanc,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 0),
                                                    blurRadius: 2,
                                                    color: noir.withOpacity(.3))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text('2ieme photo'),
                                              SizedBox(
                                                width: 4,
                                              ),
                                            ],
                                          ),
                                        ))
                                ],
                              )),
                              SizedBox(
                                width: size.width * .15,
                              ),
                            ],
                          )),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                              child: Row(
                            children: [
                              Expanded(
                                  child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () => addLogementBloc.getPhoto3(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: blanc,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 1,
                                                  color: noir.withOpacity(.2))
                                            ]),
                                        child: addLogementBloc.photo3[0] == null
                                            ? addLogementBloc.chargementPhoto3
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    color: noir,
                                                    backgroundColor: blanc,
                                                  ))
                                                : Center(
                                                    child: Text("3ieme photo"),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.memory(
                                                  addLogementBloc.photo3[1],
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                ),
                                              )),
                                  ),
                                  if (addLogementBloc.photo3[0] != null)
                                    Positioned(
                                        right: 8,
                                        top: 8,
                                        child: GestureDetector(
                                          onTap: () => dialogRequest(
                                                  context: context,
                                                  title:
                                                      'Voulez-vous supprimer cette photo')
                                              .then((value) {
                                            if (value) {
                                              addLogementBloc.removePhoto3();
                                            }
                                          }),
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: blanc,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 2,
                                                      color:
                                                          noir.withOpacity(.5))
                                                ]),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.delete,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        )),
                                  if (addLogementBloc.photo3[0] != null)
                                    Positioned(
                                        left: 8,
                                        top: 8,
                                        child: Container(
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: blanc,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 0),
                                                    blurRadius: 2,
                                                    color: noir.withOpacity(.3))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text('3ieme photo'),
                                              SizedBox(
                                                width: 4,
                                              ),
                                            ],
                                          ),
                                        ))
                                ],
                              )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () => addLogementBloc.getPhoto4(),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: blanc,
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0, 0),
                                                  blurRadius: 1,
                                                  color: noir.withOpacity(.2))
                                            ]),
                                        child: addLogementBloc.photo4[0] == null
                                            ? addLogementBloc.chargementPhoto4
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    color: noir,
                                                    backgroundColor: blanc,
                                                  ))
                                                : Center(
                                                    child: Text("4ieme photo"),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.memory(
                                                  addLogementBloc.photo4[1],
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                ),
                                              )),
                                  ),
                                  if (addLogementBloc.photo4[0] != null)
                                    Positioned(
                                        right: 8,
                                        top: 8,
                                        child: GestureDetector(
                                          onTap: () => dialogRequest(
                                                  context: context,
                                                  title:
                                                      'Voulez-vous supprimer cette photo')
                                              .then((value) {
                                            if (value) {
                                              addLogementBloc.removePhoto4();
                                            }
                                          }),
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: blanc,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 2,
                                                      color:
                                                          noir.withOpacity(.5))
                                                ]),
                                            child: Center(
                                              child: Icon(
                                                CupertinoIcons.delete,
                                                size: 16,
                                              ),
                                            ),
                                          ),
                                        )),
                                  if (addLogementBloc.photo4[0] != null)
                                    Positioned(
                                        left: 8,
                                        top: 8,
                                        child: Container(
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: blanc,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(0, 0),
                                                    blurRadius: 2,
                                                    color: noir.withOpacity(.3))
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text('4ieme photo'),
                                              SizedBox(
                                                width: 4,
                                              ),
                                            ],
                                          ),
                                        ))
                                ],
                              )),
                              SizedBox(
                                width: size.width * .15,
                              ),
                            ],
                          )),
                        ],
                      )),
                  SizedBox(
                    width: size.width * .1,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => addLogementBloc.changeMenuAdd(1),
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
