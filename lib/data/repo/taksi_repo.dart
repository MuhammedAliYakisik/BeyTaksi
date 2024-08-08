import 'package:dio/dio.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';

class TaksiRepo {
  List<Taksi>? _items;

  final _baseurl = "https://openapi.izmir.bel.tr/api/ibb/cbs/taksiduraklari";

  Future<List<Taksi>> fetchitems() async {
    try {
      final response = await Dio().get(_baseurl);
      if(response.statusCode == 200) {
        final _datas =response.data;
        if(_datas is List){
          _items = _datas.map((e)=> Taksi.fromJson(e)).toList();
        }

      }else {
        throw Exception("failed load data");
      }

    }catch(e) {
      print("hata $e");
    }
    return _items ?? [];
  }

}