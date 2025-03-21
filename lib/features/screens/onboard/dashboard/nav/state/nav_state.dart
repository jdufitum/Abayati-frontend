part of 'nav_cubit.dart';

class NavState {
  final NavItem navItem;

  NavState({required this.navItem});

  NavState copyWith({NavItem? navItem}) =>
      NavState(navItem: navItem ?? this.navItem);
}
