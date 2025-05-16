import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metropol_mawanda_peter/features/auth/data/auth_repository.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/controllers/auth_controller.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/app_buttons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DashboardLogoutScreen extends ConsumerWidget {
  const DashboardLogoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(currentUserProvider)?.uid;
    final authState = ref.watch(authControllerProvider);
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(child: Text('Are you sure to log out ?', style: AppTheme.purpleSubText,)),
          SizedBox(height: 5.h,),

          Center(
            child: AppIconButton(
              isLoading: authState.isLoading,
                color: Colors.red,
              function: () async {
                final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
                final String? token = await asyncPrefs.getString('fcm');
                ref.read(authControllerProvider.notifier).deleteFcmTokenAndSignOut(
                  userId.toString(),
                  token ?? '',
                );
                print('my userId $userId');
              },

              icon: Icons.logout,
            ),
          )

        ],
      ),

    );
  }
}

