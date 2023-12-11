import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/bloc/restaurant/parametres-restaurant-bloc.dart';
import 'package:partenaire/bloc/settings-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/show-date-by-dii.dart';
import 'package:provider/provider.dart';

class ParametreRestaurantScreen extends StatelessWidget {
  const ParametreRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBloc = Provider.of<SettingsBloc>(context);
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);
    final parametresRestaurantBloc =
        Provider.of<ParametresRestaurantBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () => adminRestaurantBloc.setMenuParam(0),
              child: Container(
                height: 60,
                color: adminRestaurantBloc.menuParams == 0 ? noir : blanc,
                child: Center(
                  child: Text(
                    'Profil utilisateur'.toUpperCase(),
                    style: TextStyle(
                        color:
                            adminRestaurantBloc.menuParams == 0 ? blanc : noir),
                  ),
                ),
              ),
            )),
            Expanded(
                child: GestureDetector(
              onTap: () => adminRestaurantBloc.setMenuParam(1),
              child: Container(
                height: 60,
                color: adminRestaurantBloc.menuParams == 1 ? noir : blanc,
                child: Center(
                  child: Text(
                    'Profil restaurant'.toUpperCase(),
                    style: TextStyle(
                        color:
                            adminRestaurantBloc.menuParams == 1 ? blanc : noir),
                  ),
                ),
              ),
            )),
          ],
        ),
        if (adminRestaurantBloc.menuParams == 0)
          Column(
            children: [
              SizedBox(
                height: size.height * .1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .005,
                  ),
                  Expanded(
                      child: Container(
                    height: size.height * .7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blanc,
                        boxShadow: [
                          BoxShadow(color: noir.withOpacity(.2), blurRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .005,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.nom,
                                decoration: InputDecoration(labelText: 'Nom'),
                              )),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.prenom,
                                decoration:
                                    InputDecoration(labelText: 'Prénom'),
                              )),
                              SizedBox(
                                width: size.width * .005,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .005,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.telOM,
                                decoration: InputDecoration(
                                    labelText: 'Téléphone Orange Money'),
                              )),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.telMOMO,
                                decoration: InputDecoration(
                                    labelText: 'Téléphone Momo Mtn'),
                              )),
                              SizedBox(
                                width: size.width * .005,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .005,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.identifiant,
                                readOnly: true,
                                decoration:
                                    InputDecoration(labelText: 'Identifiant'),
                              )),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.email,
                                decoration: InputDecoration(labelText: 'Email'),
                              )),
                              SizedBox(
                                width: size.width * .005,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * .005,
                              ),
                              Expanded(
                                  child: TextField(
                                controller: settingBloc.oldPassword,
                                obscureText: settingBloc.viewPassword,
                                decoration: InputDecoration(
                                    labelText: 'Ancien mot de passe',
                                    suffixIcon: IconButton(
                                        onPressed: () =>
                                            settingBloc.setViewPassword(),
                                        icon: settingBloc.viewPassword
                                            ? const Icon(
                                                CupertinoIcons.eye_slash)
                                            : const Icon(CupertinoIcons.eye))),
                              )),
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                  child: TextField(
                                obscureText: settingBloc.viewPassword,
                                controller: settingBloc.password,
                                decoration: InputDecoration(
                                    labelText: 'Mot de passe',
                                    suffixIcon: IconButton(
                                        onPressed: () =>
                                            settingBloc.setViewPassword(),
                                        icon: settingBloc.viewPassword
                                            ? const Icon(
                                                CupertinoIcons.eye_slash)
                                            : const Icon(CupertinoIcons.eye))),
                              )),
                              SizedBox(
                                width: size.width * .005,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .195,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => settingBloc.updateProfile(),
                                      child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: noir.withOpacity(1)),
                                        child: Center(
                                          child: settingBloc.chargementProfile
                                              ? CircularProgressIndicator(
                                                  color: blanc,
                                                  backgroundColor:
                                                      noir.withOpacity(1),
                                                )
                                              : Text(
                                                  "Sauvegarder",
                                                  style:
                                                      TextStyle(color: blanc),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * .005,
                                  ),
                                ],
                              )),
                              SizedBox(
                                width: size.width * .005,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: size.width * .005,
                  ),
                ],
              ),
            ],
          ),
        if (adminRestaurantBloc.menuParams == 1)
          Column(
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * .005,
                  ),
                  Expanded(
                      child: Container(
                    height: size.height * .85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: blanc,
                        boxShadow: [
                          BoxShadow(color: noir.withOpacity(.2), blurRadius: 1)
                        ]),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    const Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('choisir les types de spécialités')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                        height: 130,
                                        width: size.width,
                                        child: Row(
                                            children:
                                                parametresRestaurantBloc
                                                    .listeSpecialite
                                                    .map((e) => Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Container(
                                                              height: 120,
                                                              width: 120,
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () =>
                                                                    parametresRestaurantBloc
                                                                        .setListeSpecialiteSelected(
                                                                            e),
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      color:
                                                                          blanc,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            offset: const Offset(
                                                                                0, 0),
                                                                            blurRadius:
                                                                                1,
                                                                            color:
                                                                                noir.withOpacity(.2))
                                                                      ]),
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                        child: parametresRestaurantBloc.listeSpecialiteSelected.contains(e)
                                                                            ? Row(
                                                                                children: [
                                                                                  const Spacer(),
                                                                                  Container(
                                                                                    height: 15,
                                                                                    width: 15,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: noir),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: size.width * .01,
                                                                                  )
                                                                                ],
                                                                              )
                                                                            : const SizedBox(),
                                                                      ),
                                                                      Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Image.asset(e["url"] as String)),
                                                                      SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(e["titre"] as String)),
                                                                      SizedBox(
                                                                        height:
                                                                            8,
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
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.nom,
                              decoration: const InputDecoration(
                                  labelText: 'Nom du restaurant'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.adresse,
                              onChanged: (value) => parametresRestaurantBloc
                                  .setListePlaceAutocomplet(),
                              decoration: const InputDecoration(
                                  labelText: 'Geolocalisation du restaurant'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        if (parametresRestaurantBloc
                            .listePlaceAutocomplet.isNotEmpty)
                          Column(
                            children: parametresRestaurantBloc
                                .listePlaceAutocomplet
                                .map((e) => Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * .005,
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () =>
                                                parametresRestaurantBloc
                                                    .selectPlaceSlected(e),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: blanc,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        offset:
                                                            const Offset(0, 0),
                                                        blurRadius: .5,
                                                        color: noir
                                                            .withOpacity(.1))
                                                  ]),
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  ListTile(
                                                    title: Text(e.description!
                                                        .toUpperCase()),
                                                  ),
                                                  const SizedBox(
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
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.description,
                              decoration: const InputDecoration(
                                  labelText: 'Description du restaurant'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.nombreTable,
                              decoration: const InputDecoration(
                                  labelText: 'Nombre de tables'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.telephone,
                              decoration: const InputDecoration(
                                  labelText: 'Téléphone principale'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.telephone1,
                              decoration: const InputDecoration(
                                  labelText: 'Téléphone 2'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              controller: parametresRestaurantBloc.telephone2,
                              decoration: const InputDecoration(
                                  labelText: 'Téléphone 3'),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text("Photo de couvertue")
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  parametresRestaurantBloc.getPhotoCover(),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: blanc,
                                    boxShadow: [
                                      BoxShadow(
                                          color: noir.withOpacity(.3),
                                          blurRadius: 3)
                                    ]),
                                child: parametresRestaurantBloc.photoCover[1] ==
                                        null
                                    ? Center(
                                        child: parametresRestaurantBloc
                                                .chargement1Photo
                                            ? const CircularProgressIndicator()
                                            : Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: parametresRestaurantBloc
                                                                .resto ==
                                                            null
                                                        ? const CircularProgressIndicator()
                                                        : Image.network(
                                                            parametresRestaurantBloc
                                                                    .photoCover[
                                                                2]['url'],
                                                            height: 150,
                                                            width: 150,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  Positioned(
                                                      top: 60,
                                                      left: 60,
                                                      child: Icon(Icons.upload,
                                                          size: 30,
                                                          color: noir))
                                                ],
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                            parametresRestaurantBloc.photo1[1],
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text("Gallerie")
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            GestureDetector(
                              onTap: () => parametresRestaurantBloc.getPhoto1(),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: blanc,
                                    boxShadow: [
                                      BoxShadow(
                                          color: noir.withOpacity(.3),
                                          blurRadius: 3)
                                    ]),
                                child: parametresRestaurantBloc.photo1[1] ==
                                        null
                                    ? Center(
                                        child: parametresRestaurantBloc
                                                .chargement1Photo
                                            ? const CircularProgressIndicator()
                                            : Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: parametresRestaurantBloc
                                                                .resto ==
                                                            null
                                                        ? const CircularProgressIndicator()
                                                        : Image.network(
                                                            parametresRestaurantBloc
                                                                    .photo1[2]
                                                                ['url'],
                                                            height: 150,
                                                            width: 150,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  Positioned(
                                                      top: 60,
                                                      left: 60,
                                                      child: Icon(Icons.upload,
                                                          size: 30,
                                                          color: noir))
                                                ],
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                          parametresRestaurantBloc.photo1[1],
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .005,
                            ),
                            GestureDetector(
                              onTap: () => parametresRestaurantBloc.getPhoto2(),
                              child: Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: blanc,
                                      boxShadow: [
                                        BoxShadow(
                                            color: noir.withOpacity(.3),
                                            blurRadius: 3)
                                      ]),
                                  child: parametresRestaurantBloc.photo2[1] ==
                                          null
                                      ? Center(
                                          child: parametresRestaurantBloc
                                                  .chargement2Photo
                                              ? const CircularProgressIndicator()
                                              : Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      child: parametresRestaurantBloc
                                                                  .resto ==
                                                              null
                                                          ? const CircularProgressIndicator()
                                                          : Image.network(
                                                              parametresRestaurantBloc
                                                                      .photo2[2]
                                                                  ['url'],
                                                              height: 150,
                                                              width: 150,
                                                              fit: BoxFit.cover,
                                                            ),
                                                    ),
                                                    Positioned(
                                                        top: 60,
                                                        left: 60,
                                                        child: Icon(
                                                            Icons.upload,
                                                            size: 30,
                                                            color: noir))
                                                  ],
                                                ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.memory(
                                            parametresRestaurantBloc.photo2[1],
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                            ),
                            SizedBox(
                              width: size.width * .005,
                            ),
                            GestureDetector(
                              onTap: () => parametresRestaurantBloc.getPhoto3(),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: blanc,
                                    boxShadow: [
                                      BoxShadow(
                                          color: noir.withOpacity(.3),
                                          blurRadius: 3)
                                    ]),
                                child: parametresRestaurantBloc.photo3[1] ==
                                        null
                                    ? Center(
                                        child: parametresRestaurantBloc
                                                .chargement3Photo
                                            ? const CircularProgressIndicator()
                                            : Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: parametresRestaurantBloc
                                                                .resto ==
                                                            null
                                                        ? const CircularProgressIndicator()
                                                        : Image.network(
                                                            parametresRestaurantBloc
                                                                    .photo3[2]
                                                                ['url'],
                                                            height: 150,
                                                            width: 150,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  Positioned(
                                                      top: 60,
                                                      left: 60,
                                                      child: Icon(Icons.upload,
                                                          size: 30,
                                                          color: noir))
                                                ],
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                            parametresRestaurantBloc.photo3[1],
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover),
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .005,
                            ),
                            GestureDetector(
                              onTap: () => parametresRestaurantBloc.getPhoto4(),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: blanc,
                                    boxShadow: [
                                      BoxShadow(
                                          color: noir.withOpacity(.3),
                                          blurRadius: 3)
                                    ]),
                                child: parametresRestaurantBloc.photo4[1] ==
                                        null
                                    ? Center(
                                        child: parametresRestaurantBloc
                                                .chargement4Photo
                                            ? const CircularProgressIndicator()
                                            : Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: parametresRestaurantBloc
                                                                .resto ==
                                                            null
                                                        ? const CircularProgressIndicator()
                                                        : Image.network(
                                                            parametresRestaurantBloc
                                                                    .photo4[2]
                                                                ['url'],
                                                            height: 150,
                                                            width: 150,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  Positioned(
                                                      top: 60,
                                                      left: 60,
                                                      child: Icon(Icons.upload,
                                                          size: 30,
                                                          color: noir))
                                                ],
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                          parametresRestaurantBloc.photo4[1],
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .005,
                            ),
                            GestureDetector(
                              onTap: () => parametresRestaurantBloc.getPhoto5(),
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: blanc,
                                    boxShadow: [
                                      BoxShadow(
                                          color: noir.withOpacity(.3),
                                          blurRadius: 3)
                                    ]),
                                child: parametresRestaurantBloc.photo5[1] ==
                                        null
                                    ? Center(
                                        child: parametresRestaurantBloc
                                                .chargement5Photo
                                            ? const CircularProgressIndicator()
                                            : Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: parametresRestaurantBloc
                                                                .resto ==
                                                            null
                                                        ? const CircularProgressIndicator()
                                                        : Image.network(
                                                            parametresRestaurantBloc
                                                                    .photo5[2]
                                                                ['url'],
                                                            height: 150,
                                                            width: 150,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  Positioned(
                                                      top: 60,
                                                      left: 60,
                                                      child: Icon(Icons.upload,
                                                          size: 30,
                                                          color: noir))
                                                ],
                                              ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                            parametresRestaurantBloc.photo5[1],
                                            height: 150,
                                            width: 150,
                                            fit: BoxFit.cover),
                                      ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            ...parametresRestaurantBloc.jours
                                .map((e) => Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: GestureDetector(
                                        onTap: () => parametresRestaurantBloc
                                            .setSlectedJour(e),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: parametresRestaurantBloc
                                                      .selectJour
                                                      .contains(e)
                                                  ? noir
                                                  : blanc,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: noir.withOpacity(.3),
                                                    blurRadius: 3)
                                              ]),
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                e,
                                                style: TextStyle(
                                                    color:
                                                        parametresRestaurantBloc
                                                                .selectJour
                                                                .contains(e)
                                                            ? blanc
                                                            : noir),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .005,
                            ),
                            Expanded(
                                child: TextField(
                              readOnly: true,
                              controller:
                                  parametresRestaurantBloc.ouvertureHeure,
                              onTap: () async => showTimeByDii(context).then(
                                  (value) => parametresRestaurantBloc
                                      .setOuverture(value)),
                              decoration: const InputDecoration(
                                  labelText: 'Heure d\'ouverture'),
                            )),
                            SizedBox(
                              width: size.width * .025,
                            ),
                            Expanded(
                                child: TextField(
                              readOnly: true,
                              controller:
                                  parametresRestaurantBloc.fermetureHeure,
                              decoration: const InputDecoration(
                                  labelText: 'Heure de fermeture'),
                              onTap: () async => showTimeByDii(context).then(
                                  (value) => parametresRestaurantBloc
                                      .setFermeture(value)),
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text('Commodités'),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SizedBox(
                          height: 130,
                          width: size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: parametresRestaurantBloc.commodites
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () => parametresRestaurantBloc
                                            .setSelectedCommodite(e),
                                        child: Container(
                                          height: 120,
                                          width: 120,
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
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              if (parametresRestaurantBloc
                                                  .selectedCommodites
                                                  .contains(e))
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: noir),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    )
                                                  ],
                                                ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Image.asset(
                                                      e['url'] as String)),
                                              Text(e['titre'] as String,
                                                  textAlign: TextAlign.center),
                                              SizedBox(
                                                height: 8,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            Expanded(
                                child: Row(
                              children: [
                                SizedBox(
                                  width: size.width * .195,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => parametresRestaurantBloc
                                        .modiferRestaurant(),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: noir.withOpacity(1)),
                                      child: Center(
                                        child: parametresRestaurantBloc
                                                .chargementModif
                                            ? CircularProgressIndicator(
                                                color: blanc,
                                                backgroundColor:
                                                    noir.withOpacity(1),
                                              )
                                            : Text(
                                                "Sauvegarder",
                                                style: TextStyle(color: blanc),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .005,
                                ),
                              ],
                            )),
                            SizedBox(
                              width: size.width * .005,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: size.width * .005,
                  ),
                ],
              ),
            ],
          )
      ],
    );
  }
}
