import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';
import 'package:izmir_taksi/data/repo/taksi_repo.dart';

class AnasayfaCubit extends Cubit<Taksi> {
  final TaksiRepo _repo;

  AnasayfaCubit(this._repo) : super(Taksi());

  Future<void> fetchtaksi() async {
    try {
      final taksiData = await _repo.fetchTaksi();
      emit(taksiData);
    } catch (e) {
      print("Hata: $e");
    }
  }

  Future<void> fetchsearch(String aramas) async {
    try {
      final searchdata = await _repo.searchTitles(aramas);
      emit(searchdata as Taksi);
    } catch (e) {
      print("Hata: $e");
    }
  }
}
