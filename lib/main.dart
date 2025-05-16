import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metropol_mawanda_peter/routes/routes.dart';
import 'package:metropol_mawanda_peter/services/notifications/notification_service.dart';
import 'package:metropol_mawanda_peter/services/notifications/notification_types.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'firebase_options.dart';




@pragma('vm:entry-point')
Future<void> _firebasePushHandler(RemoteMessage remoteMessage) async {
  print('Message bg is from firebase1 ${remoteMessage.data}');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  print('remote bg msg1 =${remoteMessage.notification?.title}');



  if(remoteMessage.data['type'] == 'loanApprovals'){
    createLoanApprovalsNotification(
        remoteMessage.notification!.title.toString(),
        remoteMessage.notification!.body.toString(),
        remoteMessage.data.map((key, value) => MapEntry(key, value.toString())),
    );


  } else if (remoteMessage.data['type'] == 'loanRepayments'){
    createLoanRepaymentsNotification(
        remoteMessage.notification!.title.toString(),
        remoteMessage.notification!.body.toString(),
        remoteMessage.data.map((key, value) => MapEntry(key, value.toString())),

    );

  } else if (remoteMessage.data['type'] == 'creditInquiries'){
    createCreditInquiriesNotification(
        remoteMessage.notification!.title.toString(),
        remoteMessage.notification!.body.toString(),
        remoteMessage.data.map((key, value) => MapEntry(key, value.toString())),
    );

  } else {
    createMetropolNotification(
      remoteMessage.notification!.title.toString(),
      remoteMessage.notification!.body.toString(),
      remoteMessage.data.map((key, value) => MapEntry(key, value.toString())),
    );
    AwesomeNotifications().createNotificationFromJsonData(remoteMessage.data);


  }
}


var firebaseMessaging = FirebaseMessaging.instance;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  FirebaseMessaging.onBackgroundMessage(_firebasePushHandler);



  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp],);


  await NotificationService.initializeNotification();

  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }



  // Set up the FirebaseMessaging instance
  FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    log('My Notification Message is ${message.notification?.title}');


    if(message.data['type'] == 'loanApprovals'){
      createLoanApprovalsNotification(
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        message.data.map((key, value) => MapEntry(key, value.toString())),
      );


    } else if (message.data['type'] == 'loanRepayments'){
      createLoanRepaymentsNotification(
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        message.data.map((key, value) => MapEntry(key, value.toString())),

      );

    } else if (message.data['type'] == 'creditInquiries'){
      createCreditInquiriesNotification(
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        message.data.map((key, value) => MapEntry(key, value.toString())),
      );

    } else {
      createMetropolNotification(
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        message.data.map((key, value) => MapEntry(key, value.toString())),
      );

      AwesomeNotifications().createNotificationFromJsonData(message.data);


    }


    debugPrint('Received message: ${message.notification!.title}');
    debugPrint(message.data['screen']);
    debugPrint(message.data.toString());
  });


  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
            routerConfig: ref.watch(goRouterProvider),
            debugShowCheckedModeBanner: false,
            title: 'Metropol CRB',
            theme: ThemeData(
              fontFamily: GoogleFonts.righteous().fontFamily,
              // fontFamily: GoogleFonts.openSans().fontFamily,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              scaffoldBackgroundColor: const Color(0xffF2ECF6),

              useMaterial3: true,
            ),
          );
        }
    );
  }
}
