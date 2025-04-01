part of 'ai_bloc.dart';

@immutable
sealed class AiEvent {}

final class SearchEvent extends AiEvent {
  final String query;

  SearchEvent({required this.query});
}
