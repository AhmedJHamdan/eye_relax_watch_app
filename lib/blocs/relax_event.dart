part of 'relax_bloc.dart';

@immutable
sealed class RelaxEvent {}

class RelaxEventStarted extends RelaxEvent {}

class RelaxStartButtonTapped extends RelaxEvent {}

class RelaxEventFinished extends RelaxEvent {}
