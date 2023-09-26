import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/bloc/admin-logement-bloc.dart';
import 'package:partenaire/bloc/update-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:provider/provider.dart';

class RecapLogementUpdate extends StatelessWidget {
  const RecapLogementUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final updateLogementBloc = Provider.of<UpdateLogementBloc>(context);
    final adminLogementBloc = Provider.of<AdminPartenaireBloc>(context);
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
                                updateLogementBloc.photoCouverture[1] ??
                                    updateLogementBloc.photoCouverture[2],
                                updateLogementBloc.photo1[1] ??
                                    updateLogementBloc.photo1[2],
                                updateLogementBloc.photo2[1] ??
                                    updateLogementBloc.photo2[2],
                                updateLogementBloc.photo3[1] ??
                                    updateLogementBloc.photo3[2],
                                updateLogementBloc.photo4[1] ??
                                    updateLogementBloc.photo4[2],
                              ]
                                  // ignore: unrelated_type_equality_checks
                                  .map((e) => e.runtimeType == String
                                      ? Image.network(
                                          e,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.memory(
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
                              updateLogementBloc.titreChambre.text,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: noir,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text(
                              "${updateLogementBloc.tarifNuit.text} (FGN) /nuits",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: noir,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(CupertinoIcons.placemark, size: 12),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              updateLogementBloc.adresse.text,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: noir,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width * .0),
                          child: SizedBox(
                            child: Text(
                              updateLogementBloc.descriptionLogement.text,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Commodités et instalations',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: noir,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: updateLogementBloc.commoditeGerenal
                                .map((e) => Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: GestureDetector(
                                        onTap: () => updateLogementBloc
                                            .setSelectedCommoditeGeneral(e),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: noir.withOpacity(.4)),
                                              child: Center(
                                                child: ImageIcon(
                                                  AssetImage(
                                                      e['url'] as String),
                                                  size: 20,
                                                  color: blanc,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              e['titre'] as String,
                                              style:
                                                  const TextStyle(fontSize: 8),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        if (updateLogementBloc.selectedCommoditeGeneral != null)
                          Column(
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    updateLogementBloc
                                            .selectedCommoditeGeneral!['titre']
                                        as String,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(
                                children: updateLogementBloc
                                    .selectedCommoditeGeneral!['sub']
                                    .map<Widget>((e) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: size.width * .025,
                                                ),
                                                Text(
                                                  e['titre'] as String,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                const Spacer(),
                                                ImageIcon(
                                                  AssetImage(
                                                      "assets/images/commodite/${e['commodite']}.png"),
                                                  size: 18,
                                                  color: noir,
                                                ),
                                                SizedBox(
                                                  width: size.width * .025,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              height: .5,
                                              width: size.width * .95,
                                              color: noir.withOpacity(.3),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  updateLogementBloc.changeMenuUpdate(3),
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
                                await updateLogementBloc.updateLogementFun();
                                if (updateLogementBloc.biensUpdate != null) {
                                  print("await adminLogementBloc.getAllBien()");
                                  await adminLogementBloc.getAllBien();
                                  adminLogementBloc.setMenu(2);
                                  updateLogementBloc.changeMenuUpdate(0);
                                  Navigator.popAndPushNamed(context, "/");
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
                                    updateLogementBloc.chargementUpdateFun
                                        ? CircularProgressIndicator(
                                            backgroundColor: noir,
                                            color: blanc,
                                          )
                                        : Text(
                                            "MODIFIER l'annonce".toUpperCase(),
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
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
