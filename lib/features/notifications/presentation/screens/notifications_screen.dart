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
import 'package:metropol_mawanda_peter/features/notifications/data/notification_repository.dart';
import 'package:metropol_mawanda_peter/features/notifications/model/notification_model.dart';
import 'package:metropol_mawanda_peter/features/notifications/presentation/widgets/notification_card.dart';
import 'package:metropol_mawanda_peter/services/notifications/notification_service.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/app_header.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserProvider)?.uid;
    final notifications = ref.watch(getNotificationsProvider(userId ?? ''));
    return Scaffold(
      appBar: AppCustomHeader(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: AppTheme.primaryColor,
              child: Padding(padding: AppTheme.mainCardAxisPadding,
                  child: Text((notifications.isLoading || notifications.hasError) ? '0' : notifications.value!.length.toString(), style: AppTheme.whiteButtonText,)
              ),
            ),
            Text((notifications.isLoading || notifications.hasError) ? 'Notifications' :notifications.value!.length <= 1 ? 'Notification' : 'Notifications', style: AppTheme.appHeader,)
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
            notifications.when(
                data: (data) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                        ref.refresh(getNotificationsProvider(userId ?? ''));
                      },
                      child: ListView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var n = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Bounceable(
                                onTap: () async {
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  final String? fcm = prefs.getString('fcm');

                                  print('my fcm $fcm');

                                  DocumentReference n = FirebaseFirestore.instance.collection('users').doc(userId).collection('notifications').doc();
                                  await n.set({
                                    'id' : n.id,
                                    'body' : 'Your CRB score is now 750',
                                    'date': DateTime.now(),
                                    'title' :'CRB score update',
                                    'isSeen' : false,
                                  });

                                  await NotificationService.sendNoficationToselectedUser(
                                    deviceToken: fcm.toString(),
                                    title:
                                    'CRB score update',
                                    type: 'metropol',
                                    recieverId: '',
                                    senderId: '',
                                    data: {},
                                    body:
                                    'Your CRB score is now 750',
                                    channelId: 'metropol',

                                  );
                                },
                                  child: NotificationCard(n)),
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
                        return NotificationCard(NotificationsModel(id: '', title: 'title', body: 'body', date: DateTime.now(), isSeen: false));
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
