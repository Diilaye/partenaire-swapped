import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/course-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';

class FichedePaieLivreurScreen extends StatelessWidget {
  const FichedePaieLivreurScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adminBloc = Provider.of<AdminBloc>(context);
    final coursesAdminBloc = Provider.of<CoursesAdminBloc>(context);
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Text(
              'Détails Livreur ${coursesAdminBloc.fiche!.motard!.prenom} ${coursesAdminBloc.fiche!.motard!.nom}'
                  .toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Container(
          height: size.height * .05,
          width: size.width,
          decoration: BoxDecoration(color: blanc),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: blanc,
                    boxShadow: [
                      BoxShadow(color: noir.withOpacity(.1), blurRadius: .2)
                    ]),
                child: Row(
                  children: [
                    Container(
                      width: size.width * .15,
                      decoration: BoxDecoration(
                        color: blanc,
                      ),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            iconSize: size.width * .08,
                            icon: ImageIcon(
                              const AssetImage(
                                  "assets/images/livraisonresto.png"),
                              color: noir,
                            )),
                      ),
                    ),
                    Container(
                      width: 1,
                      color: noir,
                    ),
                    Expanded(
                        child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Du ${coursesAdminBloc.dateDebut.text} au ${coursesAdminBloc.dateFin.text}",
                            style: TextStyle(
                                fontSize: 18, color: noir.withOpacity(.6)),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 3,
                            width: 45,
                            decoration: BoxDecoration(
                                color: noir.withOpacity(.6),
                                borderRadius: BorderRadius.circular(4)),
                          )
                        ],
                      ),
                    )),
                    Container(
                      width: 1,
                      color: noir,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: vert,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .5, color: noir.withOpacity(.3))
                              ]),
                          child: Center(
                            child: IconButton(
                              onPressed: () => null,
                              icon: const ImageIcon(
                                  AssetImage("assets/images/preparion.png")),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ))
                  ],
                ),
              )),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: size.height * .05,
          color: gris,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                'Courses'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: size.height * .35,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Zone Départ",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Zone Arrivé",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Prix",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Numéro Client",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Date",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView(
                  children: coursesAdminBloc.fiche!.livraison!
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: noir)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.addresseDepart!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.addresseArrive!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.prixLivraison!.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.clientPhone!.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.dateCourses!.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: size.height * .05,
          color: gris,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                'Dépenses'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
        Container(
          height: size.height * .35,
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Titre",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Prix",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    "Date",
                    style: TextStyle(
                        fontSize: 15, color: noir, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView(
                  children: coursesAdminBloc.fiche!.depenses!
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: noir)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.title!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.prix!.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Text(
                                        e.dateCourses!.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: noir,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: size.height * .05,
          color: gris,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                'Action'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => adminBloc.setMenu(0),
                icon: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Retour',
                      style: TextStyle(color: noir),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      color: noir,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * .05,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
