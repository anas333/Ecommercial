import 'package:ecommercial/cart/view/cart_page.dart';
import 'package:ecommercial/home/home.dart';
import 'package:ecommercial/nav_pages/cubit/nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavView extends StatelessWidget {
  const NavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Container(
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage('assets/assets/imgs/fabric2.jpg'),
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 42, 104, 119),
                  BlendMode.multiply,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: state.index,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.blueGrey,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shop,
                  ),
                  label: 'cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: (index) {
                if (index == 0) {
                  context
                      .read<NavigationCubit>()
                      .getNavBarItem(NavbarItem.home);
                } else if (index == 1) {
                  context
                      .read<NavigationCubit>()
                      .getNavBarItem(NavbarItem.cart);
                } else if (index == 2) {
                  context
                      .read<NavigationCubit>()
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            ),
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (cotext, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const HomePage();
          } else if (state.navbarItem == NavbarItem.cart) {
            return const CartPage();
          } else if (state.navbarItem == NavbarItem.profile) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
