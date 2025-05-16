import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class DashboardOptionCard extends ConsumerWidget {
  final String title;
  final String imageUrl;
  const DashboardOptionCard(this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Image.asset(imageUrl)),
        Center(child: Text(title, style: AppTheme.purpleSubText,
          textAlign: TextAlign.center,
        ))
      ],
    );
  }
}