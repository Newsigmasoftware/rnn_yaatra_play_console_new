// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class ImageConverter{

  static convert_image_to_base_64({image_path}){
      String image_path_one = "";
     if(image_path.isNotEmpty){
        List<int> imageBytes = File(image_path).readAsBytesSync();
        String base64Image_one = base64Encode(imageBytes);
        image_path_one = base64Image_one;
      }else{
        image_path_one = "";
      }
      return image_path_one;
  }

}