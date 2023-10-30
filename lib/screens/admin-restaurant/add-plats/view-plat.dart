import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:partenaire/bloc/restaurant/add-plats-restaurant-bloc.dart';
import 'package:partenaire/bloc/restaurant/admin-restaurant-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:partenaire/utils/price-format.dart';
import 'package:provider/provider.dart';

class ViewPlatScreen extends StatelessWidget {
  const ViewPlatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addPlatRestaurantBloc = Provider.of<AddPlatRestaurantBloc>(context);
    final adminRestaurantBloc = Provider.of<AdminRestaurantBloc>(context);

    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
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
                          height: size.height * .01,
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
                        Container(
                          height: 450,
                          width: 450,
                          child: Carousel(
                              boxFit: BoxFit.cover,
                              dotBgColor: blanc,
                              dotIncreasedColor: noir,
                              dotColor: noir,
                              images: [
                                addPlatRestaurantBloc.photo1[1],
                                addPlatRestaurantBloc.photo2[1]
                              ]
                                  .map((e) => Image.memory(
                                        e,
                                        fit: BoxFit.cover,
                                      ))
                                  .toList()),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              addPlatRestaurantBloc.nom.text,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: noir,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            addPlatRestaurantBloc.livrable == 0
                                ? Text("Livrable")
                                : Text("Sur place")
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              "${getFormatPrice(int.parse(addPlatRestaurantBloc.prix.text))} ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: noir,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width * .0),
                          child: SizedBox(
                            child: Text(
                              addPlatRestaurantBloc.description.text,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Complements plat',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w300))
                          ],
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        if (addPlatRestaurantBloc.listeComplement.length >= 1)
                          Column(
                            children: addPlatRestaurantBloc.listeComplement
                                .map((e) => Column(
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              e['ctrl'].text as String,
                                            ),
                                            const Spacer(),
                                            e['ctrlPrix'].text == "0"
                                                ? Text("Gratuit".toUpperCase())
                                                : Text(
                                                    '${getFormatPrice(int.parse(e['ctrlPrix'].text))} GNF '
                                                        .toUpperCase(),
                                                  ),
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      width: .5, color: rouge)),
                                              child: Center(
                                                child: Container(
                                                  height: 12,
                                                  width: 12,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: blanc),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * .025,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ))
                                .toList(),
                          ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => addPlatRestaurantBloc.setMenuAdd(0),
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
                              onTap: () async {
                                await addPlatRestaurantBloc.addPlats();
                                if (addPlatRestaurantBloc.result != null) {
                                  Fluttertoast.showToast(
                                      msg: "plats ajouté avec succes",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 3,
                                      webPosition: "center",
                                      webBgColor:
                                          "linear-gradient(to right, #2E8C1F, #2E8C1F)",
                                      fontSize: 14.0);
                                  adminRestaurantBloc.getAllPlats();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Une Erreur a été detecté",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 3,
                                      webPosition: "center",
                                      webBgColor:
                                          "linear-gradient(to right, #9D0208, #9D0208)",
                                      fontSize: 14.0);
                                }
                              },
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
                                    addPlatRestaurantBloc.chargementAddPlats ==
                                            true
                                        ? CircularProgressIndicator()
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
