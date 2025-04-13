import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_ui/core_modules/module_theme/service/theme_service/theme_service.dart';
import 'package:test_ui/generated/assets.dart';
import 'package:test_ui/main_module/discounts_screen/discount_enum.dart';

import 'discount_card.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          color: context.theme.primaryColor,
          child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: Row(children: [
              SvgPicture.asset(Assets.iconsFilterIcon),
              Expanded(child: searchWidget(context))
            ],),
          )
          ,),
        Expanded(
          child: ListView(
            children: [
              DiscountCard(isEnded: false,desc: 'ابدأ التوفير! احصل على 2% كاش باك عند إنفاقك بين 1000 و 2000 دينار',
                type: DiscountTypeEnum.buyNow, currentPoint: 1500,),
              DiscountCard(isEnded: true,desc: 'ابدأ التوفير! احصل على 2% كاش باك عند إنفاقك بين 1000 و 2000 دينار',
                type: DiscountTypeEnum.bronze,currentPoint: 600, ),

              DiscountCard(isEnded: false,desc: '',
                type: DiscountTypeEnum.silver, currentPoint: 2500,),
              DiscountCard(isEnded: true,desc: 'ابدأ التوفير! احصل على 2% كاش باك عند إنفاقك بين 1000 و 2000 دينار',
                type: DiscountTypeEnum.gold, currentPoint: 3300,),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchWidget(BuildContext c){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            hintText: 'بحث عام..',
            hintStyle: c.textTheme.titleSmall?.copyWith(color: AppColors.silverLightColor,fontSize: 16),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(Assets.iconsSerachIcon ),
            ),
              suffixIconConstraints: BoxConstraints(
                  minHeight: 24,
                  minWidth: 24
              ),
          ),
        ),
      ),
    );
  }

}
