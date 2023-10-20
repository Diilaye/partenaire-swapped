import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/partenaire-bloc.dart';
import 'package:partenaire/screens/add-partenaire-screen.dart';
import 'package:partenaire/screens/faq-screen.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final partenaireBloc = Provider.of<PartenairesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: .0,
      ),
      backgroundColor: noir,
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  height: size.height * .4,
                  width: size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height * .4,
                        width: size.width,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/about-us.jpg"),
                                fit: BoxFit.cover)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: .0, sigmaY: .0),
                          child: Container(
                            decoration:
                                BoxDecoration(color: noir.withOpacity(0.5)),
                          ),
                        ),
                      ),
                      Positioned(
                          child: SizedBox(
                        height: size.height * .4,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Votre Portail de Confort en Afrique avec SwapeD!',
                              style: TextStyle(
                                  shadows: [
                                    BoxShadow(
                                        color: noir.withOpacity(.3),
                                        blurRadius: 3)
                                  ],
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: blanc),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: size.width * .8,
                              child: Text(
                                """Chez SwapeD, nous sommes passionnés par l'art de simplifier votre quotidien,\n de rendre vos déplacements plus fluides et vos expériences de voyage plus agréables que jamais en Afrique. \nNotre application mobile est méticuleusement conçue pour vous offrir un accès facile à une gamme complète de services, \ntous regroupés au même endroit, avec la simplicité et l'efficacité au cœur de notre vision. """,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    shadows: [
                                      BoxShadow(
                                          color: noir.withOpacity(.3),
                                          blurRadius: 3)
                                    ],
                                    color: blanc,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .5,
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Qui sommes-nous ?",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: blanc),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                child: Text(
                                  "SwapeD est propulsé par DEALLY SAS, une entreprise de droit guinéen basée à Kipé, Conakry. Forts de notre passion pour la technologie et de notre engagement envers votre confort, nous sommes fiers de vous présenter une solution qui révolutionne la manière dont vous vivez, voyagez et explorez. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: blanc),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      )),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/deally-about.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/why-swaped.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Pourquoi SwapeD ?",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: blanc),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                child: Text(
                                  "Chez SwapeD, nous croyons en la puissance de la simplicité. Notre application tout-en-un vous permet de passer sans effort d'un service à l'autre en un seul clic. Fini les jongleries entre différentes applications pour différents besoins ; tout ce dont vous avez besoin est à portée de main. Nous croyons également en l'économie circulaire, intégrant des auto-entrepreneurs aussi bien dans le secteur informel que formel. Nous sommes convaincus que la technologie peut être un catalyseur du développement économique et social. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: blanc),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .5,
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "EasyStay",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: blanc),
                          ),
                          Text(
                            "Explorez Chaque Pays d’Afrique en Toute Simplicité",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: blanc),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                child: Text(
                                  "Lancez-vous à l'aventure avec EasyStay, notre service de réservation d'hébergement. Des appartements chaleureux aux résidences de vacances charmantes, en passant par les séjours chez l'habitant et les hôtels élégants, nous avons l'endroit idéal pour chaque voyageur. Transformez chaque séjour en une expérience authentique, que vous voyagiez seul, en famille ou pour affaires. ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: blanc),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      )),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/easy-stay.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/FlavorSwift.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "FlavorSwift",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: blanc),
                          ),
                          Text(
                            "Des Délices Directement à Votre Porte",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: blanc),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .025,
                              ),
                              Expanded(
                                child: Text(
                                  "Découvrez la richesse culinaire de chaque continent avec FlavorSwift, associé à notre service de livraison de repas via GoRide. Savourez vos plats préférés sans quitter votre domicile, qu'il s'agisse de saveurs locales exquises ou de cuisines internationales alléchantes. De plus, localisez et réservez facilement une table dans les meilleurs restaurants pour des occasions spéciales ou des réunions familiales.  ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: blanc),
                                ),
                              ),
                              SizedBox(
                                width: size.width * .025,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .025),
                  child: Text(
                    "Rejoignez-nous dans cette passionnante aventure et explorez un nouveau monde de simplicité et de commodité. Simplifiez votre quotidien avec SwapeD dès aujourd'hui et laissez-nous être votre compagnon à chaque étape de votre voyage en Afrique ! ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: blanc),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                )
              ],
            ),
          ),
          Positioned(
              child: Container(
            height: 60,
            width: size.width,
            decoration: BoxDecoration(
              color: noir.withOpacity(1),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .025,
                      ),
                      ImageIcon(
                        const AssetImage("assets/images/swape.png"),
                        size: 20,
                        color: blanc,
                      ),
                      Text(
                        'waped'.toUpperCase(),
                        style: TextStyle(color: blanc),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorAPropos(),
                  onExit: (event) => partenaireBloc.exitHoverColorAPropos(),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/"),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Home'.toUpperCase(),
                          style: TextStyle(
                              color: partenaireBloc.colorHoverAPropos),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  child: GestureDetector(
                    onTap: () => null,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'A propos'.toUpperCase(),
                          style: TextStyle(color: blanc),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorPartenaire(),
                  onExit: (event) => partenaireBloc.exitHoverColorPartenaire(),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPartenaireScreen(),
                        )),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Devenir partenaire'.toUpperCase(),
                          style: TextStyle(
                              color: partenaireBloc.colorHoverPartenaire),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorFaq(),
                  onExit: (event) => partenaireBloc.exitHoverColorFaq(),
                  child: GestureDetector(
                    onTap: () => MaterialPageRoute(
                      builder: (context) => const FaqScreen(),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'FAQ',
                          style: TextStyle(color: partenaireBloc.colorHoverFaq),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MouseRegion(
                  onHover: (event) => partenaireBloc.setHoverColorLogin(),
                  onExit: (event) => partenaireBloc.exitHoverColorLogin(),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/login"),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Connexion'.toUpperCase(),
                          style:
                              TextStyle(color: partenaireBloc.colorHoverLogin),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
