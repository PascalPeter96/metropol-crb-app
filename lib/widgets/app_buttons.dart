

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:go_router/go_router.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';



class AppButton extends StatelessWidget {
  final Widget? loader;
  final String title;
  final Color color;
  final Color? loaderColor;
  final TextStyle? textStyle;
  final VoidCallback function;
  final bool? isLoading;
  final double? width;


  const AppButton({Key? key,  this.loader,required this.title, required this.color, required this.function, this.loaderColor, this.isLoading=false, this.width, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Bounceable(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
          width: 90.w,
          height: 6.h,
          decoration: BoxDecoration(
              color:  color,
              borderRadius: BorderRadius.circular(20.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // loader ?? Container(),
              isLoading == true ?  CircularProgressIndicator.adaptive(
                backgroundColor: loaderColor ?? Colors.white,
              ): Center(
                child: width == null ? Text(
                  title,
                  style: textStyle ?? AppTheme.whiteButtonText,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ) : Container(
                  color: Colors.transparent,
                  width: width,
                  child: Text(
                    title,
                    style: textStyle ?? AppTheme.whiteButtonText,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}


class AppIconButton extends StatelessWidget {
  final Widget? loader;
  final Color color;
  final Color? loaderColor;
  final VoidCallback function;
  final bool? isLoading;
  final double? width;
  final IconData icon;
  final Color? iconColor;


  const AppIconButton({Key? key,  this.loader, required this.color, required this.function, this.loaderColor, this.isLoading=false, this.width,  required this.icon, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Bounceable(
      onTap: function,
      child: Container(
          alignment: Alignment.center,
          width: 20.w,
          height: 6.h,
          decoration: BoxDecoration(
              color:  color,
              borderRadius: BorderRadius.circular(20.sp)),
          child: isLoading == true ?  Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: loaderColor ?? Colors.white,
            ),
          ): Center(
            child: Icon(icon,  color: iconColor ?? Colors.white,),
          )
      ),
    );
  }
}


class AppBackButton extends StatelessWidget {
  final Color color;
  final VoidCallback? function;
  final bool? isLoading;
  final double? width;
  final IconData icon;
  final Color? iconColor;


  const AppBackButton({Key? key, required this.color, this.function, this.isLoading=false, this.width,  required this.icon, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Bounceable(
      onTap: function ?? (){context.pop();},
      child: Container(
        width: 10.w,
        height: 6.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:  color,
          // borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Center(
          child: Icon(icon, color: iconColor ?? Colors.black),
        ),
      ),
    );
  }
}
