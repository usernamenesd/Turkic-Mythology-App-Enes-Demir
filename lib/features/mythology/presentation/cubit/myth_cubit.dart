import 'package:flutter_bloc/flutter_bloc.dart';
import 'myth_state.dart';
import '../../domain/entities/myth_figure.dart';

class MythCubit extends Cubit<MythState> {
  MythCubit() : super(MythInitial());

  void fetchFigures() async {
    emit(MythLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      ); // Yükleniyor efekti için

      final data = [
        MythFigure(
          name: "Tulpar",
          description: "Kanatlı efsanevi at.",
          imageUrl: "https://via.placeholder.com/150",
        ),
        MythFigure(
          name: "Umay Ana",
          description: "Doğum ve bereket tanrıçası.",
          imageUrl: "https://via.placeholder.com/150",
        ),
      ];

      emit(MythLoaded(data));
    } catch (e) {
      emit(MythError("Bir hata oluştu!"));
    }
  }
}
