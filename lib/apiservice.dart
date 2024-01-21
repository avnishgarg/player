import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:player/constants.dart';
import 'package:player/models/songinfo/song_info.dart';
import 'package:player/models/songresults/song_results.dart';

class ApiService {
  Future<SongResults> getSongs() async {
    SongResults model = SongResults();
    try {
      var url = Uri.parse(baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        model = SongResults.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }
  Future<SongInfo> getSongInfo(int id) async {
    SongInfo model = SongInfo();
    try {
      String newUrl = sonInfoUrl.replaceAll('{id}', id.toString());
      var url = Uri.parse(newUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        model = SongInfo.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return model;
  }
}
