// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rnn_yaatra/constants/colors.dart';


// Widget primary_checkbox({ required bool isSelected,callback,padding}) {
//   return Obx(()=> InkWell(
//     onTap: (){
//       isSelected.value = !isSelected.value;
//       if(callback != null){
//         callback(isSelected.value);
//       }
//     },
//     radius: 6.0,
//     child: Container(
//       decoration: BoxDecoration(
//           color: isSelected.isTrue ? AppColor.PRIMARY_COLOR : Colors.transparent,
//           borderRadius: BorderRadius.circular(6),
//           border: Border.all(color: isSelected.isTrue ? AppColor.PRIMARY_COLOR : AppColor.BLACK)
//       ),
//       padding: padding ?? const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
//       child: Center(
//         child: Icon(Icons.check,color: isSelected.isTrue ? AppColor.WHITE : AppColor.BLACK,size: 12,),
//       ),
//     ),
//   ));
// }


Widget primary_static_checkbox({ required bool isSelected,onTap,height,width }) {
  return InkWell(
    onTap: onTap,
    radius: 6.0,
    child: Container(
      height: height ?? 20.0,
      width: width ?? 20.0,
      decoration: BoxDecoration(
          color: isSelected == true ? AppColor.PRIMARY_COLOR : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: isSelected == true ? AppColor.PRIMARY_COLOR : AppColor.BLACK)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
      child: Center(
        child: Icon(Icons.check,color: isSelected == true ? AppColor.WHITE : AppColor.BLACK,size: 12,),
      ),
    ),
  );
}