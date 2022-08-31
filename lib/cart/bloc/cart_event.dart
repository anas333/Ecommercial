part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartShirtsAdded extends CartEvent {
  const CartShirtsAdded(this.shirts);

  final Shirts shirts;

  @override
  List<Object> get props => [shirts];
}

class CartShirtsRemoved extends CartEvent {
  const CartShirtsRemoved(this.shirts);

  final Shirts shirts;

  @override
  List<Object> get props => [shirts];
}
