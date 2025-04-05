part of 'ai_bloc.dart';

@immutable
sealed class AiState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AiInitial extends AiState {}

final class AiLoading extends AiState {}
final class SearchLoading extends AiState {}
final class GetMeasurementLoading extends AiState {}

final class SearchSuccess extends AiState {
  final List<Product> products;

  SearchSuccess({required this.products});
}

final class SearchError extends AiState {
  final String error;

  SearchError({required this.error});
}

final class GetMeasurementSuccess extends AiState {
  final Measurement measurement;

  GetMeasurementSuccess({required this.measurement});
}

final class GetMeasurementError extends AiState {
  final String error;

  GetMeasurementError({required this.error});
}

final class CreateMeasurementSuccess extends AiState {}

final class CreateMeasurementError extends AiState {
  final String error;

  CreateMeasurementError({required this.error});
}
