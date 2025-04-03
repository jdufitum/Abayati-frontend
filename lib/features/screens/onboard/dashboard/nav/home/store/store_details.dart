import 'package:abayati/assets/resources.dart';
import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constants.dart';
import '../../../../../../utils/text_style.dart';
import '../home.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final store = ModalRoute.settingsOf(context)?.arguments as ProductStore;
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            h(18),
            Container(
              height: 220.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Images.storeBg), fit: BoxFit.fitWidth)),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              decoration: const BoxDecoration(
                color: AppColor.kA89294,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(store.name!,
                      style: LibreCasion.kFontW7
                          .copyWith(fontSize: 20.spMin, color: AppColor.white)),
                  Text(
                      'Category: ${store.categories!.map((category) => category.name)}',
                      style: LibreCasion.kFontW7.copyWith(
                          fontSize: 12.spMin, color: AppColor.kFCF4F4)),
                  Text(store.description!,
                      style: LibreCasion.kFontW4.copyWith(
                          fontSize: 8.spMin, color: AppColor.kFCF4F4)),
                ],
              ),
            ),
            h(15),
            if (store.products!.isNotEmpty)
              Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 240.h,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 15.w),
                  itemBuilder: (context, index) {
                    final product = store.products![index];
                    return ItemCard(product: product);
                  },
                  itemCount: store.products!.length,
                ).eHPad(9),
              )
            else
              const Flexible(
                  child: Center(child: Text('Store has no product available'))),
            h(20)
          ],
        ),
      ),
    );
  }
}
