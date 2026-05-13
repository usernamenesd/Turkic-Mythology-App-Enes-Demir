import '../../domain/entities/myth_figure.dart';

abstract class MythState {}

class MythInitial extends MythState {}

class MythLoading extends MythState {}

class MythLoaded extends MythState {
  final List<MythFigure> figures;
  MythLoaded(this.figures);
}

class MythError extends MythState {
  final String message;
  MythError(this.message);
}
