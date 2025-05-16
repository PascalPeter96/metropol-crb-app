import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:metropol_mawanda_peter/features/auth/presentation/controllers/auth_controller.dart';
import 'package:metropol_mawanda_peter/main.dart';
import 'package:metropol_mawanda_peter/routes/routes.dart';
import 'package:metropol_mawanda_peter/theme/app_theme.dart';
import 'package:metropol_mawanda_peter/widgets/app_buttons.dart';
import 'package:metropol_mawanda_peter/widgets/app_text_fields.dart';
import 'package:metropol_mawanda_peter/widgets/async_value_response.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {

  final emailCont = TextEditingController();
  final passwordCont = TextEditingController();

  bool isChecked = false;
  String myFcm = '';


  void validateDetails(){
    String email = emailCont.text.trim();
    String password = passwordCont.text.trim();

    if(email.isEmpty || password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ensure all inputs are filled'),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      ref.read(authControllerProvider.notifier).signInWithEmailAndPassword(email, password);
    }

  }


  getMyFcm() async {
    String? token = await firebaseMessaging.getToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm', token.toString());
    setState(() {
      myFcm = token.toString();
    });

    debugPrint('my fcm is $myFcm');
    debugPrint('my saved fcm is ${prefs.getString('fcm')}');

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMyFcm();
  }

  @override
  void dispose() {
    emailCont.dispose();
    passwordCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(authControllerProvider);
    
    ref.listen<AsyncValue>(authControllerProvider, (_, state){
      state.showAlertToast(context);
    });

    return  SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 1.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Image.asset('assets/images/metropol_logo.png'),


                  Text('Welcome back...', style: AppTheme.purpleCardTitle,),
                  SizedBox(height: 3.h,),

                  AppTextField(
                    keyBoardType: TextInputType.emailAddress,
                    controller: emailCont,
                      hintText: 'mawandapeter@gmail.com',
                      obscureText: false,
                      label: 'Email',
                    enabled: true,
                    borderSide: BorderSide(),
                  ),
                  SizedBox(height: 3.h,),
                   AppTextField(
                    controller: passwordCont,
                    keyBoardType: TextInputType.text,
                      hintText: 'metropol@2025',
                      obscureText: true,
                      label: 'password',
                    enabled: true,
                    borderSide: BorderSide(),
                  ),
              
                  SizedBox(height: 5.h,),
              
                  AppButton(
                      isLoading: state.isLoading,
                      title: 'Sign In',
                      color: AppTheme.primaryColor,
                      function: (){
                    validateDetails();
                      }),
              
                  SizedBox(height: 3.h,),

                  Text('Don\'t have an account?', style: AppTheme.appSubText,),
              
                  AppButton(
                      title: 'Sign Up',
                      color: AppTheme.black,
                      function: (){
                    context.pushNamed(AppRoutes.register.name);
                      }),
              
              
              
              
                ],
              ),
            ),
          ),
    ));
  }
}
