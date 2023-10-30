import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/bloc/update-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class UpdateOneLogement extends StatelessWidget {
  const UpdateOneLogement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addLogementBloc = Provider.of<AddLogementBloc>(context);
    final updateLogementBloc = Provider.of<UpdateLogementBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'MODIFIER LOGEMENT',
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
                            children: updateLogementBloc.listeTypeLogements
                                .map((e) => Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: 120,
                                          width: 120,
                                          child: GestureDetector(
                                            onTap: () => updateLogementBloc
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
                                                    child: updateLogementBloc
                                                                    .seletectedType![
                                                                'titre'] ==
                                                            e['titre']
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
        if (updateLogementBloc.seletectedType != null &&
            updateLogementBloc.seletectedType!['titre'] == 'Hôtels')
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
                                                  onTap: () =>
                                                      updateLogementBloc
                                                          .setSelectedTypeHotel(
                                                              e),
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
                                                          child: updateLogementBloc
                                                                          .seletectedTypeHotel![
                                                                      'titre'] ==
                                                                  e['titre']
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
                controller: updateLogementBloc.adresse,
                onChanged: (value) =>
                    updateLogementBloc.setListePlaceAutocomplet(),
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
        if (updateLogementBloc.listePlaceAutocomplet.isNotEmpty)
          Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                child: Column(
                  children: updateLogementBloc.listePlaceAutocomplet
                      .map((e) => Row(
                            children: [
                              SizedBox(
                                width: size.width * .01,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      updateLogementBloc.selectPlaceSlected(e),
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
                controller: updateLogementBloc.titreChambre,
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
                controller: updateLogementBloc.nbreChambre,
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
                controller: updateLogementBloc.nbreVoyageur,
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
                controller: updateLogementBloc.nbreLit,
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
                controller: updateLogementBloc.nbreSalleBain,
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
                        onTap: () => updateLogementBloc.getPhotoCouverture(),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: updateLogementBloc
                                      .chargementPhotoCouverture
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : updateLogementBloc.photoCouverture[2] ==
                                          null
                                      ? Image.memory(
                                          updateLogementBloc.photoCouverture[1],
                                          fit: BoxFit.cover,
                                          height: 250,
                                        )
                                      : Image.network(
                                          updateLogementBloc.photoCouverture[2],
                                          fit: BoxFit.cover,
                                          height: 250,
                                        ),
                            )),
                      ),
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
                                    onTap: () => updateLogementBloc.getPhoto1(),
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
                                        child: updateLogementBloc
                                                .chargementPhoto1
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: noir,
                                                ),
                                              )
                                            : updateLogementBloc.photo1[2] ==
                                                    null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.memory(
                                                      updateLogementBloc
                                                          .photo1[1],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      updateLogementBloc
                                                          .photo1[2],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )),
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () => updateLogementBloc.getPhoto2(),
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
                                        child: updateLogementBloc
                                                .chargementPhoto2
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: noir,
                                                ),
                                              )
                                            : updateLogementBloc.photo2[2] ==
                                                    null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.memory(
                                                      updateLogementBloc
                                                          .photo2[1],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      updateLogementBloc
                                                          .photo2[2],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )),
                                  ),
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
                                    onTap: () => updateLogementBloc.getPhoto3(),
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
                                        child: updateLogementBloc
                                                .chargementPhoto3
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                color: noir,
                                                backgroundColor: blanc,
                                              ))
                                            : updateLogementBloc.photo3[2] ==
                                                    null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.memory(
                                                      updateLogementBloc
                                                          .photo3[1],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      updateLogementBloc
                                                          .photo3[2],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )),
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () => updateLogementBloc.getPhoto4(),
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
                                        child: updateLogementBloc
                                                .chargementPhoto4
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(
                                                color: noir,
                                                backgroundColor: blanc,
                                              ))
                                            : updateLogementBloc.photo4[2] ==
                                                    null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.memory(
                                                      updateLogementBloc
                                                          .photo4[1],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      updateLogementBloc
                                                          .photo4[2],
                                                      fit: BoxFit.cover,
                                                      height: 250,
                                                    ),
                                                  )),
                                  ),
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
              onTap: () => updateLogementBloc.changeMenuUpdate(1),
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
