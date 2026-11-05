import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/helpers/app_storage.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/helpers/url_helpers.dart';
import 'package:rnn_yaatra/routing/app_router.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
import 'package:rnn_yaatra/view_models/home_view_models/home_view_model.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/image_view.dart';
import 'package:rnn_yaatra/widgets/shimmer.dart';


class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(getProfileViewModelNotifier.notifier).get_profile_detail();
      ref.read(homeViewModel.pageStateProvider.notifier).get_dashboard_data();
    });
  }

  @override
  Widget build(BuildContext context) {
    var loadingProfile = ref.watch(getProfileViewModelNotifier).isLoadingProfile;
    var profileDetail = ref.watch(getProfileViewModelNotifier).getProfileDetailResponseModel;

    var dashboardDetail = ref.watch(homeViewModel.pageStateProvider).dashboardResponseModel;

    String walletBalance = "₹ 0.00";
    String fundWallet = "₹ 0.00";

    if (dashboardDetail?.dt6 != null && dashboardDetail!.dt6!.isNotEmpty) {
      for (var item in dashboardDetail.dt6!) {
        if (item.id.toString() == "1") {
          walletBalance = "₹ ${StringsHelper.formatIndianNumberDynamic(item.value ?? "")}";
        } else if (item.id.toString() == "2") {
          fundWallet = "₹ ${StringsHelper.formatIndianNumberDynamic(item.value ?? "")}";
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_COLOR,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.PRIMARY_COLOR,
                    border: Border(
                      bottom: BorderSide(color: AppColor.SECONDARY_COLOR,width: 6.0),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(AppImage.SPLASH_BOTTOM,width: ScreenHelper().get_width(context),fit: BoxFit.cover,),
                      ),
                      Positioned.fill(
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Account",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                 
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Profile Card
                Positioned(
                  top: 110,
                  left: 20,
                  right: 20,
                  child: loadingProfile ? accountProfileCartShimmer() : Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 86,
                          height: 86,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Stack(
                            children: [

                              CustomPaint(
                                painter: HalfCircleBorderPainter(
                                  firstColor: Colors.orange,
                                  secondColor: AppColor.PRIMARY_COLOR,
                                  strokeWidth: 2,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40.0),
                                    child: profileDetail?.data?.photo != null && profileDetail!.data!.photo!.trim().isNotEmpty
                                        ? show_simple_network_image(
                                            context,
                                            imageURL: profileDetail.data!.photo!.startsWith("http")
                                                ? profileDetail.data!.photo!
                                                : "${APIURL.IMAGE_BASE_URL}${profileDetail.data!.photo!}",
                                            height: 80.0,
                                            width: 80.0,
                                            fit: BoxFit.cover,
                                            radius: 40.0,
                                          )
                                        : Image.asset(
                                            AppImage.AVATAR,
                                            height: 80.0,
                                            width: 80.0,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.SECONDARY_COLOR),
                                    shape: BoxShape.circle,
                                    color: AppColor.WHITE
                                  ),
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.camera_alt,color: AppColor.PRIMARY_COLOR,size: 16.0),
                                ),
                                // child: CircleAvatar(
                                //   backgroundColor: AppColor.WHITE,
                                //   radius: 14.0,
                                //   child: Icon(Icons.camera_alt,color: AppColor.PRIMARY_COLOR,size: 18.0),
                                // ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(3),
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     border: Border.all(color: Colors.orange.shade400, width: 2),
                        //   ),
                        //   child: const CircleAvatar(
                        //     radius: 40,
                        //     backgroundColor: Colors.white,
                        //     backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                        //   ),
                        // ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileDetail?.data?.username ?? "NA",
                                style: TextStyle(
                                  color: AppColor.PRIMARY_COLOR,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              RichText(
                                text: TextSpan(
                                  text: "",
                                  style: TextStyle(color: AppColor.TEXT_DARK, fontSize: 13),
                                  children: [
                                    TextSpan(
                                      // text: "XXXXXXXXXXXX",
                                      text: profileDetail?.data?.userid ?? "",
                                      style: TextStyle(color: AppColor.PRIMARY_COLOR, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.PRIMARY_COLOR,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            AddVerticalSpacing(70.0),

            // Account Settings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
                      child: Text(
                        "Account Settings",
                        style: TextStyle(
                          color: AppColor.PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    
                    _buildSettingsItem(Icons.person, "Personal Information",onTap: (){
                      AppNav.push(context: context,path: AppRouteString.EditProfile);
                    }),

                    _buildSettingsItem(Icons.badge_outlined, "KYC Details",onTap: (){
                      AppNav.push(context: context,path: AppRouteString.KycVerification);
                    }),

                    // _buildSettingsItem(Icons.person, "Our Services",onTap: (){
                    //   AppNav.push(context: context,path: AppRouteString.OurServicesMenu);
                    // }),
                    
                    _buildSettingsItem(Icons.tour, "My Bookings",onTap: (){
                      AppNav.push(context: context,path: AppRouteString.PurchaseReport);
                    }),

                    // _buildSettingsItem(Icons.group, "Team",onTap: (){
                    //   AppNav.push(context: context,path: AppRouteString.TeamMenu);
                    // }),

                    // _buildSettingsItem(Icons.speed_outlined, "Ledger",onTap: (){
                    //   AppNav.push(context: context,path: AppRouteString.IncomeLedger);
                    // }),

                    _buildSettingsItem(Icons.wallet, "My Wallet",onTap: (){
                      AppNav.push(context: context,path: AppRouteString.FundMenu);
                    }),

                    _buildSettingsItem(Icons.wallet, "Support Ticket",onTap: (){
                      AppNav.push(context: context,path: AppRouteString.ReportedMe);
                    }),

                    _buildSettingsItem(Icons.lock_outline, "Password",onTap: (){
                      AppNav.push(context: context,path: AppRouteString.PasswordMenu);
                    }),

                    // _buildSettingsItem(Icons.phone_android_outlined, "Registered Mobile"),
                    // _buildSettingsItem(Icons.mail_outline, "Registered Email"),
                    // _buildSettingsItem(Icons.account_balance_outlined, "Bank Details"),
                    // _buildSettingsItem(Icons.security_outlined, "Security Settings"),
                    // _buildSettingsItem(Icons.notifications_none_outlined, "Notification Settings"),
                    
                    // _buildSettingsItem(Icons.info, "Important Information",onTap: (){
                    //   AppNav.push(context: context,path: AppRouteString.ImportantInformationScreen);
                    // }),

                    // _buildSettingsItem(Icons.info_outline, "How It Works",onTap: (){
                    //   AppNav.push(context: context,path: AppRouteString.HowItWorksScreen);
                    // }),
               
                    _buildSettingsItem(Icons.help_outline, "Contact Us",onTap: (){
                      UrlHelper().launchUrl(APIURL.CONTACT_US);
                    }),
                    
                    _buildSettingsItem(Icons.info_outline, "About Us",onTap: (){
                      UrlHelper().launchUrl(APIURL.ABOUT_US);
                    }),

                    _buildSettingsItem(Iconsax.shield, "Privacy Policy", isLast: true,onTap: (){
                      UrlHelper().launchUrl(APIURL.PRIVACY_POLICY);
                    }),

                    AddVerticalSpacing(5.0),
                  ],
                ),
              ),
            ),
            AddVerticalSpacing(20.0),

            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomInkWell(
                    onTap: (){
                      showSearchJobConfirmationDialog(
                        context: context,
                        title: "CONFIRMATION",
                        content: "Are you sure you want to logout?",
                        buttonText: "Logout",
                        onConfirm: (){
                          AppStorage.deleteAll();
                          AppNav.go(context: context,path: AppRouteString.Login);
                        }
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  AddVerticalSpacing(20.0),
                  Center(child: CustomInkWell(
                    onTap: (){
                      showSearchJobConfirmationDialog(
                        context: context,
                        title: "CONFIRMATION",
                        content: "Are you sure you want to delete your account?",
                        buttonText: "Delete",
                        onConfirm: (){
                          AppStorage.deleteAll();
                          AppNav.go(context: context,path: AppRouteString.Login);
                        }
                      );
                    },
                    child: Text("I want to delete my account?",style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.RED,fontWeight: FontWeight.w500),)))
                ],
              ),
            ),
            AddVerticalSpacing(40.0),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletItem({required IconData icon, required String title, required String amount,onTap}) {
    return Expanded(
      child: CustomInkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColor.PRIMARY_COLOR, size: 20),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    
                  ),
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white70, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, {bool isLast = false,onTap}) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: ListTile(
            dense: true,
            leading: Icon(icon, color: AppColor.PRIMARY_COLOR, size: 22),
            title: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
            trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
            onTap: onTap,
          ),
        ),
        if (!isLast)
          const Divider(
            height: 1,
            indent: 55,
            endIndent: 15,
            color: Color(0xFFF0F0F0),
          ),
      ],
    );
  }
}



class HalfCircleBorderPainter extends CustomPainter {
  final Color firstColor;
  final Color secondColor;
  final double strokeWidth;

  HalfCircleBorderPainter({
    required this.firstColor,
    required this.secondColor,
    this.strokeWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // First half - Orange
    paint.color = firstColor;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -3.14159 / 2, // Top
      3.14159,      // 180°
      false,
      paint,
    );

    // Second half - Blue
    paint.color = secondColor;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      3.14159 / 2,  // Bottom
      3.14159,      // 180°
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant HalfCircleBorderPainter oldDelegate) {
    return oldDelegate.firstColor != firstColor ||
        oldDelegate.secondColor != secondColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
