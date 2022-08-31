part of 'nav_cubit.dart';

enum NavbarItem { home, cart, profile }

class NavigationState extends Equatable {
  const NavigationState(this.navbarItem, this.index);
  final NavbarItem navbarItem;
  final int index;

  @override
  List<Object> get props => [navbarItem, index];
}
