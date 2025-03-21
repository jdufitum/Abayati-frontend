import 'package:abayati/features/screens/onboard/dashboard/nav/nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState(navItem: NavItem.home));

  void switchItem(NavItem navItem) {
    emit(state.copyWith(navItem: navItem));
  }
}
