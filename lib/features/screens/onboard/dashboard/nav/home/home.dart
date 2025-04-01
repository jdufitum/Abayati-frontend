import 'package:abayati/features/core/model/request/product.dart';
import 'package:abayati/features/core/services/service/product/bloc/product_bloc.dart';
import 'package:abayati/features/screens/onboard/dashboard/nav/wishlist/state/wishlist_cubit.dart';
import 'package:abayati/features/utils/app_route.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../assets/resources.dart';
import '../../../../../core/model/response/product.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';

class Home extends StatefulHookWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      globals.productBloc!.add(AllProductEvent());
      globals.productBloc!.add(WishlistEvent());
      globals.productBloc!.add(CategoryEvent());
      globals.productBloc!.add(CartEvent());
      return null;
    });
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
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Skeletonizer(
                enabled:
                    state is ProductLoading && globals.allProducts!.isEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // h(12),
                    // const CustomAppBar(),
                    // h(21),
                    const AppSearchField(),
                    // h(28),
                    // Row(
                    //   children: [
                    //     Text('All Featured',
                    //         style: Montserrat.kFontW6.copyWith(fontSize: 18.spMin)),
                    //     const Spacer(),
                    //     Container(
                    //       padding:
                    //           EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                    //       decoration: BoxDecoration(
                    //           color: AppColor.white,
                    //           borderRadius: BorderRadius.circular(6.r)),
                    //       child: Row(
                    //         children: [
                    //           Text('Sort',
                    //               style: Montserrat.kFontW4
                    //                   .copyWith(fontSize: 12.spMin)),
                    //           w(4),
                    //           SvgPicture.asset(Vectors.sort)
                    //         ],
                    //       ),
                    //     ),
                    //     w(12),
                    //     Container(
                    //       padding:
                    //           EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                    //       decoration: BoxDecoration(
                    //           color: AppColor.white,
                    //           borderRadius: BorderRadius.circular(6.r)),
                    //       child: Row(
                    //         children: [
                    //           Text('Filter',
                    //               style: Montserrat.kFontW4
                    //                   .copyWith(fontSize: 12.spMin)),
                    //           w(4),
                    //           SvgPicture.asset(Vectors.filt)
                    //         ],
                    //       ),
                    //     ),
                    //     w(11)
                    //   ],
                    // ),
                    h(18),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          color: AppColor.kA89294,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('What are you Looking For',
                                  style: LibreCasion.kFontW7.copyWith(
                                      fontSize: 18.spMin,
                                      color: AppColor.kFCF4F4)),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, AppRoute.store);
                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: AppColor.kFCF4F4,
                                  size: 26,
                                ),
                              )
                            ],
                          ),
                          h(7),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: globals.category!
                                  .map((feature) => FeatureTile(
                                      image: feature.imageUrl!,
                                      text: feature.name!))
                                  .toList()),
                        ],
                      ),
                    ),
                    h(13),
                    Text('Featured Selections',
                        style:
                            LibreCasion.kFontW7.copyWith(fontSize: 18.spMin)),
                    h(15),

                    if (globals.allProducts!.isNotEmpty)
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 240.h,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 15.w),
                        itemBuilder: (context, index) {
                          final product = globals.allProducts![index];
                          return ItemCard(product: product);
                        },
                        itemCount: globals.allProducts!.length,
                      ),

                    h(13),
                    // Text('Selections Made for You',
                    //     style: LibreCasion.kFontW7.copyWith(fontSize: 18.spMin)),
                    // h(15),
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2,
                    //       mainAxisExtent: 240.h,
                    //       mainAxisSpacing: 10.h,
                    //       crossAxisSpacing: 15.w),
                    //   itemBuilder: (context, index) => const ItemCard(),
                    //   itemCount: 4,
                    // ),
                    h(20)
                  ],
                ).hPad,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoSearchTextField(
          itemColor: AppColor.kA89294,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.kA89294),
              color: AppColor.white,
              borderRadius: BorderRadius.circular(1.r)),
          padding: REdgeInsetsDirectional.fromSTEB(10.w, 8.h, 16.w, 8.h),
          placeholder: 'Search any Product..',
          placeholderStyle:
              Montserrat.kFontW4.copyWith(color: AppColor.kBBBBBB),
          prefixIcon: SvgPicture.asset(Vectors.search),
          prefixInsets: EdgeInsetsDirectional.fromSTEB(16.w, 8.h, 0, 8.h),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            right: 20.w,
            child: SvgPicture.asset(Vectors.mic))
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 6.h),
          decoration: const BoxDecoration(
              color: AppColor.kF2F2F2, shape: BoxShape.circle),
          child: SvgPicture.asset(Vectors.filter),
        ),
        Text('Abayati',
            style: LibreCasion.kFontW7.copyWith(fontSize: 18.spMin)),
        const Avatar()
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        width: 40.w,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(Images.avatar))));
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.product,
  });

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      bloc: globals.wishlistCubit,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.details, arguments: product);
          },
          onDoubleTap: () {
            globals.wishlistCubit!.toggleFavorite(product!).then((_) {
              if (state.favoriteProduct.contains(product?.id)) {
                globals.productBloc!.add(RemoveFromWishlistEvent(
                    wishlistDto: WishlistDto(productId: product!.id!)));
              } else {
                globals.productBloc!.add(AddToWishlistEvent(
                    wishlistDto: WishlistDto(productId: product!.id!)));
              }
              // triggerEvent();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              border: Border.all(color: AppColor.kA89294),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 121.h,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(4.r)),
                        image: DecorationImage(
                            image: product != null
                                ? NetworkImage(product!.imgUrl!)
                                : const AssetImage(Images.abaya100),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 7.h, right: 11.w),
                        child: InkWell(
                          onTap: () {
                            globals.wishlistCubit!
                                .toggleFavorite(product!)
                                .then((_) {
                              // triggerEvent();
                              if (state.favoriteProduct.contains(product?.id)) {
                                globals.productBloc!.add(
                                    RemoveFromWishlistEvent(
                                        wishlistDto: WishlistDto(
                                            productId: product!.id!)));
                              } else {
                                globals.productBloc!.add(AddToWishlistEvent(
                                    wishlistDto:
                                        WishlistDto(productId: product!.id!)));
                              }
                            });
                          },
                          child: SvgPicture.asset(
                            state.favoriteProduct.contains(product?.id)
                                ? Vectors.favFill
                                : Vectors.fav,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product?.name ?? 'XXX Coloured Abaya’s',
                          style:
                              Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                      h(3),
                      Text(
                          product?.description ??
                              'Plain Black Colour Abaya \nAbaya 123',
                          style:
                              Montserrat.kFontW4.copyWith(fontSize: 10.spMin)),
                      h(4),
                      Text('${product?.price ?? 800} QR',
                          style:
                              Montserrat.kFontW5.copyWith(fontSize: 12.spMin)),
                      SizedBox(
                        width: 43.w,
                        child: Divider(
                          color: AppColor.kBBBBBB,
                          thickness: .5.w,
                        ),
                      ),
                      h(4),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColor.kEDB310,
                        ),
                        onRatingUpdate: (rating) {},
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

var features = [
  FeatureDetails(image: Images.abaya, text: 'Abaya'),
  FeatureDetails(image: Images.shayla, text: 'Shayla'),
  FeatureDetails(image: Images.jalabiya, text: 'Jalabiya'),
  FeatureDetails(image: Images.undercap, text: 'Undercaps'),
  FeatureDetails(image: Images.latest, text: 'Latest'),
];

class FeatureDetails {
  final String image;
  final String text;

  FeatureDetails({required this.image, required this.text});
}

class FeatureTile extends StatelessWidget {
  const FeatureTile({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56.h,
          width: 56.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        h(4),
        Text(text,
            style: Montserrat.kFontW4
                .copyWith(fontSize: 10.spMin, color: AppColor.k21003D))
      ],
    );
  }
}
