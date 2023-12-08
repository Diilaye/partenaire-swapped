import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class ViewDetailCmdAdminScreen extends StatelessWidget {
  const ViewDetailCmdAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminBloc = Provider.of<AdminBloc>(context);
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
              'Détails commande N° ${adminBloc.selectedCommande!.reference!}'
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
                        child: adminBloc.selectedCommande!.statusLivraison! !=
                                "livraison"
                            ? IconButton(
                                onPressed: () {},
                                icon: ImageIcon(
                                  const AssetImage(
                                      "assets/images/surplacerestau.png"),
                                  color: noir,
                                ))
                            : IconButton(
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
                            adminBloc.selectedCommande!.dateTransactionSuccess!,
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
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  adminBloc.selectedCommande!.etatLivraison !=
                                          "PENDING"
                                      ? vert
                                      : blanc,
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
                        Container(
                          width: size.width * .05,
                          color: noir,
                          height: 1,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  (adminBloc.selectedCommande!.etatLivraison !=
                                              "PENDING" &&
                                          adminBloc.selectedCommande!
                                                  .etatLivraison !=
                                              "PREPARATION")
                                      ? vert
                                      : blanc,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .5, color: noir.withOpacity(.3))
                              ]),
                          child: Center(
                            child: IconButton(
                              onPressed: () => null,
                              icon: const ImageIcon(
                                  AssetImage("assets/images/livraison.png")),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * .05,
                          color: noir,
                          height: 1,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color:
                                  (adminBloc.selectedCommande!.etatLivraison !=
                                              "PENDING" &&
                                          adminBloc.selectedCommande!
                                                  .etatLivraison !=
                                              "PREPARATION" &&
                                          adminBloc.selectedCommande!
                                                  .etatLivraison !=
                                              "LIVRAISON")
                                      ? vert
                                      : blanc,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .5, color: noir.withOpacity(.3))
                              ]),
                          child: Center(
                            child: IconButton(
                              onPressed: () => null,
                              icon: const ImageIcon(
                                  AssetImage("assets/images/livree.png")),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * .05,
                          color: noir,
                          height: 1,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: blanc,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: .5, color: noir.withOpacity(.3))
                              ]),
                          child: Center(
                            child: IconButton(
                              onPressed: () => dialogRequest(
                                      context: context,
                                      title:
                                          "Vous êtes sure de vouloir annuler cette commande"
                                              .toUpperCase())
                                  .then((value) async {}),
                              icon: const ImageIcon(AssetImage(
                                  "assets/images/cancel-commande.png")),
                            ),
                          ),
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
          height: 8,
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
                'Restaurant'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    Icons.place_outlined,
                    color: noir,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      html.window.open(
                          'https://www.google.com/maps/search/${adminBloc.selectedCommande!.restaurant!.adresse!.split(" ").join("+")}',
                          'new tab');
                    },
                    child: Text(
                        adminBloc.selectedCommande!.restaurant!.adresse!
                            .toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14)),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    CupertinoIcons.person,
                    color: noir,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    adminBloc.selectedCommande!.restaurant!.nomEntreprise!
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    CupertinoIcons.phone,
                    color: noir,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    adminBloc.selectedCommande!.restaurant!.telephone!
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 8,
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
                'Client'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: size.width,
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    CupertinoIcons.person,
                    color: noir,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${adminBloc.selectedCommande!.client!.prenom!} ${adminBloc.selectedCommande!.client!.nom!} "
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Icon(
                    CupertinoIcons.phone,
                    color: noir,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    adminBloc.selectedCommande!.client!.telephone!
                        .toUpperCase()
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
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
                'Livraison'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.place_outlined,
                  color: noir,
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    html.window.open(
                        'https://www.google.com/maps/search/${adminBloc.selectedCommande!.addresseLivraion!.split(" ").join("+")}',
                        'new tab');
                  },
                  child: Text(
                      adminBloc.selectedCommande!.addresseLivraion!
                          .toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.monetization_on_outlined,
                  color: noir,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                    getFormatPrice(
                      adminBloc.selectedCommande!.prixLivraison!,
                    ).toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14)),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                    flex: 5,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Commentaire sur le client'),
                    )),
                Expanded(
                    child: Center(
                  child: IconButton(
                      onPressed: () => null,
                      icon: Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        color: noir,
                      )),
                )),
              ],
            ),
          ],
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
                'Commandes'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * .2,
          child: ListView(
            children: adminBloc.selectedCommande!.panniers!
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: noir,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        e.plat!.galery!.first.url!))),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      e.plat!.titre!.toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text("(x${e.quantity})"),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: e.complements!
                                      .map((el) => SizedBox(
                                            height: 45,
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                    'Nom complements : ${el.name}'),
                                                const Spacer(),
                                                Text("(x${e.quantity})"),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                              ],
                                            ),
                                          ))
                                      .toList(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
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
