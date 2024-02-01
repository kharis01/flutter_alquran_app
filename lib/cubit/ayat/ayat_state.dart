part of 'ayat_cubit.dart';

abstract class AyatState extends Equatable {
  const AyatState();

  @override
  List<Object> get props => [];
}

class AyatInitial extends AyatState {}

class AyatLoading extends AyatState {}

class Ayatloaded extends AyatState {
  final DetailSurahModel detail;

  const Ayatloaded({required this.detail});

  @override
  List<Object> get props => [detail];
}

class AyatError extends AyatState {
  final String message;

  const AyatError({required this.message});

  @override
  List<Object> get props => [message];
}
