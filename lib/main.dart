import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/routing/app_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   ScreenHelper.init();
  // });
  // ScreenHelper.init();

  // await GetStorage.init();
  // await Firebase.initializeApp();
  // await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: ToastificationWrapper(child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetMaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser:
          AppRouter.router.routeInformationParser,

      routeInformationProvider:
          AppRouter.router.routeInformationProvider,

      // routerConfig: AppRouter.router,

      // navigatorKey: navigatorKey,
      // initialRoute: AppRouteString.INITIAL_ROUTE,
      // getPages: AppRouter.pages,
      debugShowCheckedModeBanner: false,
      title: AppConstants.APP_NAME,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          fontSizeFactor: 1.0, // Scale factor set to 1
        ),
        // scaffoldBackgroundColor: AppColor.SCCAFOLD_BG,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.PRIMARY_COLOR,
          surfaceTintColor: AppColor.WHITE,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        scaffoldBackgroundColor: AppColor.WHITE,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.PRIMARY_COLOR),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      builder: (context, child) {
        // ScreenHelper.init(context);
        return ToastificationConfigProvider(
          config: const ToastificationConfig(
            // margin: EdgeInsets.fromLTRB(0, 16, 0, 110),
            alignment: Alignment.center,
            itemWidth: 440,
            animationDuration: Duration(milliseconds: 500),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              // textScaleFactor: 1.0, // Lock the font size scaling to 1.0
              textScaler: TextScaler.linear(1.0)
            ),
            child: child!,
          )
        );
      },
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      //     // data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0),textScaleFactor: 1.0),
      //     child: ToastificationConfigProvider(
      //       config: const ToastificationConfig(
      //         // margin: EdgeInsets.fromLTRB(0, 16, 0, 110),
      //         alignment: Alignment.center,
      //         itemWidth: 440,
      //         animationDuration: Duration(milliseconds: 500),
      //       ),
      //       child: child!
      //     ),
      //   );
      // },
      
      // home: RootRun(),
    );
  }
}


class RootRun extends StatefulWidget {
  RootRun({super.key});

  @override
  State<RootRun> createState() => _RootRunState();
}

class _RootRunState extends State<RootRun> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      // AppNav.offAll(SplashScreen());
      context.go(AppRouteString.SPLASH_SCREEN);
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
