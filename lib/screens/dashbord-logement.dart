import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/bloc/update-logement-bloc.dart';
import 'package:partenaire/screens/admin-logement/add-logement.dart';
import 'package:partenaire/screens/admin-logement/add-reservation.dart';
import 'package:partenaire/screens/admin-logement/liste-biens.dart';
import 'package:partenaire/screens/admin-logement/liste-reservation.dart';
import 'package:partenaire/screens/admin-logement/overview-screen.dart';
import 'package:partenaire/screens/admin-logement/settings-screen.dart';
import 'package:partenaire/screens/admin-logement/update-bien.dart/update-one.dart';
import 'package:partenaire/screens/admin-logement/update-logement.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashbordLogementScreen extends StatelessWidget {
  const DashbordLogementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final logementAdminBloc = Provider.of<AdminPartenaireBloc>(context);
    final updateLogementBloc = Provider.of<UpdateLogementBloc>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: blanc, boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 10,
                    color: noir.withOpacity(.2))
              ]),
              child: ListView(
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .025,
                      ),
                      ImageIcon(
                        const AssetImage("assets/images/swape.png"),
                        size: 20,
                        color: noir,
                      ),
                      Text(
                        'waped LOGEMENT'.toUpperCase(),
                        style: TextStyle(color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  GestureDetector(
                    onTap: () => logementAdminBloc.setMenu(0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width * .025,
                        ),
                        Text(
                          'Dashbord',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: noir),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => logementAdminBloc.setMenu(0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: logementAdminBloc.menu == 0
                              ? gris.withOpacity(.3)
                              : blanc),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .03,
                              ),
                              const Icon(
                                Icons.dashboard,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Overview',
                                style: TextStyle(fontSize: 14, color: noir),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Text(
                        'Logements',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => logementAdminBloc.setMenu(1),
                    child: Container(
                      color: logementAdminBloc.menu == 1
                          ? gris.withOpacity(.3)
                          : blanc,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .03,
                              ),
                              const Icon(
                                CupertinoIcons.add,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'ajouter',
                                style: TextStyle(fontSize: 14, color: noir),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => logementAdminBloc.setMenu(2),
                    child: Container(
                      color: logementAdminBloc.menu == 2
                          ? gris.withOpacity(.3)
                          : blanc,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .03,
                              ),
                              const Icon(
                                CupertinoIcons.square_list,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'listes',
                                style: TextStyle(fontSize: 14, color: noir),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Text(
                        'Réservations',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: size.height * .01,
                  // ),
                  // GestureDetector(
                  //   onTap: () => logementAdminBloc.setMenu(3),
                  //   child: Container(
                  //     color: logementAdminBloc.menu == 3
                  //         ? gris.withOpacity(.3)
                  //         : blanc,
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 8,
                  //         ),
                  //         Row(
                  //           children: [
                  //             SizedBox(
                  //               width: size.width * .03,
                  //             ),
                  //             const Icon(
                  //               CupertinoIcons.add,
                  //               size: 13,
                  //             ),
                  //             const SizedBox(
                  //               width: 4,
                  //             ),
                  //             Text(
                  //               'ajouter',
                  //               style: TextStyle(fontSize: 14, color: noir),
                  //             ),
                  //           ],
                  //         ),
                  //         const SizedBox(
                  //           height: 8,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => logementAdminBloc.setMenu(4),
                    child: Container(
                      color: logementAdminBloc.menu == 4
                          ? gris.withOpacity(.3)
                          : blanc,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .03,
                              ),
                              const Icon(
                                CupertinoIcons.square_list,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'listes',
                                style: TextStyle(fontSize: 14, color: noir),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * .03,
                          ),
                          const Icon(
                            CupertinoIcons.headphones,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Help & Support',
                            style: TextStyle(fontSize: 14, color: noir),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * .03,
                          ),
                          const Icon(
                            CupertinoIcons.list_bullet_below_rectangle,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Réclamations',
                            style: TextStyle(fontSize: 14, color: noir),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => logementAdminBloc.setMenu(7),
                    child: Container(
                      color: logementAdminBloc.menu == 7
                          ? gris.withOpacity(.3)
                          : blanc,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .03,
                              ),
                              const Icon(
                                CupertinoIcons.settings,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Paramètres',
                                style: TextStyle(fontSize: 14, color: noir),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => dialogRequest(
                            context: context,
                            title: "Voullez-vous vous déconectez ?")
                        .then((value) {
                      if (value) {
                        SharedPreferences.getInstance().then((prefs) {
                          prefs.clear();
                          Navigator.pushNamed(context, "/");
                        });
                      }
                    }),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width * .03,
                            ),
                            const Icon(
                              Icons.logout_rounded,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Déconnection',
                              style: TextStyle(fontSize: 14, color: noir),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                flex: 4,
                child: Container(
                    decoration: BoxDecoration(color: blanc, boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: .3,
                          color: noir.withOpacity(.2))
                    ]),
                    child: logementAdminBloc.menu == 0
                        ? const OverViewScreenLogementAdmin()
                        : logementAdminBloc.menu == 1
                            ? const AddLogementScreen()
                            : logementAdminBloc.menu == 2
                                ? const ListeBiensScreen()
                                : logementAdminBloc.menu == 3
                                    ? const AddReservationScreen()
                                    : logementAdminBloc.menu == 4
                                        ? const ListeReservation()
                                        : logementAdminBloc.menu == 7
                                            ? const SettingsScreen()
                                            : logementAdminBloc.menu == 10
                                                ? UpdateLogementScreen(
                                                    bien: updateLogementBloc
                                                        .bien!,
                                                  )
                                                : Column())),
          ],
        ),
      ),
    );
  }
}
