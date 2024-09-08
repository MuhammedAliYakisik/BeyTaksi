import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';

class TaksiRepo {
  final _baseurl = "https://acikveri.konya.bel.tr/tr/dataset/932586d2-6229-4384-904b-fb72fefb81ef/resource/5b11fcef-a100-4842-8e72-9eba0566aa76/download/taksi_duraklari.json";

  Future<Taksi> fetchTaksi() async {
    try {
      final response = await Dio().get(_baseurl);
      final data = response.data;
      print("${data.runtimeType}");
      if (data is String) {
        final jsonData = json.decode(data);
        return Taksi.fromJson(jsonData);
      } else if (data is Map<String, dynamic>) {
        return Taksi.fromJson(data);
      } else {
        throw Exception("Beklenmeyen veri formatı ${data.runtimeType}");
      }
    } catch (e) {
      print("Hata: $e");
      throw e;
    }
  }

  Future<List<String>> searchTitles(String query) async {
    try {
      final response = await Dio().get(_baseurl);
      final data = response.data;
      print("${data.runtimeType}");
      if (data is Map<String, dynamic>) {
        final List<dynamic> contents = data['data'][0]['sub_categories'][0]['contents'];
        final List<String> titles = contents
            .map((content) => content['title'] as String)
            .toList();
        return titles.where((title) => title.toLowerCase().contains(query.toLowerCase())).toList();
      } else {
        throw Exception("Beklenmeyen veri formatı ${data.runtimeType}");
      }
    } catch (e) {
      print("Hata: $e");
      throw e;
    }
  }
}
