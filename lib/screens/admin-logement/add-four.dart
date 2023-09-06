import 'package:flutter/material.dart';
import 'package:partenaire/bloc/add-logement-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class AddFourLogement extends StatelessWidget {
  const AddFourLogement({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final addLogementBloc = Provider.of<AddLogementBloc>(context);
    return ListView(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "conditions de réservation".toUpperCase(),
            style: const TextStyle(fontSize: 28),
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.nbreMinJour,
                decoration: const InputDecoration(
                    labelText: 'Nombre minimum de jour de réservation',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.tarif_nuit,
                decoration: const InputDecoration(
                    labelText: 'Tarif (GNF) / nuit',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                controller: addLogementBloc.tarif_locataire,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    labelText:
                        'Tarif par locataire supplémentaire ( 0 GNF recommandé)',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: addLogementBloc.tarif_femme_menagere,
                decoration: const InputDecoration(
                    labelText: 'Frais de ménage (0 GNF préconisé)',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                maxLines: 4,
                controller: addLogementBloc.descriptionLogement,
                onTap: () => addLogementBloc.setFirstClickDescription(),
                decoration: const InputDecoration(
                    labelText: "Description du logement",
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              width: size.width * .01,
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
              onTap: () => addLogementBloc.changeMenuAdd(2),
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
              onTap: () => addLogementBloc.changeMenuAdd(4),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: noir),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'visualiser l\'annonce'.toUpperCase(),
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
        SizedBox(
          height: size.height * .02,
        ),
      ],
    );
  }
}
