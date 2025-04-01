part of 'ai_bloc.dart';

@immutable
sealed class AiState extends Equatable {
  @override
  List<Object> get props => [];
}

final class AiInitial extends AiState {}

final class AiLoading extends AiState {}

final class SearchSuccess extends AiState {
  final List<Product> products;

  SearchSuccess({required this.products});
}

final class SearchError extends AiState {
  final String error;

  SearchError({required this.error});
}
