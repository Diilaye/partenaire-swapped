import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/settings-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingBloc = Provider.of<SettingsBloc>(context);
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .005,
            ),
            Expanded(
                child: Container(
              // height: size.height * .5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: blanc,
                  boxShadow: [
                    BoxShadow(color: noir.withOpacity(.2), blurRadius: 1)
                  ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Expanded(
                          child: Text(
                        "Profile".toUpperCase(),
                        style: TextStyle(color: noir, fontSize: 16),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.nom,
                        decoration: InputDecoration(labelText: 'Nom'),
                      )),
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.prenom,
                        decoration: InputDecoration(labelText: 'Prénom'),
                      )),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.telOM,
                        decoration: InputDecoration(
                            labelText: 'Téléphone Orange Money'),
                      )),
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.telMOMO,
                        decoration:
                            InputDecoration(labelText: 'Téléphone Momo Mtn'),
                      )),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.identifiant,
                        readOnly: true,
                        decoration: InputDecoration(labelText: 'Identifiant'),
                      )),
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.email,
                        decoration: InputDecoration(labelText: 'Email'),
                      )),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Expanded(
                          child: TextField(
                        controller: settingBloc.oldPassword,
                        obscureText: settingBloc.viewPassword,
                        decoration: InputDecoration(
                            labelText: 'Encien mot de passe',
                            suffixIcon: IconButton(
                                onPressed: () => settingBloc.setViewPassword(),
                                icon: settingBloc.viewPassword
                                    ? const Icon(CupertinoIcons.eye_slash)
                                    : const Icon(CupertinoIcons.eye))),
                      )),
                      SizedBox(
                        width: size.width * .025,
                      ),
                      Expanded(
                          child: TextField(
                        obscureText: settingBloc.viewPassword,
                        controller: settingBloc.password,
                        decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            suffixIcon: IconButton(
                                onPressed: () => settingBloc.setViewPassword(),
                                icon: settingBloc.viewPassword
                                    ? const Icon(CupertinoIcons.eye_slash)
                                    : const Icon(CupertinoIcons.eye))),
                      )),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .195,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => settingBloc.updateProfile(),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue.withOpacity(1)),
                                child: Center(
                                  child: settingBloc.chargementProfile
                                      ? CircularProgressIndicator(
                                          color: blanc,
                                          backgroundColor:
                                              Colors.blue.withOpacity(1),
                                        )
                                      : Text(
                                          "Sauvegarder",
                                          style: TextStyle(color: blanc),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .005,
                          ),
                        ],
                      )),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )),
            SizedBox(
              width: size.width * .005,
            ),
          ],
        ),
        SizedBox(
          height: size.height * .04,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .005,
            ),
            Expanded(
                child: Container(
              // height: size.height * .4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: blanc,
                  boxShadow: [
                    BoxShadow(color: noir.withOpacity(.2), blurRadius: 1)
                  ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Text(
                        "Conditions d'annulations".toUpperCase(),
                        style: TextStyle(color: noir, fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Expanded(
                        child: Text(
                            "Veuillez indiquer les conditions d'annulation en spécifiant le pourcentage de remboursement le nombre de jours correspondant",
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: noir, fontSize: 20)),
                      ),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Text("1- Remboursement de ",
                          style: TextStyle(color: noir, fontSize: 16)),
                      Container(
                        color: noir,
                        width: 50,
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            width: 30,
                            child: TextField(
                              style: TextStyle(color: blanc),
                              controller: settingBloc.premierePorucentage,
                              decoration: InputDecoration(
                                  hintText: '100',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: blanc)),
                            ),
                          ),
                        ),
                      ),
                      Text(" % du montant * (HCS) si l'annulation à lieu ",
                          style: TextStyle(color: noir, fontSize: 16)),
                      Container(
                        color: noir,
                        width: 50,
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            width: 30,
                            child: TextField(
                              controller: settingBloc.premiereJour,
                              style: TextStyle(color: blanc),
                              decoration: InputDecoration(
                                  hintText: '30',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: blanc)),
                            ),
                          ),
                        ),
                      ),
                      Text(" jours avant la date de début de votre séjour",
                          style: TextStyle(color: noir, fontSize: 16))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Text("2- Remboursement de ",
                          style: TextStyle(color: noir, fontSize: 16)),
                      Container(
                        color: noir,
                        width: 50,
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            width: 30,
                            child: TextField(
                              controller: settingBloc.deuxiemePorucentage,
                              style: TextStyle(color: blanc),
                              decoration: InputDecoration(
                                  hintText: '70',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: blanc)),
                            ),
                          ),
                        ),
                      ),
                      Text(" % du montant * (HCS) si l'annulation à lieu ",
                          style: TextStyle(color: noir, fontSize: 16)),
                      Container(
                        color: noir,
                        width: 50,
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            width: 30,
                            child: TextField(
                              controller: settingBloc.deuxiemeJour,
                              style: TextStyle(color: blanc),
                              decoration: InputDecoration(
                                  hintText: '15',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: blanc)),
                            ),
                          ),
                        ),
                      ),
                      Text(" jours avant la date de début de votre séjour",
                          style: TextStyle(color: noir, fontSize: 16))
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * .005,
                      ),
                      Text("3- Remboursement de ",
                          style: TextStyle(color: noir, fontSize: 16)),
                      Container(
                        color: noir,
                        width: 50,
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            width: 30,
                            child: TextField(
                              controller: settingBloc.troisiemePorucentage,
                              style: TextStyle(color: blanc),
                              decoration: InputDecoration(
                                  hintText: '0',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: blanc)),
                            ),
                          ),
                        ),
                      ),
                      Text(" % du montant * (HCS) si l'annulation à lieu ",
                          style: TextStyle(color: noir, fontSize: 16)),
                      Container(
                        color: noir,
                        width: 50,
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            width: 25,
                            child: TextField(
                              controller: settingBloc.troisiemeJour,
                              style: TextStyle(color: blanc),
                              decoration: InputDecoration(
                                  hintText: '2',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: blanc)),
                            ),
                          ),
                        ),
                      ),
                      Text(" jours avant la date de début de votre séjour",
                          style: TextStyle(color: noir, fontSize: 16))
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                          child: Row(
                        children: [
                          SizedBox(
                            width: size.width * .195,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => settingBloc.updateAnulation(),
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue.withOpacity(1)),
                                child: Center(
                                  child: settingBloc.chargementAnulation
                                      ? CircularProgressIndicator(
                                          color: blanc,
                                          backgroundColor:
                                              Colors.blue.withOpacity(1),
                                        )
                                      : Text(
                                          "Sauvegarder",
                                          style: TextStyle(color: blanc),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .005,
                          ),
                        ],
                      )),
                      SizedBox(
                        width: size.width * .005,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            )),
            SizedBox(
              width: size.width * .005,
            ),
          ],
        ),
      ],
    );
  }
}
