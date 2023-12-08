import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';

class ListeCommandeScreen extends StatefulWidget {
  const ListeCommandeScreen({super.key});

  @override
  State<ListeCommandeScreen> createState() => _ListeCommandeScreenState();
}

class _ListeCommandeScreenState extends State<ListeCommandeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);

    return Column(
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
              'Liste des commandes'.toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 3,
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
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Dernières commandes'),
                            const Spacer(),
                            SizedBox(
                              width: 200,
                              height: 40,
                              child: Center(
                                child: FormField<String>(
                                  builder: (FormFieldState<String> state) {
                                    return InputDecorator(
                                      decoration: const InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black))),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: adminRestaurantBloc
                                              .selectedStatus,
                                          onChanged: (newValue) {
                                            setState(() {
                                              state.didChange(newValue);
                                            });
                                            adminRestaurantBloc
                                                .setSelectedStatus(newValue!);
                                          },
                                          iconSize: 12,
                                          items: adminRestaurantBloc.listeStatus
                                              .map((String value) {
                                            if (value == "") {
                                              return const DropdownMenuItem<
                                                  String>(
                                                value: "",
                                                child: Text(
                                                  "Tous les commandes",
                                                ),
                                              );
                                            } else {
                                              return DropdownMenuItem<String>(
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
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                dialogRequestInfo(
                                    context: context,
                                    text1:
                                        "La préparation de la commande est en cours du côté du restaurateur. Une fois préparée, la commande est confiée à l'un de nos livreurs à moto. ",
                                    text2:
                                        "La commande est en cours de livraison par un de nos livreurs.",
                                    text3:
                                        "La livraison a été effectuée avec succès et la commande a été remis au destinataire.");
                              },
                              icon: const Icon(Icons.info),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                width: 90,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: noir)),
                                child: Center(child: Text('Voir tous'))),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(child: Text("N°")),
                                Expanded(child: Text("Montant TTC")),
                                Expanded(child: Text("Date")),
                                Expanded(child: Text("Statut")),
                                Expanded(flex: 3, child: Text("Action")),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Column(
                              // ignore: unnecessary_null_comparison
                              children:
                                  adminRestaurantBloc.listeCommandes == null
                                      ? const [CircularProgressIndicator()]
                                      : adminRestaurantBloc.listeCommandes!
                                          .where((element) =>
                                              (element.etatLivraison ==
                                                  adminRestaurantBloc
                                                      .selectedStatus) ||
                                              adminRestaurantBloc
                                                      .selectedStatus ==
                                                  "")
                                          .map((e) => Container(
                                                color:
                                                    e.etatLivraison == "PENDING"
                                                        ? blanc
                                                        : e.etatLivraison ==
                                                                "PREPARATION"
                                                            ? orange
                                                            : vert,
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                        Expanded(
                                                            child: Text(
                                                                "${e.reference}",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        noir))),
                                                        Expanded(
                                                            child: Text(
                                                                getFormatPrice(e
                                                                    .prixOffre!),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        noir))),
                                                        Expanded(
                                                            child: Text(
                                                                e
                                                                    .dateTransactionSuccess!,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color:
                                                                        noir))),
                                                        Expanded(
                                                          child: Text(
                                                              e.etatLivraison!,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: noir)),
                                                        ),
                                                        Expanded(
                                                            flex: 3,
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                    child: Center(
                                                                        child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed: () => dialogRequest(
                                                                              context: context,
                                                                              title: "Vous êtes sur de lancer la PREPARATION".toUpperCase())
                                                                          .then((value) async {
                                                                        if (value) {
                                                                          await adminRestaurantBloc.updateStatusCommandePannier(
                                                                              e,
                                                                              "PREPARATION");
                                                                          adminRestaurantBloc
                                                                              .setMenu(0);
                                                                        }
                                                                      }),
                                                                      icon: const ImageIcon(
                                                                          AssetImage(
                                                                              "assets/images/preparion.png")),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                  ],
                                                                ))),
                                                                const SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Expanded(
                                                                    child: Center(
                                                                        child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed: () => dialogRequest(
                                                                              context: context,
                                                                              title: "Vous êtes sur de lancer la Livraison".toUpperCase())
                                                                          .then((value) async {
                                                                        if (value) {
                                                                          await adminRestaurantBloc.updateStatusCommandePannier(
                                                                              e,
                                                                              "LIVRAISON");
                                                                          adminRestaurantBloc
                                                                              .setMenu(0);
                                                                        }
                                                                      }),
                                                                      icon: const ImageIcon(
                                                                          AssetImage(
                                                                              "assets/images/livraison.png")),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                  ],
                                                                ))),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Expanded(
                                                                    child: Center(
                                                                        child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        adminRestaurantBloc
                                                                            .setSelectedCommande(e);
                                                                        adminRestaurantBloc
                                                                            .setMenu(13);
                                                                      },
                                                                      icon: const Icon(
                                                                          CupertinoIcons
                                                                              .eye_solid),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                  ],
                                                                ))),
                                                              ],
                                                            )),
                                                        SizedBox(
                                                          width: 16,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    )
                                                  ],
                                                ),
                                              ))
                                          .toList(),
                            )
                          ],
                        )),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
      ],
    );
  }
}
