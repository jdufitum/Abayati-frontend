import 'dart:ui';

import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/measure/measure.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/search/search.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/setting/setting.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/state/nav_cubit.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/wishlist/wishlist.dart';
import 'package:abayati/features/utils/app_color.dart';
import 'package:abayati/features/utils/constants.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:abayati/features/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'cart/cart.dart';
import 'home/home.dart';

enum NavItem { home, wishlist, cart, ai, setting }

// class Nav extends StatelessWidget {
//   const Nav({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NavCubit, NavState>(
//       builder: (context, state) {
//         return Scaffold(
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//           resizeToAvoidBottomInset: false,
//           floatingActionButton: Padding(
//               padding: EdgeInsets.only(top: 30.h),
//               child: FloatingActionButton(
//                   onPressed: () {
//                     context.read<NavCubit>().switchItem(NavItem.cart);
//                   },
//                   shape: const CircleBorder(),
//                   backgroundColor: AppColor.white,
//                   child: SvgPicture.asset(
//                     Vectors.shoppingCart,
//                     colorFilter: ColorFilter.mode(
//                         state.navItem == NavItem.cart
//                             ? AppColor.kE83636
//                             : AppColor.black,
//                         BlendMode.srcIn),
//                   ))),
//           bottomNavigationBar: BottomAppBar(
//             color: AppColor.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 const BottomNavItem(
//                     title: 'Home', vector: Vectors.home, navItem: NavItem.home),
//                 const BottomNavItem(
//                     title: 'Wishlist',
//                     vector: Vectors.wishlist,
//                     navItem: NavItem.wishlist),
//                 SizedBox(width: 30.w),
//                 const BottomNavItem(
//                     title: 'AI Search',
//                     vector: Vectors.ai,
//                     navItem: NavItem.ai),
//                 const BottomNavItem(
//                     title: 'Setting',
//                     vector: Vectors.settings,
//                     navItem: NavItem.setting),
//               ],
//             ),
//           ),
//           body: switch (state.navItem) {
//             NavItem.home => const Home(),
//             NavItem.wishlist => const Wishlist(),
//             NavItem.cart => const Cart(),
//             NavItem.ai => const SearchAi(),
//             NavItem.setting => const Setting(),
//           },
//         );
//       },
//     );
//   }
// }
class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        return PersistentTabView(
          screenTransitionAnimation: ScreenTransitionAnimation.none(),
          tabs: [
            PersistentTabConfig(
                screen: Home(),
                item: ItemConfig(
                    inactiveIcon: SvgPicture.asset(Vectors.home),
                    icon: SvgPicture.asset(Vectors.home,
                        colorFilter: ColorFilter.mode(
                            AppColor.kE83636, BlendMode.srcIn)),
                    title: 'Home',
                    activeForegroundColor: AppColor.kEB3030,
                    textStyle: Roboto.kFontW4.copyWith(fontSize: 12.spMin))),
            PersistentTabConfig(
                screen: Wishlist(),
                item: ItemConfig(
                    icon: SvgPicture.asset(Vectors.wishlist,
                        colorFilter: ColorFilter.mode(
                            AppColor.kE83636, BlendMode.srcIn)),
                    inactiveIcon: SvgPicture.asset(Vectors.wishlist),
                    activeForegroundColor: AppColor.kEB3030,
                    textStyle: Roboto.kFontW4.copyWith(fontSize: 12.spMin),
                    title: 'Wishlist')),
            PersistentTabConfig(
                screen: CartView(),
                item: ItemConfig(
                    icon: SvgPicture.asset(Vectors.shoppingCart),
                    activeForegroundColor: Colors.white,
                    filter: ImageFilter.blur())),
            PersistentTabConfig(
                screen: SearchAi(),
                item: ItemConfig(
                    icon: SvgPicture.asset(Vectors.ai,
                        colorFilter: ColorFilter.mode(
                            AppColor.kE83636, BlendMode.srcIn)),
                    inactiveIcon: SvgPicture.asset(Vectors.ai),
                    activeForegroundColor: AppColor.kEB3030,
                    textStyle: Roboto.kFontW4.copyWith(fontSize: 12.spMin),
                    title: 'AI Search')),
            PersistentTabConfig(
                screen: AiMeasure(),
                item: ItemConfig(
                    icon: SvgPicture.asset(Vectors.compass,
                        colorFilter: ColorFilter.mode(
                            AppColor.kE83636, BlendMode.srcIn)),
                    inactiveIcon: SvgPicture.asset(Vectors.compass),
                    activeForegroundColor: AppColor.kEB3030,
                    textStyle: Roboto.kFontW4.copyWith(fontSize: 12.spMin),
                    title: 'AI Measure')),
          ],
          navBarBuilder: (config) => Style13BottomNavBar(
            navBarConfig: config,
            navBarDecoration: NavBarDecoration(),
          ),
        );
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          resizeToAvoidBottomInset: false,
          floatingActionButton: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: FloatingActionButton(
                  onPressed: () {
                    context.read<NavCubit>().switchItem(NavItem.cart);
                  },
                  shape: const CircleBorder(),
                  backgroundColor: AppColor.white,
                  child: SvgPicture.asset(
                    Vectors.shoppingCart,
                    colorFilter: ColorFilter.mode(
                        state.navItem == NavItem.cart
                            ? AppColor.kE83636
                            : AppColor.black,
                        BlendMode.srcIn),
                  ))),
          bottomNavigationBar: BottomAppBar(
            color: AppColor.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const BottomNavItem(
                    title: 'Home', vector: Vectors.home, navItem: NavItem.home),
                const BottomNavItem(
                    title: 'Wishlist',
                    vector: Vectors.wishlist,
                    navItem: NavItem.wishlist),
                SizedBox(width: 30.w),
                const BottomNavItem(
                    title: 'AI Search',
                    vector: Vectors.ai,
                    navItem: NavItem.ai),
                const BottomNavItem(
                    title: 'Setting',
                    vector: Vectors.settings,
                    navItem: NavItem.setting),
              ],
            ),
          ),
          body: switch (state.navItem) {
            NavItem.home => const Home(),
            NavItem.wishlist => const Wishlist(),
            NavItem.cart => const CartView(),
            NavItem.ai => const SearchAi(),
            NavItem.setting => const Setting(),
          },
        );
      },
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.vector,
    required this.title,
    required this.navItem,
  });

  final String vector;
  final String title;
  final NavItem navItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NavCubit>().switchItem(navItem);
      },
      child: BlocBuilder<NavCubit, NavState>(
        builder: (context, state) {
          return Column(
            children: [
              SvgPicture.asset(
                vector,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                    state.navItem == navItem
                        ? AppColor.kE83636
                        : AppColor.black,
                    BlendMode.srcIn),
              ),
              h(3),
              Text(title,
                  style: state.navItem == navItem
                      ? Roboto.kFontW5
                          .copyWith(color: AppColor.kE83636, fontSize: 12.spMin)
                      : Roboto.kFontW4.copyWith(fontSize: 12.spMin))
            ],
          );
        },
      ),
    );
  }
}
