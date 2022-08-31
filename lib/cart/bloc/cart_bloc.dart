import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/cart/models/cart_model.dart';
import 'package:ecommercial/cart/models/cart_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartShirtsAdded>(_onShirtAdded);
    on<CartShirtsRemoved>(_onShirtRemoved);
  }

  final ShoppingRepository shoppingRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final shirts = await shoppingRepository.loadCartshirts();
      emit(CartLoaded(cart: Cart(shirts: [...shirts])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onShirtAdded(
    CartShirtsAdded event,
    Emitter<CartState> emit,
  ) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addShirtsToCart(event.shirts);
        emit(
          CartLoaded(cart: Cart(shirts: [...state.cart.shirts, event.shirts])),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onShirtRemoved(CartShirtsRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeShirtsFromCart(event.shirts);
        emit(
          CartLoaded(
            cart: Cart(
              shirts: [...state.cart.shirts]..remove(event.shirts),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
