import 'package:test_ui/core_modules/module_theme/service/theme_service/theme_service.dart';

enum DiscountTypeEnum{
  buyNow,
  gold,
  silver,
  bronze;

  static getColor (DiscountTypeEnum d){
    switch(d) {
      case DiscountTypeEnum.buyNow:
        return AppColors.redColor;

       case DiscountTypeEnum.gold:
       return AppColors.goldColor;

      case DiscountTypeEnum.silver:
        return AppColors.silverLightColor;

      case DiscountTypeEnum.bronze:
        return AppColors.bronzeColor;
    }
  }
  static getText (DiscountTypeEnum d){
    switch(d) {
      case DiscountTypeEnum.buyNow:
        return 'اشتري الأن';

       case DiscountTypeEnum.gold:
       return 'ذهبي';

      case DiscountTypeEnum.silver:
        return 'فضي';

      case DiscountTypeEnum.bronze:
        return "برونزي";
    }
  }
}