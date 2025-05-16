
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/controllers/auth_controller.dart';
import 'package:metropol_mawanda_peter/features/dashboard/presentation/widgets/dashboard_option_card.dart';
import 'package:metropol_mawanda_peter/features/dashboard/presentation/widgets/dashboard_profile_card.dart';
import 'package:metropol_mawanda_peter/routes/routes.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/section_more_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {

  var options =  DashboardOptions.dashboardOptions;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/metropol_logo.png',
                    // height: 5.h,
                    width: 16.h,
                  ),
                  // Icon(Icons.notifications)
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile2.jpg'),
                  )
                ],
              ),
              SizedBox(height: 1.h,),
              DashboardProfileCard(),
              SizedBox(height: 4.h,),
              SectionMoreHeader(title: 'Also check out'),

              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: options.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                    var option = options[index];
                      return  Bounceable(
                          onTap: (){
                            if(index == 0) {
                              context.pushNamed(AppRoutes.loanApprovals.name);
                            } else if(index == 1) {
                              context.pushNamed(AppRoutes.loanRepayments.name);
                            } else if(index == 2) {
                              context.pushNamed(AppRoutes.creditInquiries.name);
                            } else if(index == 3) {
                              context.pushNamed(AppRoutes.notifications.name);
                            } else {

                            }
                          },
                          child: DashboardOptionCard(option.title, option.imageUrl));
                    }),
              ),


              // ListTile(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(15.sp),
              //     side: BorderSide(
              //       color: AppTheme.purpleTextColor.withOpacity(0.4),
              //       width: 2
              //     )
              //   ),
              //   leading: Container(
              //     clipBehavior: Clip.antiAlias,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12.5.sp)
              //     ),
              //     width: 20.w,
              //     height: 10.h,
              //     child: CachedNetworkImage(imageUrl: 'https://equitygroupholdings.com/wp-content/themes/equity/assets/img/equity-bank-logo.png'),
              //   ),
              //   title: Text('Equity Bank', style: AppTheme.cardTitle16,),
              //   subtitle: Text('5th-April-2025'),
              //   trailing: Text('4000000 UGX', style: AppTheme.priceText16,),
              // )


            ],
          ),
        ),
      ),

    );
  }
}



class DashboardOptions {
  final String title;
  final String imageUrl;


  DashboardOptions({required this.title, required this.imageUrl});

  static var dashboardOptions = [
    DashboardOptions(
        title: 'Loan\nApprovals',
        imageUrl: 'assets/images/la.png',),

    DashboardOptions(
      title: 'Loan\nRepayments',
      imageUrl: 'assets/images/lr.png',),

    DashboardOptions(
      title: 'Credit\nInquiries',
      imageUrl: 'assets/images/ci.png',),

    DashboardOptions(
      title: 'CRB\nNotifications',
      imageUrl: 'assets/images/n.png',),






  ];

}