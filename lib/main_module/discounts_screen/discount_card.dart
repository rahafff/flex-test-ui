import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_ui/core_modules/module_theme/service/theme_service/theme_service.dart';
import 'package:test_ui/generated/assets.dart';

import '../discount_details/discount_details.dart';
import 'discount_enum.dart';

class DiscountCard extends StatelessWidget {
  final bool isEnded;
  final String desc;
  final DiscountTypeEnum type;
  final double currentPoint;
  const DiscountCard({
    super.key,
    required this.isEnded,
    required this.desc,
    required this.type,
    required this.currentPoint,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.push(context,MaterialPageRoute(builder: (context) => DiscountDetails(currentPoint: currentPoint,isEnded: isEnded,),));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isEnded ? AppColors.silverColor : Colors.white,
            borderRadius: BorderRadius.circular(
              ThemeConstants.mediumRadiusRounded,
            ),
            border: Border.all(
              color: isEnded ? AppColors.silverDarkColor : AppColors.primaryColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    isEnded
                        ? Container(
                          decoration: BoxDecoration(
                            color: AppColors.silverDarkColor,
                            borderRadius: BorderRadius.circular(
                              ThemeConstants.mediumRadiusRounded,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'إنتهى : ',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.silverTextColor,
                                  ),
                                ),
                                Text(
                                  '25-03-2025',
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.silverTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        : Row(
                          children: [
                            Text(
                              ' تاريخ الانتهاء : ',
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
                        ),
                    SizedBox(width: 70),
                    getTagByNum(type, context),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesProf1),
                      radius: 30,
                    ),
                    SizedBox(width: 20),
                    Text('اسم الحملة'),
                  ],
                ),
                SizedBox(height: 10),
                TierProgressWidget(currentPoint,true,isEnded),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'ابدأ التوفير! احصل على ',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '2%',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' كاش باك عند إنفاقك بين ',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '1000 و  2000 ',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' دينار',
                        style: context.textTheme.titleSmall?.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTagByNum(DiscountTypeEnum r, BuildContext c) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
      decoration: BoxDecoration(
        color: DiscountTypeEnum.getColor(type),
        borderRadius: BorderRadius.circular(ThemeConstants.highRadiusRounded),
      ),
      child: Text(
        DiscountTypeEnum.getText(r),
        style: c.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}

class TierProgressWidget extends StatelessWidget {
  final double currentPoints;
  final bool showArrow;
  final bool isEnded;

  TierProgressWidget(this.currentPoints, this.showArrow ,this.isEnded);

  List<Tier> tiers = [
    Tier(name: '1000', pointThreshold: 1000),
    Tier(name: '2000', pointThreshold: 2000),
    Tier(name: '3000', pointThreshold: 3000),
    Tier(name: '4000', pointThreshold: 4000),
  ];
  final double maxPoints = 4000;

  @override
  Widget build(BuildContext context) {
    double progress = (currentPoints) / maxPoints;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Spacer()),
            Expanded(
              flex: 6,
              child:  getStepName(context),
            ),
            Visibility(
                visible: showArrow,
                child: SvgPicture.asset(Assets.iconsArrowLeft)),
          ],
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Stack(
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: AppColors.silverDarkColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 12,
                        decoration: BoxDecoration(
                          color: isEnded ? AppColors.silverTextColor : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    // Tier dots
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 0,
                          backgroundColor: Colors.transparent,
                          child: Text(''),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                          tiers.map((e) {
                            return CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.silverDarkColor,
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    currentPoints >= e.pointThreshold
                                        ? isEnded ? AppColors.silverTextColor : AppColors.primaryColor
                                        : AppColors.silverDarkColor,
                                child: Text(
                                  e.name,
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                        color:
                                            currentPoints >= e.pointThreshold
                                                ? AppColors.blackColor
                                                : AppColors.silverTextColor,
                                      ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }

  Widget getStepName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'برونزي',
          style: context.textTheme.bodyMedium?.copyWith(
            color: currentPoints > 1000? AppColors.blackColor : AppColors.silverTextColor,
          ),
        ),
        Text(
          'فضي',
          style: context.textTheme.bodyMedium?.copyWith(
            color: currentPoints > 2000? AppColors.blackColor : AppColors.silverTextColor,
          ),
        ),
        Text(
          'ذهبي',
          style: context.textTheme.bodyMedium?.copyWith(
             color: currentPoints > 3000? AppColors.blackColor : AppColors.silverTextColor,
          ),
        ),
      ],
    );
  }
}

class Tier {
  final String name;
  final int pointThreshold;

  Tier({required this.name, required this.pointThreshold});
}
