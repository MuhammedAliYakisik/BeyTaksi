import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';
import 'package:izmir_taksi/data/repo/TaksiRepo.dart';

// Farklı durumlar için state sınıfları
abstract class AnasayfaState {}

class TaksiLoading extends AnasayfaState {}

class TaksiLoaded extends AnasayfaState {
  final Taksi taksi;
  TaksiLoaded(this.taksi);
}

class SearchResultsLoaded extends AnasayfaState {
  final List<String> searchResults;
  SearchResultsLoaded(this.searchResults);
}

class TaksiError extends AnasayfaState {
  final String message;
  TaksiError(this.message);
}

class AnasayfaCubit extends Cubit<AnasayfaState> {
  final TaksiRepo _repo;

  AnasayfaCubit(this._repo) : super(TaksiLoading());

  Future<void> fetchtaksi() async {
    emit(TaksiLoading());
    try {
      final taksiData = await _repo.fetchTaksi();
      emit(TaksiLoaded(taksiData));
    } catch (e) {
      emit(TaksiError("Veri alınırken internetten kaynaklı bir  hata oluştu: İnternete tekrar bağlanınız "));
    }
  }

  Future<void> fetchsearch(String aramaKelimesi) async {
    emit(TaksiLoading());
    try {
      final searchdata = await _repo.searchTitles(aramaKelimesi);
      emit(SearchResultsLoaded(searchdata));
    } catch (e) {
      emit(TaksiError("Arama sırasında bir hata oluştu: $e"));
    }
  }
}
