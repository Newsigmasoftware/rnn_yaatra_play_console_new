// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ImagePickerHelper {

  final image_picker = ImagePicker();
  // late FilePicker filePickerResult = FilePicker.;

  pick_image_from_gallery({String? imagePath,Function? callback_fn}) async{
    var image = await image_picker.pickImage(source: ImageSource.gallery,imageQuality: 25);
    if(image != null){
      if(imagePath != null){
          imagePath = image.path;
        }
        if(callback_fn != null){
          callback_fn(image.path);
        }
    }
  }

  pick_image_from_camera({String? imagePath,Function? callback_fn}) async{
    var image = await image_picker.pickImage(source: ImageSource.camera,imageQuality: 25,);
    if(image != null){
      if(imagePath != null){
          imagePath = image.path;
        }
        if(callback_fn != null){
          callback_fn(image.path);
        }
    }


    // if(image != null){
      // var compressed_image = await testCompressAndGetFile(File(image.path));
      // if(imagePath != null){
      //   imagePath.value = compressed_image!.path;
      // }
      // if(callbackFn != null){
      //   callbackFn(compressed_image!.path);
      // }
              
      // if(imagePath != null){
      //   imagePath.value = image.path;
      // }
      // if(callbackFn != null){
      //   callbackFn(image.path);
      // }
    // }
  }


  
  pick_img_pdf_excel_from_gallery({Function? callback_fn,bool? isAllowMultiple}) async{
    // late FilePicker filePickerResult = FilePicker.;
    FilePickerResult? result = await FilePicker.pickFiles(
      allowMultiple: isAllowMultiple ?? false,
      compressionQuality: 50,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png','xlsx','csv'],
    );

    if (result != null) {
      if(callback_fn != null){
        callback_fn(result);
      }
    }
  }

  // pick_multiple_image_from_gallery({required RxList images_path}) async{
  //   var images = await image_picker.pickMultiImage();
  //   if(images.isNotEmpty){
  //     images_path.value = images;
  //   }
  // }

  pick_multiple_image_from_gallery({List? images_path,Function? callback_fn}) async{
    var images = await image_picker.pickMultiImage();
    if(images.isNotEmpty){
      if(images_path != null){
        images_path = images;
      }
      if(callback_fn != null){
        callback_fn(images);
      }
    }
  }

  pick_videos_from_gallery({required String videoPath,String? video_name}) async{
    var image = await image_picker.pickVideo(source: ImageSource.gallery);
    if(image != null){
      videoPath = image.path;
      if(video_name != null){
        video_name = image.name.toString();
      }
    }
  }

  // pick_excel_file_from_gallery({RxString? file_path, RxString? file_name,Function? callback_fn}) async{

  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     allowMultiple: false,
  //     compressionQuality: 70,
  //     allowCompression: true,
  //     type: FileType.custom,
  //     allowedExtensions: ['xlsx'],
  //   );

  //   if (result != null) {
  //     if(file_path != null){
  //       file_path.value = result.files.single.path!;
  //     }
  //     if(file_name != null){
  //       file_name.value = result.files.single.name;
  //     }
  //     if(callback_fn != null){
  //       callback_fn(result);
  //     }
  //   }
  // }
  
  // pick_file_from_gallery({RxString? file_path, RxString? file_name,Function? callback_fn}) async{

  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     allowMultiple: true,
  //     compressionQuality: 70,
  //     allowCompression: true,
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'pdf', 'doc'],
  //   );

  //   if (result != null) {
  //     if(file_path != null){
  //       file_path.value = result.files.single.path!;
  //     }
  //     if(file_name != null){
  //       file_name.value = result.files.single.name;
  //     }
  //     if(callback_fn != null){
  //       callback_fn(result);
  //     }
  //   }
  // }

  // pick_video_from_gallery({RxString? file_path, RxString? file_name,Function? callback_fn}) async{

  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['mp4'],
  //   );

  //   if (result != null) {
  //     if(file_path != null){
  //       file_path.value = result.files.single.path!;
  //     }
  //     if(file_name != null){
  //       file_name.value = result.files.single.name;
  //     }
  //     if(callback_fn != null){
  //       callback_fn(result);
  //     }
  //   }
  // }


  static encode_image_base_64({required String image_path}){
    if(image_path.isNotEmpty){
      List<int> imageBytes = File(image_path).readAsBytesSync();
      String base64Image_one = base64Encode(imageBytes);
      return base64Image_one;
    }else{
      return "";
    }
  }

  static Uint8List base64DecodeImage(String base64String) {
    try {
      return base64Decode(base64String);
    } catch (e) {
      print("Error decoding Base64 image: $e");
      return Uint8List(0); // Return empty data on error
    }
  }

  static show_image_picker_dialog(BuildContext? context,{Function? pickFromCameraResult,Function? pickFromGalleryResult}) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Pick Image"),
          content: Text("Please select the source to pick the image from."),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Camera"),
              onPressed: () {
                if(pickFromCameraResult != null){
                  context.pop();
                  ImagePickerHelper().pick_image_from_camera(
                    callback_fn: pickFromCameraResult,
                  );
                }
                // Add your camera handling code here
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Gallery"),
              onPressed: () {
                if(pickFromGalleryResult != null){
                  context.pop();
                  ImagePickerHelper().pick_image_from_gallery(
                    callback_fn: pickFromGalleryResult,
                  );
                }
                // Add your gallery handling code here
              },
            ),
          ],
        );
      },
    );
  }

}

// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

// class ImagePickerHelper {

//   final image_picker = ImagePicker();
//   // late FilePicker filePickerResult = FilePicker.platform;

//   pick_image_from_gallery({RxString? imagePath, Function? callback_fn})async{
//     var image = await image_picker.pickImage(source: ImageSource.gallery);
//     if(image != null){
//       if(imagePath != null){
//         imagePath.value = image.path;
//       }
//       if(callback_fn != null){
//         callback_fn(image.path);
//       }
//     }
//   }

//   pick_image_from_camera({RxString? imagePath, Function? callback_fn}) async{
//     var image = await image_picker.pickImage(source: ImageSource.camera);
//     if(image != null){
//       if(imagePath != null){
//         imagePath.value = image.path;
//       }
//       if(callback_fn != null){
//         callback_fn(image.path);
//       }
//     }
//   }

//   pick_multiple_image_from_gallery({RxList? images_path,Function? callback_fn}) async{
//     var images = await image_picker.pickMultiImage();
//     if(images.isNotEmpty){
//       if(images_path != null){
//         images_path.value = images;
//       }
//       if(callback_fn != null){
//         callback_fn(images);
//       }
//     }
//   }

//   pick_videos_from_camera({required RxString videoPath,RxString? video_name,maxDuration}) async{
//     var image = await image_picker.pickVideo(source: ImageSource.camera,maxDuration: maxDuration);
//     if(image != null){
//       videoPath.value = image.path;
//       if(video_name != null){
//         video_name.value = image.name.toString();
//       }
//     }
//   }

//   pick_videos_from_gallery({required RxString videoPath,RxString? video_name,maxDuration}) async{
//     var image = await image_picker.pickVideo(source: ImageSource.gallery,maxDuration: maxDuration);
//     if(image != null){
//       videoPath.value = image.path;
//       if(video_name != null){
//         video_name.value = image.name.toString();
//       }
//     }
//   }

//   pick_file_from_gallery({RxString? file_path, RxString? file_name,Function? callback_fn}) async{

//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'pdf', 'doc'],
//     );

//     if (result != null) {
//       if(file_path != null){
//         file_path.value = result.files.single.path!;
//       }
//       if(file_name != null){
//         file_name.value = result.files.single.name;
//       }
//       if(callback_fn != null){
//         callback_fn(result);
//       }
//     }
//   }
// }