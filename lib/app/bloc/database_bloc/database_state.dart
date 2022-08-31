part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object?> get props => [];
}

class DatabaseInitial extends DatabaseState {
  const DatabaseInitial();
}

class DatabaseSuccess extends DatabaseState {
  const DatabaseSuccess(this.listOfShirts);
  final List<Shirts> listOfShirts;

  @override
  List<Object?> get props => [listOfShirts];
}

class DatabaseError extends DatabaseState {
  @override
  List<Object?> get props => [];
}
