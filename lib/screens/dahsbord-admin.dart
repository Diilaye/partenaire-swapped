import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-bloc.dart';
import 'package:partenaire/bloc/partenaire-admin-bloc.dart';
import 'package:partenaire/screens/admin-dashbord/client-utilisateur-screen.dart';
import 'package:partenaire/screens/admin-dashbord/liste-commande-screen-admin.dart';
import 'package:partenaire/screens/admin-dashbord/overview-screen.dart';
import 'package:partenaire/screens/admin-dashbord/partenaire-utilisateur-screen.dart';
import 'package:partenaire/screens/admin-dashbord/view-detail-cmd-admin.dart';
import 'package:partenaire/screens/admin-dashbord/view-partenaire-valid-screen.dart';
import 'package:partenaire/screens/admin-dashbord/view-partenaires-screen.dart';
import 'package:partenaire/screens/admin-restaurant/commande-screen.dart/view-detail-cmd.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashbordAdminScreen extends StatelessWidget {
  const DashbordAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminBloc = Provider.of<AdminBloc>(context);
    final partenaireAdminBloc = Provider.of<PartenaireAdmonBloc>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      backgroundColor: blanc,
      body: SizedBox(
        width: size.width,
        height: size.height,
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
                        'waped Admin'.toUpperCase(),
                        style: TextStyle(color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  GestureDetector(
                    onTap: () => adminBloc.setMenu(0),
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
                    onTap: () => adminBloc.setMenu(0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: adminBloc.menu == 0
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
                        'Partenaires',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => adminBloc.setMenu(1),
                    child: Container(
                      color: adminBloc.menu == 1 ? gris.withOpacity(.3) : blanc,
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
                                CupertinoIcons.person_3_fill,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'utilisateurs',
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
                    onTap: () => adminBloc.setMenu(2),
                    child: Container(
                      color: adminBloc.menu == 2 ? gris.withOpacity(.3) : blanc,
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
                                'commandes',
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
                            CupertinoIcons.square_list,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'offres speciales',
                            style: TextStyle(fontSize: 14, color: noir),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
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
                            CupertinoIcons.money_dollar,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'virements',
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
                    height: size.height * .05,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Text(
                        'Client',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => adminBloc.setMenu(4),
                    child: Container(
                      color: adminBloc.menu == 4 ? gris.withOpacity(.3) : blanc,
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
                                CupertinoIcons.person_3_fill,
                                size: 13,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'utilisateurs',
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
                  // SizedBox(
                  //   height: size.height * .01,
                  // ),
                  // Column(
                  //   children: [
                  //     const SizedBox(
                  //       height: 8,
                  //     ),
                  //     Row(
                  //       children: [
                  //         SizedBox(
                  //           width: size.width * .03,
                  //         ),
                  //         const Icon(
                  //           CupertinoIcons.square_list,
                  //           size: 13,
                  //         ),
                  //         const SizedBox(
                  //           width: 4,
                  //         ),
                  //         Text(
                  //           'commandes',
                  //           style: TextStyle(fontSize: 14, color: noir),
                  //         ),
                  //       ],
                  //     ),
                  //     const SizedBox(
                  //       height: 8,
                  //     ),
                  //   ],
                  // ),
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
                            CupertinoIcons.money_dollar,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'recharges',
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
                            CupertinoIcons.info_circle,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'réclamations',
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
                    height: size.height * .1,
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
                            CupertinoIcons.person_3_fill,
                            size: 13,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Administrateur',
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
                  child: adminBloc.menu == 0
                      ? const OverviewScreen()
                      : adminBloc.menu == 2
                          ? const ListeCommandeScreenAdmin()
                          : adminBloc.menu == 4
                              ? const ClientUtilisateurScreen()
                              : adminBloc.menu == 10
                                  ? ViewPartenaireScreen(
                                      partenaire:
                                          partenaireAdminBloc.partenaire!)
                                  : adminBloc.menu == 11
                                      ? ViewPartenaireValidScreen(
                                          partenaire:
                                              partenaireAdminBloc.partenaire!)
                                      : adminBloc.menu == 12
                                          ? const ViewDetailCmdAdminScreen()
                                          : const PartenaireUtilisateurScreen(),
                )),
          ],
        ),
      ),
      floatingActionButton: adminBloc.menu == 1
          ? FloatingActionButton.small(
              onPressed: () => null,
              backgroundColor: vertFonce,
              child: Icon(Icons.add, color: blanc),
            )
          : const SizedBox(),
    );
  }
}
