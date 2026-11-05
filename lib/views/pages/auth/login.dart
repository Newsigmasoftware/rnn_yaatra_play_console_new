import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/constants/images.dart'; 
import 'package:rnn_yaatra/helpers/url_helpers.dart'; 
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/auth_view_models/login_view_model.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {

  final LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    var invisiblePassword = ref.watch(loginViewModel.pageStateProvider).invisiblePassword;

    return Scaffold(
      backgroundColor: Color(0xfff6f8fc),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.0,
              width: ScreenHelper().get_width(context),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  
                  Positioned.fill(child: Image.asset(AppImage.LOGIN_TOP,width: ScreenHelper().get_width(context),fit: BoxFit.cover,)),
                  Positioned(
                    bottom: -20,
                    left: -45,
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: AppColor.SECONDARY_COLOR,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: -60,
                    child: CircleAvatar(
                      radius: 45.0,
                      backgroundColor: AppColor.PRIMARY_COLOR,
                    ),
                  ),

                  // Positioned.fill(
                  //   child: SafeArea(
                  //     child: SingleChildScrollView(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           AddVerticalSpacing(50.0),
                            
                            
                        
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.WHITE,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.GREY_LIGHT.withValues(alpha: 0.5),
                          spreadRadius: 2.0,
                          blurRadius: 10.0,
                          offset: Offset(0, 3)
                        )
                      ]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                    width: ScreenHelper().get_width(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset(AppImage.Favicon,height: 120.0,)),
                        AddVerticalSpacing(20.0),
                        Center(child: Text("Welcome Back",style: StyleHelper.popinsStyle(fontSize: 22.0,fontWeight: FontWeight.w600,color: AppColor.PRIMARY_COLOR),)),
                        Center(child: Text("Explore India. Experience Bhatar.",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY))),
                        AddVerticalSpacing(20.0),

                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.GREY_LIGHT.withValues(alpha: 0.7)),
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                          child: txt_field_widget(
                            controller: loginViewModel.txt_userID,
                            title: "User ID",
                            hintText: "Enter Your User ID",
                            icon: Container(
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.07),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Iconsax.user,color: AppColor.PRIMARY_COLOR,),
                            ),
                          ),
                        ),
                        AddVerticalSpacing(15.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.GREY_LIGHT.withValues(alpha: 0.7)),
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                          child: txt_field_widget(
                            controller: loginViewModel.txt_password,
                            title: "Password",
                            hintText: "Enter Your Password",
                            obsecureText: invisiblePassword,
                            icon: Container(
                              decoration: BoxDecoration(
                                color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.07),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Iconsax.key,color: AppColor.PRIMARY_COLOR,),
                            ),
                            suffixIcon: CustomInkWell(
                              onTap: (){
                                ref.read(loginViewModel.pageStateProvider.notifier).setPassword(
                                  invisiblePassword: !invisiblePassword
                                );
                              },
                              child: Icon(invisiblePassword ? Iconsax.eye_slash : Iconsax.eye,size: 22.0,color: AppColor.TEXT_GREY)),
                          ),
                        ),

                        AddVerticalSpacing(25.0),
                        primaryButton(
                          title: "Login",
                          onTap: (){
                            // AppNav.push(context: context,path: AppRouteString.Dashboard);
                            loginViewModel.login();
                          },
                        ), 

                        AddVerticalSpacing(25.0),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(color: AppColor.GREY_LIGHT,),
                            ),
                            AddHorizontalSpacing(10.0),
                            Text("OR",style: StyleHelper.popinsStyle(fontSize: 14.0,color: AppColor.TEXT_GREY,fontWeight: FontWeight.w500)),
                            AddHorizontalSpacing(10.0),
                            Expanded(
                              child: Divider(color: AppColor.GREY_LIGHT,),
                            ),
                          ],
                        ),     

                        AddVerticalSpacing(10.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)
                            ),
                            border: Border(
                              left: BorderSide(color: AppColor.GREY_LIGHT),
                              top: BorderSide(color: AppColor.GREY_LIGHT),
                              right: BorderSide(color: AppColor.GREY_LIGHT),
                            )
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                          width: ScreenHelper().get_width(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Want to become a customer?",style: StyleHelper.popinsStyle(fontSize: 13.0,color: AppColor.TEXT_GREY),textAlign: TextAlign.center,),
                              AddVerticalSpacing(5.0),
                              CustomInkWell(
                                onTap: (){
                                  UrlHelper().launchUrl(APIURL.CONTACT_US);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Contact Us ",
                                        style: StyleHelper.popinsStyle(fontSize: 16.0,color: AppColor.PRIMARY_COLOR,fontWeight: FontWeight.w500)
                                      ),
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Icon(Icons.arrow_circle_right_outlined,color: AppColor.PRIMARY_COLOR,)
                                      ),
                                    ]
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),                  
                      ],
                    ),
                  ),
                ],
              ),
            ),

            AddVerticalSpacing(30.0),
            
            
            
          ],
        ),
      ),
    );
  }
}