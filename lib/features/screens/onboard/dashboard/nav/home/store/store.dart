import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../../assets/resources.dart';
import '../../../../../../core/model/response/product.dart';
import '../../../../../../core/services/service/product/bloc/product_bloc.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/app_route.dart';
import '../../../../../../utils/constants.dart';
import '../../../../../../utils/text_style.dart';
import '../home.dart';

class StoreView extends HookWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    var stores = useState(<ProductStore>[]);
    final category = ModalRoute.settingsOf(context)?.arguments as Category;
    useEffect(() {
      globals.productBloc!.add(StoresByCategoryEvent(id: category.id!));
      return null;
    }, []);
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
        child: BlocConsumer<ProductBloc, ProductState>(
          bloc: globals.productBloc,
          listener: (context, state) {
            if (state is StoreByCategorySuccess) {
              stores.value = state.stores;
            }
          },
          builder: (context, state) {
            return Skeletonizer(
              enabled: state is StoresLoading,
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
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: AppColor.kA89294,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                        '${globals.category!.firstWhere((dt) => dt.id == category.id).name}’s',
                        style: LibreCasion.kFontW7.copyWith(
                            fontSize: 18.spMin, color: AppColor.kFCF4F4)),
                  ),
                  h(15),
                  if (stores.value.isNotEmpty)
                    Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 240.h,
                            mainAxisSpacing: 10.h,
                            crossAxisSpacing: 15.w),
                        itemBuilder: (context, index) {
                          final store = stores.value[index];
                          return StoreCard(store: store);
                        },
                        itemCount: stores.value.length,
                      ),
                    )
                  else
                    const Flexible(
                        child: Center(
                            child: Text('No stores found for this category'))),
                  h(20)
                ],
              ),
            );
          },
        ).hPad,
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({
    super.key,
    required this.store,
  });

  final ProductStore store;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.storeDetails, arguments: store);
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
            Container(
              height: 121.h,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(4.r)),
                  image: const DecorationImage(
                      image: AssetImage(Images.abaya100), fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(store.name!,
                      style: Montserrat.kFontW7.copyWith(fontSize: 15.spMin)),
                  h(3),
                  Text(
                      'Category: ${store.categories!.map((category) => category.name)}',
                      style: Montserrat.kFontW7.copyWith(fontSize: 8.spMin)),
                  h(4),
                  Text(store.description!,
                      style: Montserrat.kFontW4.copyWith(fontSize: 8.spMin)),
                  h(10),
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
  }
}
