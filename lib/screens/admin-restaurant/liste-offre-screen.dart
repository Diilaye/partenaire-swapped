import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class ListeOffreSpecialScreen extends StatelessWidget {
  const ListeOffreSpecialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Liste des offres speciales '.toUpperCase(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Column(
          children: [
            GridView.count(
                crossAxisCount: 4,
                childAspectRatio: .8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: adminRestaurantBloc.listeOffres
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const HotelScreen(),
                            //     )),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: blanc,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        blurRadius: .5,
                                        color: noir.withOpacity(.2))
                                  ]),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Carousel(
                                            dotColor: blanc,
                                            autoplay: false,
                                            dotBgColor: Colors.transparent,
                                            dotSize: 6.0,
                                            dotSpacing: 20,
                                            boxFit: BoxFit.cover,
                                            images: [
                                              Image.network(
                                                e.galery!.url!,
                                                fit: BoxFit.cover,
                                              )
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: blanc,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                    child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            e.titre!,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: noir),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                      child: ListView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        children: [
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Text(
                                                            e.complements!
                                                                .map((et) =>
                                                                    et.name)
                                                                .toList()
                                                                .join(","),
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: noir),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Date debut : ${e.dateDebut!.split("T")[0].split("-").reversed.join("-")}  ',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: noir),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Jours promos : ${DateTime.parse(e.dateFin!).difference(DateTime.parse(e.dateDebut!)).inDays}  ',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: noir),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    //Modification after
                                                    // Row(
                                                    //   mainAxisAlignment:
                                                    //       MainAxisAlignment
                                                    //           .spaceAround,
                                                    //   children: [
                                                    //     GestureDetector(
                                                    //       onTap: () {
                                                    //         // adminRestaurantBloc
                                                    //         //     .setMenu(12);
                                                    //         // addPlatRestaurantBloc
                                                    //         //     .setPlatSelected(
                                                    //         //         e);
                                                    //       },
                                                    //       child: Container(
                                                    //         height: 30,
                                                    //         decoration:
                                                    //             BoxDecoration(
                                                    //           borderRadius:
                                                    //               BorderRadius
                                                    //                   .circular(
                                                    //                       4),
                                                    //           color: noir,
                                                    //         ),
                                                    //         child: Row(
                                                    //           children: [
                                                    //             SizedBox(
                                                    //               width: 8,
                                                    //             ),
                                                    //             Text(
                                                    //               'Modifier',
                                                    //               style: TextStyle(
                                                    //                   color:
                                                    //                       blanc),
                                                    //             ),
                                                    //             SizedBox(
                                                    //               width: 8,
                                                    //             ),
                                                    //           ],
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   ],
                                                    // )
                                                  ],
                                                )),
                                                Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: jaune,
                                                          size: 12,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          "4,9",
                                                          style: TextStyle(
                                                              fontSize: 11),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                )
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                  Positioned(
                                    top: 2,
                                    right: 2,
                                    child: Container(
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: blanc,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "${e.pourcentage}%",
                                            style: TextStyle(
                                                color: noir, fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList())
          ],
        ),
      ],
    );
  }
}
