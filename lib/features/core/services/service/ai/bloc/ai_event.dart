part of 'ai_bloc.dart';

@immutable
sealed class AiEvent {}

final class SearchEvent extends AiEvent {
  final String query;

  SearchEvent({required this.query});
}

final class GetMeasurementEvent extends AiEvent {}

final class CreateMeasurementEvent extends AiEvent {
  final String height;
  final String width;
  final File frontImage;
  final File sideImage;

  CreateMeasurementEvent(
      {required this.height,
      required this.width,
      required this.frontImage,
      required this.sideImage});
}
