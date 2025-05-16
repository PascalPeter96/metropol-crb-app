import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/auth/data/auth_repository.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/controllers/auth_controller.dart';
import 'package:metropol_mawanda_peter/features/loan_approvals/data/loan_approval_repository.dart';
import 'package:metropol_mawanda_peter/features/loan_approvals/model/loan_approval_model.dart';
import 'package:metropol_mawanda_peter/features/loan_approvals/presentation/widgets/loan_approval_card.dart';
import 'package:metropol_mawanda_peter/services/notifications/notification_service.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/app_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoanApprovalsScreen extends ConsumerStatefulWidget {
  const LoanApprovalsScreen({super.key});

  @override
  ConsumerState createState() => _LoanApprovalsScreenState();
}

class _LoanApprovalsScreenState extends ConsumerState<LoanApprovalsScreen> {

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)?.uid;
    final loanApprovals = ref.watch(getLoanApprovalsProvider(userId ?? ''));
    return Scaffold(
      appBar: AppCustomHeader(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: AppTheme.primaryColor,
              child: Padding(padding: AppTheme.mainCardAxisPadding,
                  child: Text((loanApprovals.isLoading || loanApprovals.hasError) ? '0' : loanApprovals.value!.length.toString(), style: AppTheme.whiteButtonText,)
              ),
            ),
            Text((loanApprovals.isLoading || loanApprovals.hasError) ? 'Loan Approvals' :loanApprovals.value!.length <= 1 ? 'Loan Approval' : 'Loan Approvals', style: AppTheme.appHeader,)
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
            loanApprovals.when(
                data: (data) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                        ref.refresh(getLoanApprovalsProvider(userId ?? ''));
                      },
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var la = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Bounceable(
                                onTap: () async{

                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  final String? fcm = prefs.getString('fcm');

                                  print('my fcm $fcm');

                                  DocumentReference loanApp = FirebaseFirestore.instance.collection('users').doc(userId).collection('loanApprovals').doc();
                                  await loanApp.set({
                                    'id' : loanApp.id,
                                    'amount' : 1500000,
                                    'approvedDate': DateTime.now(),
                                    'lender' : 'Equity Uganda',
                                    'status' :'approved',
                                    'url': 'https://upload.wikimedia.org/wikipedia/commons/3/34/DTB_LOGO_.jpg?20160122143545'
                                  });

                                  await NotificationService.sendNoficationToselectedUser(
                                      deviceToken: fcm.toString(),
                                      title:
                                      'Approved Loan',
                                      type: 'loanApprovals',
                                      recieverId: '',
                                      senderId: '',
                                      data: {},
                                      body:
                                      'Approved Loan of 1.5M UGX',
                                      channelId: '',

                                  );

                                },
                                  child: LoanApprovalCard(la)),
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
                        return LoanApprovalCard(LoanApprovalModel(id: '', amount: 0, lender: 'lender', approvedDate: DateTime.now(), status: '', url: 'https://equitygroupholdings.com/wp-content/themes/equity/assets/img/equity-bank-logo.png'));
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
