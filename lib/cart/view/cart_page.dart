import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: MyListCartPage(),
          ),
          const Divider(
            height: 2,
            color: Colors.blueGrey,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int price;
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                price = state.cart.totalPrice;
                return Container(
                  padding: const EdgeInsets.all(20),
                  height: 100,
                  child: Text(
                    'TOTAL PRICE: $price \$',
                    style:
                        const TextStyle(fontSize: 20, color: Colors.blueGrey),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}

class MyListCartPage extends StatelessWidget {
  const MyListCartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Shirts> _shirts;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          _shirts = state.cart.shirts;
          return ListView.builder(
            itemCount: state.cart.shirts.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      _shirts[index].shirtImg,
                      height: 100,
                      width: 100,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _shirts[index].shirtName,
                          style:
                              const TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        Text(
                          '${_shirts[index].shirtPrice} \$',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/assets/imgs/fabric2.jpg'),
                            colorFilter: ColorFilter.mode(
                              Color.fromARGB(255, 42, 104, 119),
                              BlendMode.multiply,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'remove',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        context
                            .read<CartBloc>()
                            .add(CartShirtsRemoved(_shirts[index]));
                      },
                    )
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
