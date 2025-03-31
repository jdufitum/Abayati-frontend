import 'package:abayati/features/screens/onboard/dashboard/nav/wishlist/state/wishlist_cubit.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/wishlist/state/wishlist_cubit.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/services/service/product/bloc/product_bloc.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../home/home.dart';

class Wishlist extends HookWidget {
  const Wishlist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      globals.productBloc!.add(WishlistEvent());
      return null;
    }, []);
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
          child: BlocConsumer<ProductBloc, ProductState>(
        bloc: globals.productBloc,
        listener: (context, state) {
          if (state is WishlistSuccess) {
            for (var product in state.wishlist) {
              globals.wishlistCubit!.initWishlist(product);
            }
          }
          if (
              // state is AddToWishlistSuccess ||
              //     state is RemoveFromWishlistSuccess ||
              state is AddToWishlistError || state is RemoveFromWishlistError) {
            globals.productBloc!.add(WishlistEvent());
          }
        },
        builder: (context, state) {
          return Skeletonizer(
            enabled: state is WishlistLoading &&
                globals.wishlistCubit!.state.wishlist.isEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // h(12),
                // const CustomAppBar(),
                // h(22),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColor.kA89294)),
                  child: Text('My Wishlist',
                      style: LibreCasion.kFontW7.copyWith(fontSize: 24.spMin)),
                ),
                h(30),

                BlocBuilder<WishlistCubit, WishlistState>(
                  bloc: globals.wishlistCubit,
                  builder: (context, state) {
                    if (state.wishlist.isNotEmpty) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 260.h,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 15.w),
                        itemBuilder: (context, index) {
                          final product = state.wishlist[index];
                          return ItemCard(product: product);
                        },
                        itemCount: state.wishlist.length,
                      );
                    } else {
                      return const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Wishlist is empty'),
                          ],
                        ),
                      );
                    }
                  },
                ),
                h(20)
              ],
            ),
          ).hPad;
        },
      )),
    );
  }
}
