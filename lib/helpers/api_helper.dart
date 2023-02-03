import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/astrology.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();

  Future getAstrologyData(
      {required String sunShine, required String day}) async {
    http.Response response = await http.post(
        Uri.parse("https://aztro.sameerkumar.website?sign=$sunShine&day=$day"),
        headers: {
          "X-RapidAPI-Key":
              "861cbde6b6msh169f1c05b026b0ep1c0e76jsn39aa40e13d1f",
          "X-RapidAPI-Host": "sameer-kumar-aztro-v1.p.rapidapi.com",
        });
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      Astrology astrology =  Astrology.fromAPI(data: decodedData);

      return astrology;
    }
    return null;
  }
}
