import 'dart:async';

import 'package:database_repo/database_repo.dart';

const _delay = Duration(milliseconds: 800);

class ShoppingRepository {
  final _shirts = <Shirts>[];

  Future<List<Shirts>> loadCartshirts() =>
      Future.delayed(_delay, () => _shirts);

  void addShirtsToCart(Shirts shirts) => _shirts.add(shirts);

  void removeShirtsFromCart(Shirts shirts) => _shirts.remove(shirts);
}
