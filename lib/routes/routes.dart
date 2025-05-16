


import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/screens/register_screen.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:metropol_mawanda_peter/features/credit_inquiries/presentation/screens/credit_inquiries_screen.dart';
import 'package:metropol_mawanda_peter/features/dashboard/presentation/screens/dashboard_bottom_nav_bar.dart';
import 'package:metropol_mawanda_peter/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:metropol_mawanda_peter/features/loan_approvals/presentation/screens/loan_approvals_screen.dart';
import 'package:metropol_mawanda_peter/features/loan_repayments/presentation/screens/loan_repayments_screen.dart';
import 'package:metropol_mawanda_peter/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:metropol_mawanda_peter/routes/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'routes.g.dart';

enum AppRoutes {
  dashboard,
  signIn,
  register,
  loanApprovals,
  loanApprovalDetails,
  loanRepayments,
  loanRepaymentDetails,
  creditInquiries,
  creditInquiryDetails,
  notifications,
}

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

@riverpod
GoRouter goRouter (GoRouterRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: '/dashboard',
      debugLogDiagnostics: true,
      redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if(isLoggedIn && (state.uri.toString() == '/signIn' || state.uri.toString() == '/register')) {
        return '/dashboard';
      } else if(!isLoggedIn && state.uri.toString().startsWith('/dashboard')){
        return '/signIn';
      }
      return null;
      },
      refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
      routes: [
        GoRoute(path: '/dashboard',
          name: AppRoutes.dashboard.name,
          // builder: (context, state) => DashboardScreen(),
          builder: (context, state) => DashboardBottomNavBar(),
        ),
        GoRoute(path: '/signIn',
            name: AppRoutes.signIn.name,
            builder: (context, state) => SignInScreen(),
        ),
        GoRoute(path: '/register',
          name: AppRoutes.register.name,
          builder: (context, state) => RegisterScreen(),
        ),

        GoRoute(path: '/loanApprovals',
          name: AppRoutes.loanApprovals.name,
          builder: (context, state) => LoanApprovalsScreen(),
        ),
        // GoRoute(path: '/loanApprovalDetails:id',
        //   name: AppRoutes.loanApprovals.name,
        //   builder: (context, state) => RegisterScreen(),
        // ),
        GoRoute(path: '/loanRepayments',
          name: AppRoutes.loanRepayments.name,
          builder: (context, state) => LoanRepaymentsScreen(),
        ),
        // GoRoute(path: '/loanRepaymentDetails:id',
        //   name: AppRoutes.loanRepaymentDetails.name,
        //   builder: (context, state) => RegisterScreen(),
        // ),
        GoRoute(path: '/creditInquiries',
          name: AppRoutes.creditInquiries.name,
          builder: (context, state) => CreditInquiriesScreen(),
        ),

        GoRoute(path: '/notifications',
          name: AppRoutes.notifications.name,
          builder: (context, state) => NotificationsScreen(),
        ),

  ]);

}