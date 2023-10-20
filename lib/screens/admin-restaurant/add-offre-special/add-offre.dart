import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/add-offre-special-bloc.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:partenaire/utils/show-date-by-dii.dart';
import 'package:provider/provider.dart';

class AddOffreSpecial extends StatelessWidget {
  const AddOffreSpecial({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);
    final addOffreSpecialBloc = Provider.of<AddOffreSpecialBloc>(context);

    return ListView(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'votre offres spécial'.toUpperCase(),
            style: const TextStyle(fontSize: 20),
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
                onTap: () => addOffreSpecialBloc.setDisponibilte(0),
                child: Container(
                  color: addOffreSpecialBloc.disponible == 0 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Disponible sur le menu',
                      style: TextStyle(
                          color: addOffreSpecialBloc.disponible == 0
                              ? blanc
                              : noir),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => addOffreSpecialBloc.setDisponibilte(1),
                child: Container(
                  color: addOffreSpecialBloc.disponible == 1 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Indisponible sur le menu',
                      style: TextStyle(
                          color: addOffreSpecialBloc.disponible == 1
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
        Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Selectionnez vos plats ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: noir.withOpacity(.4),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 250,
              width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...adminRestaurantBloc.listes
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: blanc,
                                  boxShadow: [
                                    BoxShadow(
                                      color: noir.withOpacity(.2),
                                      blurRadius: .5,
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      e.galery!.first.url!,
                                      height: 250,
                                      width: 250,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                      right: 6,
                                      top: 6,
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: blanc),
                                        child: addOffreSpecialBloc.selectedPlats
                                                .contains(e)
                                            ? Center(
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: noir),
                                                ),
                                              )
                                            : const SizedBox(),
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: 100,
                                        width: 250,
                                        color: blanc,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(e.titre!),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(e.tarif!.toString()),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      addOffreSpecialBloc
                                                          .setSlectedPlats(e),
                                                  child: Container(
                                                    height: 45,
                                                    width: 230,
                                                    color: noir,
                                                    child: Center(
                                                      child: Text(
                                                        addOffreSpecialBloc
                                                                .selectedPlats
                                                                .contains(e)
                                                            ? 'Désélectionnez ce plat'
                                                            : 'Selectionnez ce plat',
                                                        style: TextStyle(
                                                            color: blanc),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                  SizedBox(
                    width: size.width * .03,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              'Informations ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: noir.withOpacity(.4),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addOffreSpecialBloc.titre,
                decoration: const InputDecoration(
                    labelText: 'Titre',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addOffreSpecialBloc.pourcentage,
                decoration: const InputDecoration(
                    labelText: 'Pourcentage de reduction total',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => addOffreSpecialBloc.getPhoto(),
                    child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: blanc,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 1,
                                  color: noir.withOpacity(.2))
                            ]),
                        child: addOffreSpecialBloc.photo[0] == null
                            ? addOffreSpecialBloc.chargementPhoto
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: noir,
                                    backgroundColor: blanc,
                                  ))
                                : const Center(
                                    child: Text("photo offre"),
                                  )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(
                                  addOffreSpecialBloc.photo[1],
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              )),
                  ),
                  if (addOffreSpecialBloc.photo[0] != null)
                    Positioned(
                        right: 8,
                        top: 8,
                        child: GestureDetector(
                          onTap: () => dialogRequest(
                                  context: context,
                                  title: 'Voulez-vous supprimer cette photo')
                              .then((value) {
                            if (value) {
                              addOffreSpecialBloc.removePhoto();
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
                            child: const Center(
                              child: Icon(
                                CupertinoIcons.delete,
                                size: 10,
                              ),
                            ),
                          ),
                        )),
                  if (addOffreSpecialBloc.photo[0] != null)
                    Positioned(
                        left: 8,
                        top: 8,
                        child: Container(
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: blanc,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 0),
                                    blurRadius: 2,
                                    color: noir.withOpacity(.3))
                              ]),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'photo offre',
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                        ))
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              'Complements proposés',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: noir.withOpacity(.4),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: addOffreSpecialBloc.listeComplement
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
                                      onPressed: () => addOffreSpecialBloc
                                          .removeComplements(e["id"]),
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 30,
                                      ))
                                  : IconButton(
                                      onPressed: () => addOffreSpecialBloc
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
          height: size.height * .02,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Text(
              'Validités proposés',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: noir.withOpacity(.4),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                readOnly: true,
                controller: addOffreSpecialBloc.dateOpenCtrl,
                decoration: const InputDecoration(
                    labelText: 'Date de debut ',
                    border: UnderlineInputBorder()),
                onTap: () async => showDateByDii(context)
                    .then((value) => addOffreSpecialBloc.setDateOpen(value)),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                readOnly: true,
                controller: addOffreSpecialBloc.dateEndCtrl,
                decoration: const InputDecoration(
                    labelText: 'Date de fin ', border: UnderlineInputBorder()),
                onTap: () async => showDateByDii(context)
                    .then((value) => addOffreSpecialBloc.setDateEnd(value)),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: 70,
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () => addOffreSpecialBloc.setLivrable(0),
                child: Container(
                  color: addOffreSpecialBloc.livrable == 0 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Livrable',
                      style: TextStyle(
                          color:
                              addOffreSpecialBloc.livrable == 0 ? blanc : noir),
                    ),
                  ),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () => addOffreSpecialBloc.setLivrable(1),
                child: Container(
                  color: addOffreSpecialBloc.livrable == 1 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Consomable seulement sur place',
                      style: TextStyle(
                          color:
                              addOffreSpecialBloc.livrable == 1 ? blanc : noir),
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
              onTap: () => addOffreSpecialBloc.setAddMenu(1),
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
        SizedBox(
          height: size.height * .01,
        ),
      ],
    );
  }
}
