import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_ui/core_modules/module_theme/service/theme_service/theme_service.dart';
import 'package:test_ui/generated/assets.dart';
import 'package:test_ui/main_module/discounts_screen/discount_card.dart';

class DiscountDetails extends StatelessWidget {
  final double currentPoint;
  const DiscountDetails({super.key, required this.currentPoint});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColor,
      child: SafeArea(
        child: Scaffold(
           body: SingleChildScrollView(
             child: Column(
               children: [
              header(context),
                 SizedBox(height: 20,),
               TierProgressWidget(currentPoint,false),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(ThemeConstants.mediumRadiusRounded)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Assets.iconsCoins),
                            Text('قيمة مشترياتي \n${600} دينار',textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.silverColor,
                          borderRadius: BorderRadius.circular(ThemeConstants.mediumRadiusRounded)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('متبقي على \n المستوي البرونزي',textAlign: TextAlign.center,),
                            Text(600.toString() + ' دينار ',textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ],),

                  SizedBox(height: 55,),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(ThemeConstants.mediumRadiusRounded)
                    ),
                    padding: EdgeInsets.all(15),
                    child:
                    Text(' انت الان حققت 600 د.أ, اسرع بالشراء لترتقي للمستوى البرونزي وتحصل على خصم 2% على اجمالي مشترياتك انت الان حققت 600 د.أ, اسرع بالشراء لترتقي للمستوى البرونزي وتحصل على خصم 2% على اجمالي مشترياتك',
                      style: context.textTheme.titleSmall?.copyWith(fontSize: 16)
                      ,),)
                ],),
              )
                       ],),
           ),
        ),
      ),
    );
  }

  Widget header(BuildContext context){
    return Container(
      color: AppColors.silverColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(Assets.iconsArrowBack)),
            SizedBox(width: 15,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(

                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(Assets.imagesProf1),
                        radius: 30,
                      ),
                      SizedBox(width: 15,),
                      Column(children: [
                        Text('اسم الحملة'),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(
                              ' موعد الانتهاء : ',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.theme.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '25-03-2025',
                              style: context.textTheme.titleSmall?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],)
                    ],

                  ),
                  SizedBox(height: 15,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'ابدأ التوفير! احصل على ',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '2%',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' كاش باك عند إنفاقك بين ',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: '1000 و  2000 ',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' دينار',
                          style: context.textTheme.titleSmall?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget cardDetils(double currentPo){
    return Container(
     decoration: BoxDecoration(
       color: AppColors.primaryColor,
       borderRadius: BorderRadius.circular(ThemeConstants.mediumRadiusRounded)
     ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.iconsCoins),
            Text('قيمة مشترياتي \n${600} دينار',textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }


}
