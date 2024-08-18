import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';

class TaksiRepo {
  List<Taksi>? _items;

  final _baseurl = "https://acikveri.beyoglu.bel.tr/api/c0358-d8851";

  Future<List<Taksi>> fetchitems() async {
    try {
      final response = await Dio().get(_baseurl);

      final data = response.data;

      List<dynamic> jsonData;

      if (data is String) {
        jsonData = json.decode(data);

      } else if (data is List) {
        jsonData = data;

      } else {
        throw Exception("Beklenmeyen veri formatı");
      }

      _items = jsonData.map((e) => Taksi.fromJson(e)).toList();
    } catch (e) {
      print("Hata: $e");
    }
    return _items ?? [];
  }
}
