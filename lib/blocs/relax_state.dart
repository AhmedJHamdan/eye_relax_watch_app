part of 'relax_bloc.dart';

@immutable
sealed class RelaxState {}

final class RelaxInitial extends RelaxState {}

final class RelaxInProgress extends RelaxState {}

final class RelaxSuccess extends RelaxState {}
