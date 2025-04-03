import 'package:abayati/features/core/model/response/product.dart';
import 'package:abayati/features/core/services/service/ai/bloc/ai_bloc.dart';
import 'package:abayati/features/utils/components/app_globals.dart';
import 'package:abayati/features/utils/components/app_snackbar.dart';
import 'package:abayati/features/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../assets/resources.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/text_style.dart';
import '../home/home.dart';

class SearchAi extends HookWidget {
  const SearchAi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var products = useState(<Product>[]);
    var focusNode = useFocusNode();

    useEffect((){
      focusNode.requestFocus();
      return focusNode.dispose;
    }, []);
    return Scaffold(
      appBar: showAppBar(context),
      body: SafeArea(
          child: BlocConsumer<AiBloc, AiState>(
        bloc: globals.aiBloc,
        listener: (context, state) {
          if (state is SearchSuccess) {
            products.value = state.products;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // h(12),
              // const CustomAppBar(),
              h(21),
              SearchContainer(
                focusNode: focusNode,
                onSubmitted: (query) {
                  if (query!.trim().isNotEmpty) {
                    globals.aiBloc!.add(SearchEvent(query: query.trim()));
                  }
                },
                onChanged: (query) {
                  if (query!.isEmpty) {
                    products.value = [];
                  }
                },
              ),
              h(9),
              if (state is AiLoading)
                const Flexible(
                    child: Center(
                        child: CircularProgressIndicator(
                  color: AppColor.kB08968,
                )))
              else if (products.value.isNotEmpty)
                Flexible(
                  child: Skeletonizer(
                    enabled: state is AiLoading,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 260.h,
                          mainAxisSpacing: 10.h,
                          crossAxisSpacing: 15.w),
                      itemBuilder: (context, index) {
                        final product = products.value[index];
                        return ItemCard(product: product);
                      },
                      itemCount: products.value.length,
                    ),
                  ),
                )
              else
                const Flexible(child: Center(child: Text('No product'))),
              h(20)
            ],
          );
        },
      ).hPad),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.onSubmitted,
    required this.onChanged,
    required this.focusNode,
  });

  final void Function(String?) onSubmitted;
  final void Function(String?) onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r), color: AppColor.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextField(
              cursorColor: AppColor.k9C6644,
              style: Montserrat.kFontW4,
              minLines: null,
              maxLines: null,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration.collapsed(
                hintStyle: Montserrat.kFontW4.copyWith(
                    color: AppColor.kBBBBBB, overflow: TextOverflow.visible),
                hintText:
                    'Let me help you find your perfect abaya. All you have to do is describe it to me. ',
              ).copyWith(
                  hintMaxLines: 2,
                  prefixIcon: SvgPicture.asset(Vectors.searchAi,
                      fit: BoxFit.scaleDown)),
            ),
          ),
        ],
      ),
    );
  }
}
