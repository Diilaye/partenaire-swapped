import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/utils/colors-by-dii.dart';

class SuccessPaiementScreen extends StatelessWidget {
  const SuccessPaiementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        toolbarHeight: .0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/swape.png",
                height: 25,
              ),
              Text(
                "wApp",
                style: TextStyle(fontSize: 25, color: noir),
              )
            ],
          ),
          SizedBox(
            height: size.height * .05,
          ),
          Center(
            child: Container(
              height: size.height * .4,
              width: size.height * .4,
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.4),
                  borderRadius: BorderRadius.circular(1000)),
              child: Center(
                child: Container(
                  height: size.height * .3,
                  width: size.height * .3,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.6),
                      borderRadius: BorderRadius.circular(1000)),
                  child: Center(
                    child: Container(
                      height: size.height * .2,
                      width: size.height * .2,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(.8),
                          borderRadius: BorderRadius.circular(1000)),
                      child: Center(
                        child: Container(
                          height: size.height * .1,
                          width: size.height * .1,
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(.1),
                              borderRadius: BorderRadius.circular(1000)),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.check_mark,
                              size: size.height * .08,
                              color: blanc,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          const Center(
            child: Text(
              'Succès',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: size.height * .01,
          ),
          const Center(
            child: Text(
              ' votre paiement c’est trés bien passer pour les details veriffier votre profil .',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
