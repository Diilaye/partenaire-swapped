import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/models/partenaire-model.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class ViewPartenaireScreen extends StatelessWidget {
  final PartenaireModel partenaire;
  const ViewPartenaireScreen({super.key, required this.partenaire});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final partenaireAdminBloc = Provider.of<PartenaireAdmonBloc>(context);
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
            const Text(
              'Partenaire > utilisateurs',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        const Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Text('Photo extérieur'),
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
            Container(
              height: 200,
              width: 200,
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
                borderRadius: BorderRadius.circular(8.0),
                // ignore: unnecessary_null_comparison, prefer_is_empty
                child: partenaire.photoExterieur!.length > 0 &&
                        // ignore: unnecessary_null_comparison
                        partenaire.photoExterieur![0] != null
                    ? Image.network(
                        partenaire.photoExterieur!.first.url!,
                        fit: BoxFit.cover,
                        height: 150.0,
                        width: 100.0,
                      )
                    : const Center(child: Text('Pas de photo de profil')),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 200,
              width: 200,
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
                borderRadius: BorderRadius.circular(8.0),
                // ignore: unnecessary_null_comparison, prefer_is_empty
                child: partenaire.photoExterieur!.length > 1 &&
                        // ignore: unnecessary_null_comparison
                        partenaire.photoExterieur![1] != null
                    ? Image.network(
                        partenaire.photoExterieur![1].url!,
                        fit: BoxFit.cover,
                        height: 150.0,
                        width: 100.0,
                      )
                    : const Center(child: Text('Pas de carte d\'identité')),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        const Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Text('Photo intérieur'),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 200,
                width: 200,
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
                  borderRadius: BorderRadius.circular(8.0),
                  // ignore: unnecessary_null_comparison
                  child: partenaire.photoInterne!.length > 0 &&
                          // ignore: unnecessary_null_comparison
                          partenaire.photoInterne![0] != null
                      ? Image.network(
                          partenaire.photoInterne!.first.url!,
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: 100.0,
                        )
                      : const Center(child: Text('Pas de permis de conduire')),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 200,
                width: 200,
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
                  borderRadius: BorderRadius.circular(8.0),
                  child: partenaire.photoInterne!.length > 1 &&
                          partenaire.photoInterne![1] != null
                      ? Image.network(
                          partenaire.photoInterne![1].url!,
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: 100.0,
                        )
                      : const Center(child: Text('Pas de assurance')),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 200,
                width: 200,
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
                  borderRadius: BorderRadius.circular(8.0),
                  child: partenaire.photoInterne!.length > 2 &&
                          partenaire.photoInterne![2] != null
                      ? Image.network(
                          partenaire.photoInterne![2].url!,
                          fit: BoxFit.cover,
                          height: 150.0,
                          width: 100.0,
                        )
                      : const Center(child: Text('Pas de carte grise')),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Column(
          children: [
            Center(
              child: SizedBox(
                child: TextField(
                  cursorColor: Colors.black,
                  controller: partenaireAdminBloc.nomEnreprise,
                  decoration: const InputDecoration(
                      labelText: 'Nom de l\'entreprise',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black,
                      fillColor: Colors.black,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SizedBox(
                width: size.width * .9,
                child: TextField(
                  cursorColor: Colors.black,
                  controller: partenaireAdminBloc.presentationEnreprise,
                  decoration: const InputDecoration(
                      labelText: 'Présentation de l\'entreprise',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black,
                      fillColor: Colors.black,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SizedBox(
                width: size.width * .9,
                child: TextField(
                  cursorColor: Colors.black,
                  controller: partenaireAdminBloc.nomInterlocuteurEnreprise,
                  decoration: const InputDecoration(
                      labelText: 'Nom de l\'interlocteur',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black,
                      fillColor: Colors.black,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SizedBox(
                width: size.width * .9,
                child: TextField(
                  cursorColor: Colors.black,
                  controller: partenaireAdminBloc.prenomInterlocuteurEnreprise,
                  decoration: const InputDecoration(
                      labelText: 'Prénom de l\'interlocteur',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black,
                      fillColor: Colors.black,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: SizedBox(
                width: size.width * .9,
                child: TextField(
                  cursorColor: Colors.black,
                  controller:
                      partenaireAdminBloc.telephoneInterlocuteurEnreprise,
                  decoration: const InputDecoration(
                      labelText: 'N° de Tel de l\'interlocteur',
                      hintText: '+224 000 00 00 00',
                      labelStyle: TextStyle(color: Colors.black),
                      focusColor: Colors.black,
                      fillColor: Colors.black,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await partenaireAdminBloc.addPartenaireFun(partenaire);
                    if (partenaireAdminBloc.successAddPartenaire != null) {
                      menuBloc.setMenu(1);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 240,
                    decoration: BoxDecoration(
                        color: vertFonce,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 2,
                              color: Colors.white.withOpacity(.2))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        partenaireAdminBloc.savePartenairechargement
                            ? CircularProgressIndicator(
                                backgroundColor: vertFonce,
                                color: blanc,
                              )
                            : const Text(
                                "Valider",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .05,
                ),
                GestureDetector(
                  onTap: () => menuBloc.setMenu(1),
                  child: Container(
                    height: 50,
                    width: 240,
                    decoration: BoxDecoration(
                        color: rouge,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 2,
                              color: Colors.white.withOpacity(.2))
                        ]),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Annuler",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
