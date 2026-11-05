// ignore_for_file: non_constant_identifier_names
import 'package:rnn_yaatra/main.dart';
import 'package:rnn_yaatra/views/pages/account/edit_profile.dart';
import 'package:rnn_yaatra/views/pages/account/kyc_verification.dart';
import 'package:rnn_yaatra/views/pages/auth/login.dart'; 
import 'package:rnn_yaatra/views/pages/fund_management/deposit_request.dart';
import 'package:rnn_yaatra/views/pages/fund_management/fund_menu.dart';
import 'package:rnn_yaatra/views/pages/fund_management/fund_request_report.dart';
import 'package:rnn_yaatra/views/pages/home/dashboard.dart';
import 'package:rnn_yaatra/views/pages/home/home.dart'; 
import 'package:rnn_yaatra/views/pages/our_services/our_services_menu.dart';
import 'package:rnn_yaatra/views/pages/our_services/puchase_plan.dart';
import 'package:rnn_yaatra/views/pages/our_services/purchase_report.dart';
import 'package:rnn_yaatra/views/pages/password_management/change_login_password.dart'; 
import 'package:rnn_yaatra/views/pages/password_management/password_menu.dart'; 
import 'package:rnn_yaatra/views/pages/welcome/purchase_plan_information.dart'; 
import 'package:rnn_yaatra/views/pages/welcome/splash_screen.dart'; 
import 'package:go_router/go_router.dart'; 
// import 'package:rnn_yaatra/views/pages/withdrawal_manag

import 'package:rnn_yaatra/views/pages/reported_me/dart/raise_ticket_detail_screen.dart';
import 'package:rnn_yaatra/views/pages/reported_me/dart/raise_ticket_screen.dart';
import 'package:rnn_yaatra/views/pages/reported_me/dart/report_screen.dart';
// import '../views/pages/withdrawal_management/withdrawal_report.dart'
// ;ement/withdrawal_report.dart';

class AppRouter {

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => RootRun(),
      ),
      GoRoute(
        path: AppRouteString.SPLASH_SCREEN,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRouteString.Login,
        builder: (context, state) => Login(),
      ),
       
      GoRoute(
        path: AppRouteString.Home,
        builder: (context, state) => Home(),
      ),
      GoRoute(
        path: AppRouteString.Dashboard,
        builder: (context, state) => Dashboard(),
      ),
       
      // GoRoute(
      //   path: AppRouteString.RankChart,
      //   builder: (context, state) => RankChart(),
      // ),
      GoRoute(
        path: AppRouteString.KycVerification,
        builder: (context, state) => KycVerification(),
      ),
      GoRoute(
        path: AppRouteString.OurServicesMenu,
        builder: (context, state) => OurServicesMenu(),
      ),
      GoRoute(
        path: AppRouteString.PuchasePlan,
        builder: (context, state) => PuchasePlan(),
      ),
      GoRoute(
        path: AppRouteString.PurchaseReport,
        builder: (context, state) => PurchaseReport(),
      ),
       
     
      GoRoute(
        path: AppRouteString.FundMenu,
        builder: (context, state) => FundMenu(),
      ),
      GoRoute(
        path: AppRouteString.ReportedMe,
        builder: (context, state) => ReportScreen(),
      ),
      GoRoute(
        path: AppRouteString.DepositRequest,
        builder: (context, state) => DepositRequest(),
      ),
      GoRoute(
        path: AppRouteString.FundRequestReport,
        builder: (context, state) => FundRequestReport(),
      ),
      // GoRoute(
      //   path: AppRouteString.WithdrawalReport,
      //   builder: (context, state) => WithdrawalReport(),
      // ),
      GoRoute(
        path: AppRouteString.PasswordMenu,
        builder: (context, state) => PasswordMenu(),
      ),
      GoRoute(
        path: AppRouteString.ChangeLoginPassword,
        builder: (context, state) => ChangeLoginPassword(),
      ),
      // GoRoute(
      //   path: AppRouteString.ChangeTransactionPassword,
      //   builder: (context, state) => ChangeTransactionPassword(),
      // ),
      GoRoute(
        path: AppRouteString.EditProfile,
        builder: (context, state) => EditProfile(),
      ),
      GoRoute(
        path: AppRouteString.RaiseTicketScreen,
        builder: (context, state) => const RaiseTicketScreen(),
      ),
      GoRoute(
        path: AppRouteString.RaiseTicketDetailScreen,
        builder: (context, state) => const RaiseTicketDetailScreen(),
      ),
      // GoRoute(
      //   path: AppRouteString.ImportantInformationScreen,
      //   builder: (context, state) => const ImportantInformationScreen(),
      // ),
      GoRoute(
        path: AppRouteString.HowItWorksScreen,
        builder: (context, state) => const HowItWorksScreen(),
      ),

    ],
  );

}


class AppRouteString{
  
  static const String INITIAL_ROUTE = "/";
  static String SPLASH_SCREEN = "/splashScreen";
  static String Login = "/Login"; 
  static String Home = "/Home";
  static String Dashboard = "/Dashboard";
  // static String IncomeMenus = "/IncomeMenus";
  // static String AipIncome = "/AipIncome";
  // static String LipIncome = "/LipIncome";
  // static String RewardPoolIncome = "/RewardIncentivePoolList";
  // static String RankChart = "/RankChart";
  static String KycVerification = "/KycVerification";
  static String OurServicesMenu = "/OurServicesMenu";
  static String PuchasePlan = "/PuchasePlan";
  static String PurchaseReport = "/PurchaseReport";
  // static String TeamMenu = "/TeamMenu";
  // static String DirectTeam = "/DirectTeam";
  // static String DownlineTeam = "/DownlineTeam";
  // static String IncomeLedger = "/IncomeLedger";
  static String FundMenu = "/FundMenu";
  static String ReportedMe = "/ReportedMe";
  static String DepositRequest = "/DepositRequest";
  static String FundRequestReport = "/FundRequestReport";
  // static String WithdrawalReport = "/WithdrawalReport";
  static String PasswordMenu = "/PasswordMenu";
  static String ChangeLoginPassword = "/ChangeLoginPassword";
  // static String ChangeTransactionPassword = "/ChangeTransactionPassword";
  static String EditProfile = "/EditProfile";
  static String RaiseTicketScreen = "/RaiseTicketScreen";
  static String RaiseTicketDetailScreen = "/RaiseTicketDetailScreen";
  // static String ImportantInformationScreen = "/ImportantInformationScreen";
  static String HowItWorksScreen = "/HowItWorksScreen";
}