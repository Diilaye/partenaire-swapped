import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/client-admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class ClientUtilisateurScreen extends StatefulWidget {
  const ClientUtilisateurScreen({super.key});

  @override
  State<ClientUtilisateurScreen> createState() =>
      _ClientUtilisateurScreenState();
}

class _ClientUtilisateurScreenState extends State<ClientUtilisateurScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final clientAdminBloc = Provider.of<ClientAdminBloc>(context);

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
            const Text(
              'Client > utilisateurs',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: size.height * .15,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Total client",
                  chiffre: clientAdminBloc.clients == null
                      ? "0"
                      : clientAdminBloc.clients!.length.toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Client suspendu",
                  chiffre: clientAdminBloc.clients == null
                      ? "0"
                      : clientAdminBloc.clients!
                          .where((element) => element.statusCompte == "2")
                          .toList()
                          .length
                          .toString(),
                  estimation: "3",
                  description: "0n a noté une évolution de 3% ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: size.height * .76,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
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
                    const Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text('Liste des clients'),
                        const Spacer(),
                        SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      onChanged: (value) => clientAdminBloc.setTelSearch(value),
                      decoration: const InputDecoration(
                          labelText: 'Rechercher par numero de telephone'),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(flex: 1, child: Text("Nom complet")),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Téléphone Momo"),
                                      ],
                                    ),
                                  ],
                                )),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Téléphone OM"),
                                      ],
                                    ),
                                  ],
                                )),
                                Expanded(child: Text("Actions")),
                                SizedBox(
                                  width: 4,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            if (clientAdminBloc.clients != null)
                              Column(
                                children: clientAdminBloc.clients!
                                    .where((element) =>
                                        clientAdminBloc.filterParTel(element))
                                    .map((e) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  "${e.prenom!} ${e.nom!}",
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  e.telephoneMOMO!,
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Text(
                                                  e.telephoneOM!,
                                                  style: TextStyle(
                                                      color: noir,
                                                      fontSize: 10),
                                                )),
                                                Expanded(
                                                    child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => dialogRequest(
                                                              context: context,
                                                              title:
                                                                  "Voullez-vous blocker ce client ?")
                                                          .then((value) {
                                                        if (value) {}
                                                      }),
                                                      child: Container(
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            border: Border.all(
                                                                color: rouge)),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text(
                                                              "Suspendre",
                                                              style: TextStyle(
                                                                  color: rouge,
                                                                  fontSize: 10),
                                                            ),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              )
                          ],
                        )),
                        const SizedBox(
                          width: 8,
                        ),
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
        )
      ],
    );
  }
}
