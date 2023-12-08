import 'package:flutter/material.dart';
import 'package:partenaire/bloc/restaurant/add-offre-special-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:provider/provider.dart';

class ViewOffresScreen extends StatelessWidget {
  const ViewOffresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addOffreSpecialBloc = Provider.of<AddOffreSpecialBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Row(
          children: [
            const SizedBox(
              width: 8,
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
                child: Center(
                  child: SizedBox(
                    width: 450,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            'récapitulatif de votre annonce'.toUpperCase(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: blanc,
                                  boxShadow: [
                                    BoxShadow(
                                        color: noir.withOpacity(.4),
                                        blurRadius: .5)
                                  ]),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        addOffreSpecialBloc.titre.text,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            shadows: [
                                              BoxShadow(
                                                  color: blanc, blurRadius: 2)
                                            ],
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: noir),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      ...addOffreSpecialBloc.listeComplement
                                          .map(
                                            (e) => e['ctrl'].text == ""
                                                ? const SizedBox()
                                                : Text(
                                                    e['ctrl'].text,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        shadows: [
                                                          BoxShadow(
                                                              color: blanc,
                                                              blurRadius: 2)
                                                        ],
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: noir),
                                                  ),
                                          )
                                          .toList()
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Container(
                                        height: 80,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: MemoryImage(
                                                    addOffreSpecialBloc
                                                        .photo[1]))),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: noir.withOpacity(.3))
                                      ],
                                      borderRadius: BorderRadius.circular(50),
                                      color: blanc),
                                  child: Center(
                                      child: Text(
                                    '${addOffreSpecialBloc.pourcentage.text}%',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  )),
                                )),
                            Positioned(
                                top: -6,
                                right: -6,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 2,
                                            color: noir.withOpacity(.3))
                                      ],
                                      borderRadius: BorderRadius.circular(50),
                                      color: rouge),
                                  child: Center(
                                      child: Text(
                                    '-${addOffreSpecialBloc.dateEnd!.difference(addOffreSpecialBloc.dateOpen!).inDays} jours',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: blanc,
                                        fontSize: 8),
                                  )),
                                )),
                            Positioned(
                                bottom: 2,
                                left: 0,
                                child: SizedBox(
                                  height: 45,
                                  width: size.width * .95,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          "${getAllPriceOffre(addOffreSpecialBloc.selectedPlats, addOffreSpecialBloc.listeComplement, (double.parse(addOffreSpecialBloc.pourcentage.text) / 100))}"),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Container(),
                                              // const CheckoutOffreSpecialScreen(),
                                            )),
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: noir),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Commader Maintenant"
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color: blanc, fontSize: 8),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        // if (addOffreSpecialBloc.listeComplement.length > 1)
                        //   Column(
                        //     children: [
                        //       SizedBox(
                        //         height: size.height * .02,
                        //       ),
                        //       const Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Text('Complements offres',
                        //               style: TextStyle(
                        //                   fontSize: 18,
                        //                   fontWeight: FontWeight.w300))
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // SizedBox(
                        //   height: size.height * .01,
                        // ),
                        // if (addOffreSpecialBloc.listeComplement.length > 1)
                        //   Column(
                        //     children: addOffreSpecialBloc.listeComplement
                        //         .map((e) => Column(
                        //               children: [
                        //                 const SizedBox(
                        //                   height: 4,
                        //                 ),
                        //                 Row(
                        //                   children: [
                        //                     Text(
                        //                       e['ctrl'].text as String,
                        //                     ),
                        //                     const Spacer(),
                        //                     e['ctrlPrix'].text == "0"
                        //                         ? Text("Gratuit".toUpperCase())
                        //                         : Text(
                        //                             '${getFormatPrice(int.parse(e['ctrlPrix'].text))} GNF '
                        //                                 .toUpperCase(),
                        //                           ),
                        //                     Container(
                        //                       height: 15,
                        //                       width: 15,
                        //                       decoration: BoxDecoration(
                        //                           borderRadius:
                        //                               BorderRadius.circular(30),
                        //                           border: Border.all(
                        //                               width: .5, color: rouge)),
                        //                       child: Center(
                        //                         child: Container(
                        //                           height: 12,
                        //                           width: 12,
                        //                           decoration: BoxDecoration(
                        //                               borderRadius:
                        //                                   BorderRadius.circular(
                        //                                       30),
                        //                               color: blanc),
                        //                         ),
                        //                       ),
                        //                     ),
                        //                     SizedBox(
                        //                       width: size.width * .025,
                        //                     )
                        //                   ],
                        //                 ),
                        //                 const SizedBox(
                        //                   height: 4,
                        //                 ),
                        //               ],
                        //             ))
                        //         .toList(),
                        //   ),
                        SizedBox(
                          height: size.height * .05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => addOffreSpecialBloc.setAddMenu(0),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: noir),
                                    color: blanc),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      'étape precedent'.toUpperCase(),
                                      style: TextStyle(color: noir),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  addOffreSpecialBloc.addOffre(context),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: noir),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    addOffreSpecialBloc.chargementAdd
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Text(
                                            "Publier l'annonce".toUpperCase(),
                                            style: TextStyle(color: blanc),
                                          ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        )),
      ],
    );
  }
}
