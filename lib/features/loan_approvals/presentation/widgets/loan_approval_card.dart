import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/loan_approvals/model/loan_approval_model.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/model/loan_repayment_model.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/utils/utilities.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoanApprovalCard extends ConsumerWidget {
  final LoanApprovalModel loanApprovalModel;
  const LoanApprovalCard(this.loanApprovalModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.sp),
        side: BorderSide(
          color: AppTheme.purpleTextColor.withOpacity(0.4),
          width: 2
        )
      ),
      leading: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.5.sp)
        ),
        width: 20.w,
        height: 10.h,
        child: CachedNetworkImage(imageUrl: loanApprovalModel.url),
      ),
      title: Text(loanApprovalModel.lender, style: AppTheme.cardTitle16,),
      subtitle: Text(Utilities.formatToUS(loanApprovalModel.approvedDate)),
      trailing: Text('${loanApprovalModel.amount} UGX', style: AppTheme.priceText16,),
    );
  }
}