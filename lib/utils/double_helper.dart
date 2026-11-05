class DoubleHelper{

  static double convert_string_to_double({String? string}) { 
    if(string.toString().isEmpty || string.toString() == "null"){
      return 0.0;
    }else{
      if(string.toString().contains(".")){
        return double.parse(string.toString());
      }else{
        return double.parse("$string.0");
      }
    }
  }
}