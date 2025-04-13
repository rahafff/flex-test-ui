import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:test_ui/core_modules/module_theme/service/theme_service/theme_service.dart';

import '../generated/assets.dart';
import 'discounts_screen/discount_screen.dart';

class BottomNavScreen extends StatefulWidget   {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>  with SingleTickerProviderStateMixin{

   late final TabController controller;

   int selectedIndex = 0;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: selectedIndex,
      child: Scaffold(
        appBar: AppBar(title: Text('برامج الخصم',),
          backgroundColor: context.theme.primaryColor,leading: Icon(Icons.arrow_back),),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Container(
               child: Container(child: Text('home'),),
            ),
            Container(child: Container(child: Text('se'),),),
            DiscountScreen(),
            Container(color: Colors.white),
            Container(color: Colors.white),
          ],
        ),

        bottomNavigationBar:  Container(
          padding: EdgeInsets.all(10),
           decoration: BoxDecoration(
             color: Colors.white,
             boxShadow: [
               BoxShadow(
                 color: AppColors.blackShadowColor,
                 spreadRadius: 0,
                 blurRadius: 20,
                 offset: Offset(0, 4), // changes position of shadow
               ),
             ]
           ),
          child: TabBar(

          controller: controller,
          dividerColor: Colors.transparent,
          labelStyle: context.textTheme.bodyMedium?.copyWith(fontSize: 12,fontWeight: FontWeight.w700 ),
          labelPadding: EdgeInsets.zero ,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              controller.animateTo(selectedIndex);
            });
          },
          tabs: [
              SizedBox(height: 55,
              child: Tab(
                child: Column(children: [
                  SvgPicture.asset(Assets.iconsHomeIcon,height: 25,color: selectedIndex !=0 ? AppColors.blackColor : AppColors.primaryColor,),
                  SizedBox(height: 8,),
                  Text('الرئيسية',style:context.textTheme.bodyMedium?.copyWith(fontSize: 12, ),)
                ],),
              ),
            ),
              SizedBox(
                height: 55,
                child: Tab( child: Column(children: [
                  SvgPicture.asset(Assets.iconsSectionIcon,height: 25,color: selectedIndex !=1 ? AppColors.blackColor : AppColors.primaryColor,),
                  SizedBox(height: 8,),
                  Text("الاقسام",style:context.textTheme.bodyMedium?.copyWith(fontSize: 12, ),)

                ],),

                ),
              ),
              SizedBox(
                height: 55,
                child: Tab(
                  child: Column(
                    children: [
                      SvgPicture.asset(Assets.iconsDiscountIcon,height: 25,color: selectedIndex !=2 ? AppColors.blackColor : AppColors.primaryColor,),
                      SizedBox(height: 8,),
                      Text('برامج الخصم',style:context.textTheme.bodyMedium?.copyWith(fontSize: 12, ),)
                    ],
                  ),),
              ),
              SizedBox(
                height: 55,
                child: Tab(

                child: Column(children: [
                  SvgPicture.asset(Assets.iconsNotifiIcon,height: 25,color: selectedIndex !=3 ? AppColors.blackColor : AppColors.primaryColor,),
                  SizedBox(height: 8,),
                  Text('الإشعارات',style:context.textTheme.bodyMedium?.copyWith(fontSize: 12, ),)
                ],),
                ),
              ),
              SizedBox(
                height: 55,

                child: Tab( child: Column(
                  children: [
                    SvgPicture.asset(Assets.iconsOrderIcon,height: 25,color: selectedIndex !=4 ? AppColors.blackColor : AppColors.primaryColor,),
                    SizedBox(height: 8,),
                    Text('الطلبات',style:context.textTheme.bodyMedium?.copyWith(fontSize: 12, ),)
                  ],
                ),),
              ),
          ],
              ),
        ),
      ),
    );
  }



}
