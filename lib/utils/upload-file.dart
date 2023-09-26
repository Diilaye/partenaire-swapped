import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:partenaire/utils/requette-by-dii.dart';

// ignore: invalid_use_of_visible_for_testing_member
Future getImage(int source) async => ImagePicker.platform
        // ignore: deprecated_member_use
        .getImage(
            imageQuality: 100,
            source: source == 1 ? ImageSource.gallery : ImageSource.camera)
        .then((value) async {
      if (value == null) {
        return [null, null, null];
      }
      print("vous etes icie");
      return [await postpIC(image: value), await value.readAsBytes(), null];
    });

Future<String> postpIC({required XFile image}) async {
  var img = await (image).readAsBytes();

  Map<String, dynamic> body = {
    "image": "data:image/webp;base64,${base64Encode(img)}"
  };

  var response = await postResponse(url: '/files', body: body);

  if (response['status'] == 200) {
    return response['body']['data']['id'];
  } else {
    return "0";
  }
}
