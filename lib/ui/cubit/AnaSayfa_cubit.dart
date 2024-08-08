import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izmir_taksi/data/model/Taksi.dart';
import 'package:izmir_taksi/data/repo/taksi_repo.dart';

class AnasayfaCubit extends Cubit<List<Taksi>> {
  AnasayfaCubit() : super([]);

  final trepo = TaksiRepo();

  Future<void> fetchtaksi()async {
    var liste = await trepo.fetchitems();
    emit(liste);
  }

}