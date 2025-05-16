import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';


class SectionMoreHeader extends StatelessWidget {
  final String title;
  final VoidCallback? function;
  const SectionMoreHeader({super.key, required this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTheme.sectionTitleText,),
        function == null ? Container() : Bounceable(
            onTap: function,
            child: Text('view all', style: AppTheme.appSubText,))
      ],
    );
  }
}