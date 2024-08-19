import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';

class TaksiRepo {
  final _baseurl = "https://acikveri.konya.bel.tr/tr/dataset/932586d2-6229-4384-904b-fb72fefb81ef/resource/5b11fcef-a100-4842-8e72-9eba0566aa76/download/taksi_duraklari.json";

  Future<Taksi> fetchTaksi() async {
    try {
      final response = await Dio().get(_baseurl);
      final data = response.data;

      if (data is String) {
        final jsonData = json.decode(data);
        return Taksi.fromJson(jsonData);
      } else if (data is Map<String, dynamic>) {
        return Taksi.fromJson(data);
      } else {
        throw Exception("Beklenmeyen veri formatı");
      }
    } catch (e) {
      print("Hata: $e");
      throw e;
    }
  }
}
