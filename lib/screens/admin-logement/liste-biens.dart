import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class ListeBiensScreen extends StatelessWidget {
  const ListeBiensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final logementBloc = Provider.of<AdminPartenaireBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Liste des logements'.toUpperCase(),
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
                children: logementBloc.listeBien
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
                                              images: e.galery!
                                                  .map(
                                                    (ev) => Image.network(
                                                      ev.url!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                  .toList())),
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
                                                        Text(
                                                          e.titre!,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: noir),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          e.adresse!,
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: noir),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Nombre de nuits min : ${e.nbreMinNuit} nuits ',
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: noir),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          '${e.tarif} FGN / nuit',
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              color: noir),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                                // Column(
                                                //   children: [
                                                //     const SizedBox(
                                                //       height: 4,
                                                //     ),
                                                //     Row(
                                                //       children: [
                                                //         Icon(
                                                //           Icons.star,
                                                //           color: jaune,
                                                //           size: 12,
                                                //         ),
                                                //         SizedBox(
                                                //           width: 4,
                                                //         ),
                                                //         Text(
                                                //           "4,9",
                                                //           style: TextStyle(
                                                //               fontSize: 11),
                                                //         )
                                                //       ],
                                                //     )
                                                //   ],
                                                // ),
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
                                            e.typeLogement!,
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