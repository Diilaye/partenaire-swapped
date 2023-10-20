import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/screens/admin-restaurant/add-offre-screen.dart';
import 'package:partenaire/screens/admin-restaurant/add-offre-special/add-offre.dart';
import 'package:partenaire/screens/admin-restaurant/add-plats-screen.dart';
import 'package:partenaire/screens/admin-restaurant/liste-offre-screen.dart';
import 'package:partenaire/screens/admin-restaurant/liste-plats.dart';
import 'package:partenaire/screens/admin-restaurant/modifier-plats.dart';
import 'package:partenaire/screens/admin-restaurant/overview-screen.dart';
import 'package:partenaire/screens/admin-restaurant/parametre-restaurant-screen.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/requette-dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashbordRestaurant extends StatelessWidget {
  const DashbordRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final restaurantAdminBloc = Provider.of<AdminRestaurantBloc>(context);

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
                        'waped Restaurant'.toUpperCase(),
                        style: TextStyle(color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  GestureDetector(
                    onTap: () => restaurantAdminBloc.setMenu(0),
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
                    onTap: () => restaurantAdminBloc.setMenu(0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: restaurantAdminBloc.menu == 0
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
                        'Plats',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => restaurantAdminBloc.setMenu(1),
                    child: Container(
                      color: restaurantAdminBloc.menu == 1
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
                    onTap: () => restaurantAdminBloc.setMenu(2),
                    child: Container(
                      color: restaurantAdminBloc.menu == 2
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
                        'Offres Spéciales',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => restaurantAdminBloc.setMenu(3),
                    child: Container(
                      color: restaurantAdminBloc.menu == 3
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
                    onTap: () => restaurantAdminBloc.setMenu(4),
                    child: Container(
                      color: restaurantAdminBloc.menu == 4
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
                        'Commandes',
                        style: TextStyle(fontSize: 14, color: noir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => restaurantAdminBloc.setMenu(5),
                    child: Container(
                      color: restaurantAdminBloc.menu == 5
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
                  SizedBox(
                    height: size.height * .01,
                  ),
                  GestureDetector(
                    onTap: () => restaurantAdminBloc.setMenu(6),
                    child: Container(
                      color: restaurantAdminBloc.menu == 6
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
                    onTap: () => restaurantAdminBloc.setMenu(9),
                    child: Container(
                      color: restaurantAdminBloc.menu == 9
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
                    child: restaurantAdminBloc.menu == 0
                        ? const OverViewScreenRestaurantAdmin()
                        : restaurantAdminBloc.menu == 1
                            ? const AddPlatsScreen()
                            : restaurantAdminBloc.menu == 2
                                ? const ListePlatsScreen()
                                : restaurantAdminBloc.menu == 3
                                    ? const AddOffreScreen()
                                    : restaurantAdminBloc.menu == 4
                                        ? const ListeOffreSpecialScreen()
                                        : restaurantAdminBloc.menu == 9
                                            ? const ParametreRestaurantScreen()
                                            : restaurantAdminBloc.menu == 12
                                                ? const UpdatePlatsScreen()
                                                : Container())),
          ],
        ),
      ),
    );
  }
}
