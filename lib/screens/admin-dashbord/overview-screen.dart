import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/client-admin-bloc.dart';
import 'package:partenaire/bloc/course-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/bloc/reclamation-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:partenaire/widgets/admin-dashbord/chart-circular-reclamation.dart';
import 'package:partenaire/widgets/admin-dashbord/overview-stat-widget.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final clientAdminBloc = Provider.of<ClientAdminBloc>(context);
    final adminBloc = Provider.of<AdminBloc>(context);
    final reclamationBloc = Provider.of<ReclamationBloc>(context);
    final partenaireBloc = Provider.of<PartenaireAdmonBloc>(context);
    final coursesAdminBloc = Provider.of<CoursesAdminBloc>(context);

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
              'Overview',
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
                  title: "Restaurants",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!
                          .where((element) => element.service == "restaurant")
                          .length
                          .toString(),
                  estimation: "0",
                  description: "0 profit de ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Logements",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!
                          .where((element) => element.service == "logement")
                          .length
                          .toString(),
                  estimation: "0",
                  description: "0 profit de 0 GNF ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "Motards",
                  chiffre: partenaireBloc.listePartenaire == null
                      ? "0"
                      : partenaireBloc.listePartenaire!
                          .where((element) => element.service == "mobilite")
                          .length
                          .toString(),
                  estimation: "0",
                  description: "0 nombre de visite ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "clients",
                  chiffre: clientAdminBloc.clients == null
                      ? "0"
                      : clientAdminBloc.clients!.length.toString(),
                  estimation: "0",
                  description: "0 nombre de visite ce mois"),
              SizedBox(
                width: size.width * .01,
              ),
              overviewStatWidget(
                  title: "commandes",
                  chiffre: adminBloc.listeCommandes == null
                      ? "0"
                      : adminBloc.listeCommandes!.length.toString(),
                  estimation: "0",
                  description: "0 nombre de visite ce mois"),
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
          height: size.height * .4,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 2,
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
                            Text('Activité de vente'),
                            Spacer(),
                            Text('Derniers 12 mois'),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                                child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Expanded(child: Text('+ M ')),
                                Expanded(child: Text('8 M ')),
                                Expanded(child: Text('6 M ')),
                                Expanded(child: Text('4 M ')),
                                Expanded(child: Text('2 M ')),
                                Expanded(child: Text('0 M ')),
                              ],
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(200),
                                          color: noir.withOpacity(.5)),
                                    )),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text('Jan'),
                                const SizedBox(
                                  height: 4,
                                )
                              ],
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Fev'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Mar'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Avr'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Mai'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Jui'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Jul'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Aou'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Sep'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Oct'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Nov'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              child: Column(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200),
                                            color: noir.withOpacity(.5)),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text('Dec'),
                                  const SizedBox(
                                    height: 4,
                                  )
                                ],
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 2,
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
                            const Text('Performances'),
                            const Spacer(),
                            const Spacer(),
                            const SizedBox(
                              width: 8,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            const Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(flex: 2, child: Text("Nom complet")),
                                Expanded(child: Text("CA")),
                                Expanded(child: Text("RN")),
                                Expanded(child: Text("Salaire")),
                                Expanded(flex: 1, child: Text("Action")),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                                child: ListView(
                              children: coursesAdminBloc.livarisons.reversed
                                  .map(
                                    (e) => Row(
                                      children: [
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Text(
                                                "${e.motard!.prenom!} ${e.motard!.nom!} ")),
                                        Expanded(
                                            child: Text(getFormatPrice(
                                                e.chiffreAffaire!))),
                                        Expanded(
                                            child: Text(getFormatPrice(
                                                (e.revenuNette!)))),
                                        Expanded(
                                            child: Text(
                                                getFormatPrice((e.salaire!)))),
                                        Expanded(
                                            flex: 1,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                      CupertinoIcons.eye_solid),
                                                  onPressed: () {
                                                    coursesAdminBloc
                                                        .setFiche(e);
                                                    adminBloc.setMenu(92);
                                                  },
                                                ),
                                              ],
                                            )),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            )),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                                height: 75,
                                width: size.width,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        readOnly: true,
                                        controller: coursesAdminBloc.dateDebut,
                                        decoration: InputDecoration(
                                            labelText: coursesAdminBloc
                                                    .dateDebut.text.isEmpty
                                                ? 'Date début'
                                                : '',
                                            border:
                                                const UnderlineInputBorder()),
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  locale:
                                                      const Locale("fr", "FR"),
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime(2030))
                                              .then((value) => coursesAdminBloc
                                                  .setDateDebut(value));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TextField(
                                        readOnly: true,
                                        controller: coursesAdminBloc.dateFin,
                                        decoration: InputDecoration(
                                            labelText: coursesAdminBloc
                                                    .dateFin.text.isEmpty
                                                ? 'Date fin'
                                                : '',
                                            border:
                                                const UnderlineInputBorder()),
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  locale:
                                                      const Locale("fr", "FR"),
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(2023),
                                                  lastDate: DateTime(2030))
                                              .then((value) => coursesAdminBloc
                                                  .setDateFin(value));
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () => coursesAdminBloc
                                              .getLivraisonDate(),
                                          child: Container(
                                              width: 90,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(2),
                                                  color: noir,
                                                  border:
                                                      Border.all(color: noir)),
                                              child: Center(
                                                  child: coursesAdminBloc
                                                          .chargementLivraison
                                                      ? Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: blanc,
                                                          ),
                                                        )
                                                      : Text(
                                                          'Envoyer',
                                                          style: TextStyle(
                                                              color: blanc),
                                                        ))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                  ],
                                )),
                            const SizedBox(
                              height: 8,
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
        ),
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: size.height * .7,
          child: Row(
            children: [
              SizedBox(
                width: size.width * .01,
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
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
                                    const Text(
                                        'Dernières commandes restaurants'),
                                    const Spacer(),
                                    SizedBox(
                                      width: 200,
                                      height: 40,
                                      child: Center(
                                        child: FormField<String>(
                                          builder:
                                              (FormFieldState<String> state) {
                                            return InputDecorator(
                                              decoration: const InputDecoration(
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  value:
                                                      adminBloc.selectedStatus,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                      state.didChange(newValue);
                                                    });
                                                    adminBloc.setSelectedStatus(
                                                        newValue!);
                                                  },
                                                  iconSize: 12,
                                                  items: adminBloc.listeStatus
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
                                                      return DropdownMenuItem<
                                                          String>(
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
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                        width: 90,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(color: noir)),
                                        child:
                                            Center(child: Text('Voir tous'))),
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
                                        Expanded(flex: 1, child: Text("N°")),
                                        Expanded(child: Text("Montant TTC")),
                                        Expanded(child: Text("Date")),
                                        Expanded(child: Text("Statut")),
                                        Expanded(
                                            flex: 1, child: Text("Action")),
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
                                      children: adminBloc.listeCommandes == null
                                          ? const [CircularProgressIndicator()]
                                          : adminBloc.listeCommandes!
                                              .where((element) =>
                                                  (element.etatLivraison ==
                                                      adminBloc
                                                          .selectedStatus) ||
                                                  adminBloc.selectedStatus ==
                                                      "")
                                              .map((e) => Container(
                                                    color: e.etatLivraison ==
                                                            "PENDING"
                                                        ? blanc
                                                        : e.etatLivraison ==
                                                                "PREPARATION"
                                                            ? orange
                                                            : e.etatLivraison ==
                                                                    "CANCEL"
                                                                ? rouge
                                                                : vert,
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
                                                            Expanded(
                                                                flex: 1,
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
                                                                  e
                                                                      .etatLivraison!,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color:
                                                                          noir)),
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Center(
                                                                          child: Row(
                                                                        children: [
                                                                          IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              adminBloc.setSelectedCommande(e);
                                                                              adminBloc.setMenu(12);
                                                                            },
                                                                            icon:
                                                                                const Icon(CupertinoIcons.eye_solid),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                        ],
                                                                      )),
                                                                    ),
                                                                    if (e.restaurant!
                                                                            .typePartenaire ==
                                                                        "1")
                                                                      Icon(CupertinoIcons
                                                                          .paperplane),
                                                                    if (e.restaurant!
                                                                            .typePartenaire ==
                                                                        "1")
                                                                      const SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                  ],
                                                                )),
                                                            const SizedBox(
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
                          flex: 2,
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
                                SizedBox(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          'Réclamations (${reclamationBloc.reclamations.where((e) => e.statusReclamation == 'pending').toList().length})'),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () => adminBloc.setMenu(7),
                                        icon: Container(
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(color: noir)),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                'Voir tous',
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: CircularChartReclamation(
                                                color: vertFonce,
                                                value: reclamationBloc
                                                        .reclamations.isEmpty
                                                    ? 1
                                                    : double.parse((reclamationBloc
                                                                .reclamations
                                                                .where((e) =>
                                                                    e.statusReclamation !=
                                                                    'pending')
                                                                .toList()
                                                                .length /
                                                            reclamationBloc
                                                                .reclamations
                                                                .length)
                                                        .toStringAsFixed(2)),
                                              )),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.square,
                                                      color:
                                                          noir.withOpacity(.4),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                      child: reclamationBloc
                                                              .reclamations
                                                              .isEmpty
                                                          ? const Text(
                                                              '100% ',
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )
                                                          : Text(
                                                              "${((reclamationBloc.reclamations.where((e) => e.statusReclamation == 'pending').toList().length / reclamationBloc.reclamations.length) * 100).toInt().toString()}% ",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          10),
                                                            ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.square,
                                                      color: vertFonce,
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    SizedBox(
                                                        width: 30,
                                                        child: reclamationBloc
                                                                .reclamations
                                                                .isEmpty
                                                            ? const Text(
                                                                '100% ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              )
                                                            : Text(
                                                                "${double.parse((reclamationBloc.reclamations.where((e) => e.statusReclamation != 'pending').toList().length / reclamationBloc.reclamations.length).toStringAsFixed(2).toString()) * 100}%",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            10),
                                                              ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
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
                        height: size.height * .01,
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('Top partenaires'),
                                    const Spacer(),
                                    Text('Voir +'),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
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
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                                flex: 2, child: Text("Nom")),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                Text("Montant"),
                                              ],
                                            )),
                                            Expanded(
                                                child: Row(
                                              children: [
                                                const Spacer(),
                                                Text("%"),
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
                                        Column(
                                          children: List.generate(
                                              0,
                                              (index) => Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                "Restaurant Le Bambou",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              Text(
                                                                "150,000,000",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          )),
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              Text(
                                                                "12%",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
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
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                "Hôtel Milinium",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              Text(
                                                                "120,000,000",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          )),
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              Text(
                                                                "10%",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
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
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 4,
                                                          ),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                "Immo Tapi",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
                                                              )),
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              Text(
                                                                "30,000,000",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          )),
                                                          Expanded(
                                                              child: Row(
                                                            children: [
                                                              const Spacer(),
                                                              Text(
                                                                "19%",
                                                                style: TextStyle(
                                                                    color: noir,
                                                                    fontSize:
                                                                        10),
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
                                                  )),
                                        )
                                      ],
                                    )),
                                    SizedBox(
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
                    ],
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
