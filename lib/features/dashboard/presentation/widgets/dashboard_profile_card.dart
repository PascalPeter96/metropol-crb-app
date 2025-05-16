import 'package:flutter/material.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class DashboardProfileCard extends StatelessWidget {
  const DashboardProfileCard({super.key});

  @override
  Widget build(BuildContext context) {

    String getGreeting() {
      final hour = DateTime.now().hour;

      if (hour >= 5 && hour < 12) {
        return 'Good Morning';
      } else if (hour >= 12 && hour < 17) {
        return 'Good Afternoon';
      } else if (hour >= 17 && hour < 21) {
        return 'Good Evening';
      } else {
        return 'Hello';
      }
    }

    return SizedBox(
      width: 90.w,
      child: Card(
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getGreeting()),
                  Text('Mawanda Peter',
                    style: AppTheme.purpleCardTitle,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'D.O.B : ',
                        style: AppTheme.normalText,
                        children: [
                          TextSpan(
                              text: '7th-April-1996',
                              style: AppTheme.appSubText
                          )
                        ]
                    ),
                  ),

                  RichText(
                    text: TextSpan(
                        text: 'N.I.N : ',
                        style: AppTheme.normalText,
                        children: [
                          TextSpan(
                              text: 'WTE52HEU38UE',
                              style: AppTheme.appSubText
                          )
                        ]
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('CRB Score', style: AppTheme.purpleSubText175,),
                  Text('800',
                    style: AppTheme.greenScoreText,
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
