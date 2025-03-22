import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_first_app/themes/global_style.dart';

class AppBarCustom extends StatelessWidget{
  final String logoPath;
  final String iconPath;

  const AppBarCustom({
    super.key,
    required this.logoPath,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GlobalStyle.appbarPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: SvgPicture.asset(
              logoPath,
              width: 99,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child:Center(
                child:Container(
                  child: SvgPicture.asset(
                    iconPath,
                    height: 20,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }


}