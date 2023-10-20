import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:partenaire/bloc/auth-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: .0,
          elevation: .0,
        ),
        backgroundColor: blanc,
        body: Column(
          children: [
            SizedBox(
              height: 60,
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
                          color: noir,
                        ),
                        Text(
                          'waped'.toUpperCase(),
                          style: TextStyle(color: noir),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Text(
              'Connectez-vous à votre compte',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Content de vous revoir! Veuillez entrer vos coordonnées',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SizedBox(
              width: size.width * .3,
              height: 60,
              child: TextField(
                cursorColor: Colors.black,
                controller: authBloc.identifiant,
                decoration: const InputDecoration(
                    labelText: 'Identifiant',
                    labelStyle: TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: size.width * .3,
              height: 60,
              child: TextField(
                cursorColor: Colors.black,
                controller: authBloc.password,
                obscureText: authBloc.viewPassword,
                decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    suffixIcon: IconButton(
                      onPressed: () => authBloc.setViewPassword(),
                      icon: authBloc.viewPassword
                          ? const Icon(CupertinoIcons.eye_slash)
                          : const Icon(CupertinoIcons.eye),
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                    focusColor: Colors.black,
                    fillColor: Colors.black,
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => authBloc.loginFunction(context),
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 2,
                              color: Colors.white.withOpacity(.2))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        authBloc.chargement
                            ? CircularProgressIndicator(
                                backgroundColor: noir,
                                color: blanc,
                              )
                            : const Text(
                                "Se connecter",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
