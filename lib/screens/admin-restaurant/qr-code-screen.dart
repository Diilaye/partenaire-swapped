import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:partenaire/bloc/restaurant/qr-code-bloc.dart';
import 'package:partenaire/utils/colors-by-dii.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class QrcodeRestaurantScreen extends StatefulWidget {
  const QrcodeRestaurantScreen({super.key});

  @override
  State<QrcodeRestaurantScreen> createState() => _QrcodeRestaurantScreenState();
}

class _QrcodeRestaurantScreenState extends State<QrcodeRestaurantScreen> {
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final qrCodeBloc = Provider.of<QrcodeBloc>(context);
    return Column(
      children: [
        SizedBox(
          height: size.height * .02,
        ),
        SizedBox(
          height: 70,
          child: Row(
            children: [
              // Expanded(
              //     child: GestureDetector(
              //   onTap: () => qrCodeBloc.setTypeQr(0),
              //   child: Container(
              //     color: qrCodeBloc.typeQr == 0 ? noir : blanc,
              //     child: Center(
              //       child: Text(
              //         'Qr code Restaurant ',
              //         style: TextStyle(
              //             color: qrCodeBloc.typeQr == 0 ? blanc : noir),
              //       ),
              //     ),
              //   ),
              // )),
              Expanded(
                  child: GestureDetector(
                onTap: () => qrCodeBloc.setTypeQr(1),
                child: Container(
                  color: qrCodeBloc.typeQr == 1 ? noir : blanc,
                  child: Center(
                    child: Text(
                      'Qr code Table',
                      style: TextStyle(
                          color: qrCodeBloc.typeQr == 1 ? blanc : noir),
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: size.height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * .01,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: qrCodeBloc.numeroTable,
                decoration: const InputDecoration(
                    labelText: 'Numero de table',
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
          height: size.height * .05,
        ),
        Center(
          child: qrCodeBloc.resto == null
              ? CircularProgressIndicator(
                  backgroundColor: blanc,
                  color: noir,
                )
              : RepaintBoundary(
                  key: globalKey,
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Stack(
                      children: [
                        QrImageView(
                          data:
                              "https://swapp.deally.fr?service=restaurant&idresto=${qrCodeBloc.resto!.id!}&table=${qrCodeBloc.numeroTable.text}",
                          version: QrVersions.auto,
                          backgroundColor: blanc,
                          eyeStyle: QrEyeStyle(
                              eyeShape: QrEyeShape.circle, color: noir),
                          size: 300,
                        ),
                        Center(
                          child: Container(
                            height: 60,
                            width: 60,
                            color: noir,
                            child: Center(
                              child: Image.asset(
                                "assets/images/swape.png",
                                color: blanc,
                                width:
                                    45.0, // Ajustez la taille du logo selon vos besoins
                                height: 45.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        SizedBox(
          height: size.height * .1,
        ),
        Center(
          child: GestureDetector(
            onTap: () => qrCodeBloc.uplodarQr(context, globalKey),
            child: Container(
              height: 60,
              width: size.width * .2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: noir),
              child: Center(
                child: qrCodeBloc.chargementUpload
                    ? CircularProgressIndicator(
                        backgroundColor: blanc,
                        color: noir,
                      )
                    : Text(
                        'Générer le qr-code',
                        style: TextStyle(color: blanc),
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
