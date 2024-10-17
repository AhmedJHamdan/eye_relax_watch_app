import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'relax_event.dart';
part 'relax_state.dart';

class RelaxBloc extends Bloc<RelaxEvent, RelaxState> {
  RelaxBloc() : super(RelaxInitial()) {
    on<RelaxEventStarted>((event, emit) {
      emit(RelaxInitial());
    });
    on<RelaxStartButtonTapped>((event, emit) {
      emit(RelaxInProgress());
    });
    on<RelaxEventFinished>((event, emit) {
      emit(RelaxSuccess());
    });
  }
}
