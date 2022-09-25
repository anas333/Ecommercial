// ignore_for_file: lines_longer_than_80_chars

import 'package:badges/badges.dart';
import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/cart/cart.dart';
import 'package:ecommercial/nav_pages/view/nav_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.shirts}) : super(key: key);
  final Shirts shirts;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * (0.57),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        end: Alignment
                            .center, // 10% of the width, so there are ten blinds.
                        colors: <Color>[
                          Color.fromARGB(255, 172, 217, 230),
                          Colors.white
                        ], // red to
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * (0.51),
                    left: 20,
                    child: Text(
                      '${shirts.shirtPrice} \$',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 42, 104, 119),
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Align(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: Image.network(
                          shirts.shirtImg,
                          fit: BoxFit.fill,
                          height: size.height * (0.45),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 42, 104, 119),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context).push<MaterialPageRoute>(
                              MaterialPageRoute(
                                builder: (context) => const NavPages(),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartLoaded) {
                              final number = state.cart.shirts.length;
                              return Badge(
                                badgeContent: Text('$number'),
                                badgeColor:
                                    const Color.fromARGB(255, 136, 181, 192),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    size: 30,
                                    color: Color.fromARGB(255, 42, 104, 119),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push<MaterialPageRoute>(
                                      MaterialPageRoute(
                                        builder: (context) => const CartPage(),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: size.height * (0.02)),
                child: const Text(
                  'Colors',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 42, 104, 119),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: size.height * (0.015)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueGrey, width: 3),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueGrey, width: 3),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueGrey, width: 3),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: size.height * (0.02)),
                child: const Text(
                  'Descrebtion',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 42, 104, 119),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: size.height * (0.015)),
                child: Text(
                  'this product is copy one and highly\nrecomanded for its solid platform and \nnotEmptyistace of water',
                  softWrap: true,
                  style: TextStyle(
                    wordSpacing: 3,
                    fontSize: 16,
                    color: Colors.blueGrey.shade300,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * (0.02),
                  bottom: size.height * (0.04),
                  left: 10,
                ),
                child: const Text(
                  'Some Thing To Wear With',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 42, 104, 119),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * (0.082),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/assets/imgs/fabric2.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Call The Vender',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.call,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const CircularProgressIndicator();
                        }
                        if (state is CartLoaded) {
                          final isincart = state.cart.shirts.contains(shirts);
                          return GestureDetector(
                            child: isincart
                                ? Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/assets/imgs/fabric2.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'added',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/assets/imgs/fabric2.jpg',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 12,
                                        left: 30,
                                        bottom: 12,
                                        right: 30,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'add',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            onTap: () {
                              isincart
                                  // ignore: unnecessary_statements
                                  ? context
                                      .read<CartBloc>()
                                      .add(CartShirtsRemoved(shirts))
                                  : context
                                      .read<CartBloc>()
                                      .add(CartShirtsAdded(shirts));
                            },
                          );
                        }
                        return const Text('Something went wrong!');
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
