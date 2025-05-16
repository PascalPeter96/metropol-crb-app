import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppCustomHeader extends StatelessWidget implements PreferredSizeWidget{
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  const AppCustomHeader({super.key,  this.title,  this.actions,  this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: title ?? Container(),
      centerTitle: true,
      actions: actions ?? [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: Icon(Icons.menu),
        ),
      ],
      leading: leading ?? GestureDetector(onTap: (){context.pop();},child: Icon(Icons.arrow_back)),    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(7.5.h);

}