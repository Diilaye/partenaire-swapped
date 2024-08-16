import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/reclamation-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class ViewReclamationScreen extends StatelessWidget {
  const ViewReclamationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final reclamationBloc = Provider.of<ReclamationBloc>(context);
    final menuBloc = Provider.of<AdminBloc>(context);

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
              'Détails reclamation N° ${reclamationBloc.reclamationSelected!.ticketReclamation!}'
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
                    "${reclamationBloc.reclamationSelected!.obect!.client!.prenom!} ${reclamationBloc.reclamationSelected!.obect!.client!.nom!} "
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
                    reclamationBloc
                        .reclamationSelected!.obect!.client!.telephone!
                        .toUpperCase()
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
                  Expanded(
                      flex: 5,
                      child: TextField(
                        controller: reclamationBloc.problemeLogement,
                        decoration: const InputDecoration(
                            labelText: 'Commentaire sur le probleme'),
                      )),
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
                reclamationBloc.reclamationSelected!.obect!.commande != null
                    ? 'Livraison'.toUpperCase()
                    : 'Course'.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const Spacer(),
              IconButton(
                  onPressed: reclamationBloc.vehicules == null
                      ? () => reclamationBloc.getListVehicule()
                      : () => reclamationBloc.setVehiculeNull(),
                  icon: reclamationBloc.vehicules == null
                      ? Text('Liste des motards à proximité')
                      : Text('Fermer')),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        if (reclamationBloc.vehicules != null)
          Column(
            children: reclamationBloc.vehicules!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                  "Nom Complet : ${e.vehicule!.prenom!} ${e.vehicule!.nom!}"
                                      .toUpperCase()),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Téléphone : ${e.vehicule!.telephone!}"
                                  .toUpperCase()),
                              SizedBox(
                                width: 8,
                              ),
                              Text("Distance : ${e.info!.distance!.text!}"
                                  .toUpperCase()),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        if (reclamationBloc.vehicules != null)
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
                  Icons.square,
                  color: bleu,
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    if (reclamationBloc.reclamationSelected!.obect!.commande ==
                        null) {
                      html.window.open(
                          'https://www.google.com/maps/search/${reclamationBloc.reclamationSelected!.obect!.addresseDepart!}',
                          'new tab');
                    } else {
                      html.window.open(
                          'https://www.google.com/maps/search/${reclamationBloc.reclamationSelected!.obect!.commande!.addresseRestaurant!}',
                          'new tab');
                    }
                  },
                  child: Text(
                      reclamationBloc.reclamationSelected!.obect!.commande ==
                              null
                          ? reclamationBloc
                              .reclamationSelected!.obect!.addresseDepart!
                              .toUpperCase()
                          : reclamationBloc.reclamationSelected!.obect!
                              .commande!.addresseRestaurant!
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
                  Icons.square,
                  color: vert,
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    if (reclamationBloc.reclamationSelected!.obect!.commande ==
                        null) {
                      html.window.open(
                          'https://www.google.com/maps/search/${reclamationBloc.reclamationSelected!.obect!.addresseArrive!}',
                          'new tab');
                    } else {
                      html.window.open(
                          'https://www.google.com/maps/search/${reclamationBloc.reclamationSelected!.obect!.commande!.addresseLivraion!}',
                          'new tab');
                    }
                  },
                  child: Text(
                      reclamationBloc.reclamationSelected!.obect!.commande ==
                              null
                          ? reclamationBloc
                              .reclamationSelected!.obect!.addresseArrive!
                              .toUpperCase()
                          : reclamationBloc.reclamationSelected!.obect!
                              .commande!.addresseLivraion!
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
                    reclamationBloc.reclamationSelected!.obect!.commande == null
                        ? getFormatPrice(
                            reclamationBloc
                                .reclamationSelected!.obect!.prixTotal!,
                          ).toUpperCase()
                        : getFormatPrice(
                            reclamationBloc.reclamationSelected!.obect!
                                .commande!.prixLivraison!,
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
                Expanded(
                    flex: 5,
                    child: TextField(
                      controller: reclamationBloc.solutionLogement,
                      decoration: const InputDecoration(
                          labelText: 'Commentaire sur la solution'),
                    )),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        if (reclamationBloc.reclamationSelected!.obect!.commande != null)
          Column(
            children: [
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
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
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
                        CupertinoIcons.person,
                        color: noir,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                          "${reclamationBloc.reclamationSelected!.obect!.commande!.restaurant!.nomEntreprise}"
                              .toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                      const Spacer(),
                      Icon(
                        CupertinoIcons.map_pin,
                        color: noir,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                          "${reclamationBloc.reclamationSelected!.obect!.commande!.restaurant!.adresse}"
                              .toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                      const SizedBox(
                        width: 8,
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
                          reclamationBloc.reclamationSelected!.obect!.commande!
                              .restaurant!.telephone!
                              .toUpperCase(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
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
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              SizedBox(
                height: size.height * .15,
                child: ListView(
                  children: reclamationBloc
                      .reclamationSelected!.obect!.commande!.panniers!
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
            ],
          ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: size.height * .05,
          color: blanc,
          child: Row(
            children: [
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    await reclamationBloc.updateReclamations();
                    if (reclamationBloc.resultUpdate != null) {
                      menuBloc.setMenu(7);
                    }
                  },
                  icon: Container(
                      color: vert,
                      height: size.height * .05,
                      child: reclamationBloc.chargementUpdateReclamations
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Row(
                              children: [
                                const SizedBox(
                                  width: 6,
                                ),
                                Text('Clôturer'.toUpperCase()),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ))),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
