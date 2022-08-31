import 'package:database_repo/database_repo.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({this.shirts = const <Shirts>[]});

  final List<Shirts> shirts;

  int get totalPrice =>
      shirts.fold(0, (total, current) => total + current.shirtPrice);

  void addItemToCart(Shirts item) => shirts.add(item);

  void removeItemFromCart(Shirts item) => shirts.remove(item);

  @override
  List<Object> get props => [shirts];
}
