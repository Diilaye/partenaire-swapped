import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/add-plats-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';

class AddOnePlats extends StatelessWidget {
  const AddOnePlats({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addPlatRestaurantBloc = Provider.of<AddPlatRestaurantBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'VOTRE PLATS',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: size.height * .01,
        ),
        SizedBox(
          height: 70,
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => addPlatRestaurantBloc.setDisponibilte(0),
                child: Container(
                  color: addPlatRestaurantBloc.disponible == 0 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Disponible sur le menu',
                      style: TextStyle(
                          color: addPlatRestaurantBloc.disponible == 0
                              ? blanc
                              : noir),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => addPlatRestaurantBloc.setDisponibilte(1),
                child: Container(
                  color: addPlatRestaurantBloc.disponible == 1 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Indisponible sur le menu',
                      style: TextStyle(
                          color: addPlatRestaurantBloc.disponible == 1
                              ? blanc
                              : noir),
                    ),
                  ),
                ),
              )),
            ],
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
                        Text('choisir le type de spécialitée')
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Row(
                            children: addPlatRestaurantBloc.listeSpecialite
                                .map((e) => Row(
                                      children: [
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          height: 120,
                                          width: 120,
                                          child: GestureDetector(
                                            onTap: () => addPlatRestaurantBloc
                                                .setSelectedSpecialite(e),
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
                                                    child: addPlatRestaurantBloc
                                                                    .selectedSpecialite[
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
        SizedBox(
          height: size.height * .01,
        ),
        const Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Text('choisir le menu')
          ],
        ),
        SizedBox(
          height: size.height * .01,
        ),
        Row(
            children: addPlatRestaurantBloc.listeMenu
                .map((e) => Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () => addPlatRestaurantBloc.setSelectedMenu(e),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: addPlatRestaurantBloc.selectedMenu
                                        .contains(e)
                                    ? noir
                                    : blanc,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 0),
                                      blurRadius: 1,
                                      color: noir.withOpacity(.2))
                                ]),
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
                                    Text(
                                      e,
                                      style: TextStyle(
                                        color: addPlatRestaurantBloc
                                                .selectedMenu
                                                .contains(e)
                                            ? blanc
                                            : noir,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                .toList()),
        const SizedBox(
          height: 8,
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
                controller: addPlatRestaurantBloc.nom,
                decoration: const InputDecoration(
                    labelText: 'Nom plat ',
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
                controller: addPlatRestaurantBloc.description,
                decoration: const InputDecoration(
                    labelText: 'Description plat',
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
                controller: addPlatRestaurantBloc.prix,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    labelText: 'Prix plat (TTC) ',
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
        const Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Text('Photo plat')
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Column(
          children: [
            SizedBox(
              height: 120,
              child: Row(
                children: [
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
                                    onTap: () =>
                                        addPlatRestaurantBloc.getPhoto1(),
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
                                        child: addPlatRestaurantBloc
                                                    .photo1[0] ==
                                                null
                                            ? addPlatRestaurantBloc
                                                    .chargementPhoto1
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
                                                  addPlatRestaurantBloc
                                                      .photo1[1],
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                ),
                                              )),
                                  ),
                                  if (addPlatRestaurantBloc.photo1[0] != null)
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
                                              addPlatRestaurantBloc
                                                  .removePhoto1();
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
                                  if (addPlatRestaurantBloc.photo1[0] != null)
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
                                          child: const Row(
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
                                    onTap: () =>
                                        addPlatRestaurantBloc.getPhoto2(),
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
                                        child: addPlatRestaurantBloc
                                                    .photo2[0] ==
                                                null
                                            ? addPlatRestaurantBloc
                                                    .chargementPhoto2
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
                                                  addPlatRestaurantBloc
                                                      .photo2[1],
                                                  fit: BoxFit.cover,
                                                  height: 250,
                                                ),
                                              )),
                                  ),
                                  if (addPlatRestaurantBloc.photo2[0] != null)
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
                                              addPlatRestaurantBloc
                                                  .removePhoto2();
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
                                  if (addPlatRestaurantBloc.photo2[0] != null)
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
                                          child: const Row(
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
                        ],
                      )),
                  SizedBox(
                    width: size.width * .4,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        const Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Text('Complement plat')
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Column(
          children: addPlatRestaurantBloc.listeComplement
              .map((e) => SizedBox(
                    height: 60,
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .01,
                        ),
                        Expanded(
                            child: TextField(
                          controller: e['ctrl'] as TextEditingController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              labelText: e['label'] as String,
                              labelStyle: const TextStyle(color: Colors.black),
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        )),
                        SizedBox(
                          width: size.width * .01,
                        ),
                        Expanded(
                            child: TextField(
                          controller: e['ctrlPrix'] as TextEditingController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              labelText: e['prix'] as String,
                              labelStyle: const TextStyle(color: Colors.black),
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                        )),
                        SizedBox(
                          width: size.width * .01,
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Column(
                            children: [
                              const Spacer(),
                              e['supprimable'] == true
                                  ? IconButton(
                                      onPressed: () => addPlatRestaurantBloc
                                          .removeComplements(e["id"]),
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 30,
                                      ))
                                  : IconButton(
                                      onPressed: () => addPlatRestaurantBloc
                                          .setListeComplements(),
                                      icon: const Icon(
                                        Icons.add,
                                        size: 30,
                                      ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * .01,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: size.height * .05,
        ),
        SizedBox(
          height: 70,
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => addPlatRestaurantBloc.setLivrable(0),
                child: Container(
                  color: addPlatRestaurantBloc.livrable == 0 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Livrable',
                      style: TextStyle(
                          color: addPlatRestaurantBloc.livrable == 0
                              ? blanc
                              : noir),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => addPlatRestaurantBloc.setLivrable(1),
                child: Container(
                  color: addPlatRestaurantBloc.livrable == 1 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Consomable seulement sur place',
                      style: TextStyle(
                          color: addPlatRestaurantBloc.livrable == 1
                              ? blanc
                              : noir),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => addPlatRestaurantBloc.setMenuAdd(1),
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
                      'visualiser l\'annonce'.toUpperCase(),
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
