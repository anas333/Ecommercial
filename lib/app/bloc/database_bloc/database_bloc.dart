import 'package:bloc/bloc.dart';
import 'package:database_repo/database_repo.dart';
import 'package:equatable/equatable.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc({required CloudFirestore cloudFirestore})
      : _cloudFirestore = cloudFirestore,
        super(const DatabaseInitial()) {
    on<DatabaseFetched>(_fetchShirts);
  }
  final CloudFirestore _cloudFirestore;

  Future<void> _fetchShirts(
    DatabaseFetched event,
    Emitter<DatabaseState> emit,
  ) async {
    // ignore: omit_local_variable_types
    final List<Shirts> listofshirts = await _cloudFirestore.getShirts();
    emit(DatabaseSuccess(listofshirts));
  }
}
