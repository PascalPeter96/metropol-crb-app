import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/auth/data/auth_repository.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/controllers/auth_controller.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/data/credit_inquiry_repository.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/model/credit_inquiry_model.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/presentation/widgets/credit_inquiry_card.dart';
import 'package:metropol_mawanda_peter/services/notifications/notification_service.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/app_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CreditInquiriesScreen extends ConsumerStatefulWidget {
  const CreditInquiriesScreen({super.key});

  @override
  ConsumerState createState() => _CreditInquiriesScreenState();
}

class _CreditInquiriesScreenState extends ConsumerState<CreditInquiriesScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)?.uid;
    final creditInquiries = ref.watch(getCreditInquiriesProvider(userId ?? ''));
    return Scaffold(
      appBar: AppCustomHeader(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: AppTheme.primaryColor,
              child: Padding(padding: AppTheme.mainCardAxisPadding,
                  child: Text((creditInquiries.isLoading || creditInquiries.hasError) ? '0' : creditInquiries.value!.length.toString(), style: AppTheme.whiteButtonText,)
              ),
            ),
            Text((creditInquiries.isLoading || creditInquiries.hasError) ? 'Credit Inquiries' :creditInquiries.value!.length <= 1 ? 'Credit Inquiry' : 'Credit Inquiries', style: AppTheme.appHeader,)
          ],
        ),
        actions: [
        ],
      ),


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [

            SizedBox(height: 3.h,),
            creditInquiries.when(
                data: (data) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                        ref.refresh(getCreditInquiriesProvider(userId ?? ''));
                      },
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var ci = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Bounceable(
                                onTap: () async{
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  final String? fcm = prefs.getString('fcm');

                                  print('my fcm $fcm');

                                  DocumentReference ci = FirebaseFirestore.instance.collection('users').doc(userId).collection('creditInquiries').doc();
                                  await ci.set({
                                    'id' : ci.id,
                                    'institution' : 'NCBA UG',
                                    'inquiryDate': DateTime.now(),
                                    'reason' :'Business loan request',
                                    'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzCKyBcJ1zxeBOC14KTLjD_uuahcloWmzBampCLiXtpqnnE-tL0VkHLUmaJmhJ2yM1Jfw&usqp=CAU'
                                  });

                                  await NotificationService.sendNoficationToselectedUser(
                                    deviceToken: fcm.toString(),
                                    title:
                                    'Credit Inquiry',
                                    type: 'creditInquiries',
                                    recieverId: '',
                                    senderId: '',
                                    data: {},
                                    body:
                                    'Credit inquiry on you by NCBA UG',
                                    channelId: '',

                                  );
                                },
                                  child: CreditInquiryCard(ci)),
                            );
                          }),
                    ),
                  );
                }, error: (e, st) {
              return Text(e.toString());
            }, loading: (){
              return Expanded(
                child: Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CreditInquiryCard(CreditInquiryModel(id: '', institution: 'institution', reason: 'reason', inquiryDate: DateTime.now(), url: 'https://equitygroupholdings.com/wp-content/themes/equity/assets/img/equity-bank-logo.png'));
                      }),
                ),
              );
            }),
          ],
        ),
      ),

    );
  }
}
