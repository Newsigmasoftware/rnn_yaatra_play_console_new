// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_unnecessary_containers
import 'package:cached_network_image/cached_network_image.dart'; 
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rnn_yaatra/constants/colors.dart'; 
import 'package:rnn_yaatra/constants/images.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:photo_view/photo_view.dart';


Widget show_simple_network_image(BuildContext context,{imageURL,fit,width,height,radius,Color? color}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius ?? 0.0),
    child: CachedNetworkImage(
      imageUrl: imageURL ?? "",
      fit: fit ?? BoxFit.fill,
      width: width ?? ScreenHelper().get_width(context),
      height: height ?? 150.0,
      color: color,
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          color: AppColor.GREY_EXTRA_LIGHT,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width ?? ScreenHelper().get_width(context) * 0.8,
        height: height ?? 150.0,
        child: Center(
          child: Image.asset(
            AppImage.LOGO,
            height: 100,
            // color: AppColor.GREY_MEDIUM,
          ),
        ),
      ),
      errorWidget: (context, url, error) {
        // Optional: Don't print or log the error
        return Container(
          decoration: BoxDecoration(
            color: AppColor.GREY_EXTRA_LIGHT,
            borderRadius: BorderRadius.circular(10),
          ),
          width: width ?? ScreenHelper().get_width(context) * 0.8,
          height: height ?? 150.0,
          child: Center(
            child: Image.asset(
              AppImage.LOGO,
              height: 100,
              // color: AppColor.GREY_MEDIUM,
            ),
          ),
        );
      },
      // Prevent error from printing in debug console
      errorListener: (d) {}, // This suppresses default error output
    ),
  );

  // return ClipRRect(
  //   borderRadius: BorderRadius.circular(radius ?? 0.0),
  //   child: CachedNetworkImage(
  //     imageUrl: imageURL ?? "",
  //     fit: fit ?? BoxFit.fill,
  //     width: width ?? Get.width, 
  //     height: height ?? 150.0,
  //     placeholder: (context, url) => Container(
  //       decoration: BoxDecoration(
  //           color: AppColor.GREY_EXTRA_LIGHT,
  //           borderRadius: BorderRadius.circular(10)
  //       ),
  //       width: width ?? Get.width*0.8,
  //       height: height ?? 150.0,
  //       child: Center(
  //         child: Image.asset(AppImage.LOGO,height: 100,color: AppColor.GREY_MEDIUM,),
  //       ),
  //     ),
  //     errorWidget: (context, url, error) => Container(
  //       decoration: BoxDecoration(
  //           color: AppColor.GREY_EXTRA_LIGHT,
  //           borderRadius: BorderRadius.circular(10)
  //       ),
  //       width: width ?? Get.width*0.8,
  //       height: height ?? 150.0,
  //       child: Center(
  //         child: Image.asset(AppImage.LOGO,height: 100,color: AppColor.GREY_MEDIUM,),
  //       ),
  //     ),
  //     errorListener: (value) {},
  //   ),

  
    
  // );
}


class ImageViewWidget extends ConsumerWidget {
  final String? image_url,title;
  final List? imageUrlList;
  ImageViewWidget({super.key,this.image_url,this.title,this.imageUrlList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(imageUrlList != null &&  (imageUrlList ?? []).isNotEmpty){
      return Scaffold(
        backgroundColor: AppColor.BLACK,
        appBar: AppBar(
          backgroundColor: AppColor.BLACK,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: back_button_primary_bg(
              isRounded: true,
              // isRounded: true,
              onTap: (){
                context.pop();
              }
            ),
          ),
          title: Text(title ?? "",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.WHITE),),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: ScreenHelper().get_height(context),
                    viewportFraction: 1.0
                  ),
                  items: imageUrlList?.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return PhotoView(
                          imageProvider: NetworkImage(i.toString(),),
                          loadingBuilder: (context, event) {
                            return Container(
                              color: AppColor.WHITE,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.PRIMARY_COLOR,
                                  value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                                ),
                              ),
                            );
                          },
                        );
                        // return show_simple_network_image(
                        //   context,
                        //   imageURL: i.toString(),
                        //   width: ScreenHelper().get_width(context).toDouble(),
                        //   fit: BoxFit.contain
                        // );
                        // return Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   margin: EdgeInsets.symmetric(horizontal: 5.0),
                        //   decoration: BoxDecoration(
                        //     color: Colors.amber
                        //   ),
                        //   child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                        // );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios,color: AppColor.WHITE.withValues(alpha: 0.7),),
                  Icon(Icons.arrow_forward_ios,color: AppColor.WHITE.withValues(alpha: 0.7),),
                ],
              ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: back_button_primary_bg(
            isRounded: true,
            onTap: (){
              context.pop();
            }
          ),
        ),
        title: Text(title ?? "",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.WHITE),),
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(image_url.toString()),
          loadingBuilder: (context, event) {
            return Container(
              color: AppColor.WHITE,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.PRIMARY_COLOR,
                  value: event == null ? 0 : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                ),
              ),
            );
          },
        )
      ),
    );
  }
}