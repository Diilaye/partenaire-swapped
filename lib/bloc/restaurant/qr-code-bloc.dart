import 'package:flutter/material.dart';
import 'package:partenaire/models/restaurant-model.dart';
import 'package:partenaire/services/restaurant-service.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

class QrcodeBloc with ChangeNotifier {
  int typeQr = 1;

  Restaurantmodel? resto;

  RestaurantService restaurantService = RestaurantService();

  TextEditingController numeroTable = TextEditingController();

  getResto() async {
    resto = await restaurantService.getResto();
    notifyListeners();
  }

  QrcodeBloc() {
    getResto();
  }

  bool chargementUpload = false;

  uplodarQr(context, globalKey) async {
    chargementUpload = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 3), () async {
      final boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 10.0);
      image.toByteData(format: ui.ImageByteFormat.png).then((byteData) {
        final buffer = byteData?.buffer.asUint8List();
        final blob = html.Blob([buffer]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..target = 'webdownload'
          ..download = 'table-${numeroTable.text}-qrcode.png'
          ..click();
        html.Url.revokeObjectUrl(url);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("QR Code téléchargé avec succès"),
        ),
      );
      chargementUpload = false;
      notifyListeners();
    });
  }

  setTypeQr(int select) {
    typeQr = select;
    notifyListeners();
  }
}
