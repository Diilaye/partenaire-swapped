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
        body: Stack(
          children: [
            Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg.jpeg"),
                        fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: .0, sigmaY: .0),
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                )),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black.withOpacity(.1),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  SizedBox(
                    height: size.height * .45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logement, Restauration et Mobilité  avec SwapeD'
                            .toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * .03,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Se sentir chez soit, ou Que je soi'.toUpperCase(),
                        style: TextStyle(
                            fontSize: size.width * .02,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: size.width * .95,
                    color: blanc,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: size.width * .9,
                          child: TextField(
                            cursorColor: Colors.black,
                            controller: authBloc.identifiant,
                            decoration: const InputDecoration(
                                labelText: 'Identifiant',
                                labelStyle: TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: size.width * .9,
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
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                focusColor: Colors.black,
                                fillColor: Colors.black,
                                border: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => authBloc.loginFunction(context),
                              child: Container(
                                height: 50,
                                width: 240,
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
                                                fontSize: 16,
                                                color: Colors.white),
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
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
