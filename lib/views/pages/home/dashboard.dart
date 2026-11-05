import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/views/pages/account/account.dart';
import 'package:rnn_yaatra/views/pages/home/home.dart'; 
import 'package:rnn_yaatra/views/pages/our_services/purchase_report.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {

  final activeTabIndexState = StateProvider<int>((ref) => 0);

  List<Widget> get itemList => <Widget>[
    Home(
      onClickMenu: (int menuindex) {
        ref.read(activeTabIndexState.notifier).state = menuindex;
      },
    ),
    PurchaseReport(),
    // IncomeMenus(
    //   onClickMenu: (int menuindex) {
    //     ref.read(activeTabIndexState.notifier).state = menuindex;
    //   },
    // ),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    var activeTabIndex = ref.watch(activeTabIndexState);
    List<TabItem> items = [
      TabItem(
        icon: Iconsax.home,
        title: 'Home',
      ),
      // TabItem(
      //   icon: Icons.currency_rupee, // Correct icon instead of Icons.barup
      //   title: 'Income',
      // ),
      // TabItem(
      //   icon: Iconsax.wallet,
      //   title: 'FD',
      // ),
      TabItem(
        icon: Icons.tour,
        title: 'Bookings',
      ),
      TabItem(
        icon: Iconsax.profile_circle5,
        title: 'Profile',
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          itemList[activeTabIndex]
        ],
      ),
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: AppColor.PRIMARY_COLOR,
        color: AppColor.WHITE,
        colorSelected: AppColor.WHITE,
        indexSelected: activeTabIndex,
        onTap: (index) {
          ref.read(activeTabIndexState.notifier).state = index;
        },
        // onTap: (int index) => setState(() {
          
        //   // visit = index;
        //   // widget.activeIndex = index;
          
        //   // if(index == 0){
        //   //   AppNav.go(context: context,path: AppRouteString.Home);
        //   // }
        //   // if(index == 1){
        //   //   AppNav.go(context: context,path: AppRouteString.MyTeam);
        //   // }
        //   // if(index == 2){
        //   //   AppNav.go(context: context,path: AppRouteString.Account);
        //   // }
          
        // }),
        top: -25,
        animated: true,
        itemStyle: ItemStyle.hexagon,
        chipStyle: ChipStyle(drawHexagon: true,background: AppColor.PRIMARY_COLOR,color: AppColor.BLACK),
      ),
    );
  }
}