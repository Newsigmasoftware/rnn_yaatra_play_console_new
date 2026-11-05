// ignore_for_file: use_super_parameters, must_be_immutable

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';  

class BottomBarWidget extends ConsumerStatefulWidget {
  BottomBarWidget({Key? key, this.title,this.activeIndex}) : super(key: key);
  final String? title;
  int? activeIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends ConsumerState<BottomBarWidget> {

  int visit = 0;
  double height = 30;
  // Color colorSelect =const Color(0XFF0686F8);
  // Color color = const Color(0XFF7AC0FF);
  // Color color2 = const Color(0XFF96B1FD);

  // Color bgColor = Color.fromARGB(255, 234, 240, 250);
  Color bgColor = AppColor.WHITE;
  // Color bgColor = Color(0xff2b4ac2);


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        visit = widget.activeIndex ?? 0;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    // var profileDetail = ref.watch(getProfileDetailNotifier);
    List<TabItem> items = [
      TabItem(
        icon: Iconsax.home,
        title: 'Home',
      ),
      TabItem(
        icon: Icons.group, // Correct icon instead of Icons.barup
        title: 'My Teams',
      ),
      // TabItem(
      //   icon: Iconsax.wallet,
      //   title: 'FD',
      // ),
      TabItem(
        icon: Iconsax.profile_circle5,
        title: 'Profile',
      ),
    ];

    return BottomBarInspiredOutside(
      items: items,
      backgroundColor: AppColor.PRIMARY_COLOR,
      color: AppColor.WHITE,
      colorSelected: AppColor.WHITE,
      indexSelected: visit,
      onTap: (int index) => setState(() {
  
        visit = index;
        widget.activeIndex = index;
        
        // if(index == 0){
        //   AppNav.go(context: context,path: AppRouteString.Home);
        // }
        // if(index == 1){
        //   AppNav.go(context: context,path: AppRouteString.MyTeam);
        // }
        // if(index == 2){
        //   AppNav.go(context: context,path: AppRouteString.Account);
        // }
        
      }),
      top: -25,
      animated: true,
      itemStyle: ItemStyle.hexagon,
      chipStyle: ChipStyle(drawHexagon: true,background: AppColor.PRIMARY_COLOR,color: AppColor.BLACK),
    );    
  }
}












 