// ignore_for_file: deprecated_member_use


import 'package:rnn_yaatra/widgets/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper{


  callToPhone(phone) async{
    // launch('tel:+91 88888888888');
    try{
      if (!await launch('tel:'+phone)) throw 'Could not launch $phone';
    } catch (e){
      AlertToast.show_warning_toast(message:e.toString());
      
    }
  }

  mailToUser(mail) async{
    // launch('mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email')
    try{
      if (!await launch('mailto:'+mail+"?subject=This is Subject Title&body=This is Body of Email")) throw 'Could not launch $mail';
    }catch (e){
      AlertToast.show_warning_toast(message:e.toString());
    }

  }

  // launch('sms:+91888888888?body=Hi Welcome to Proto Coders Point');
  smsToUser(sms)async{
    try{
      if (!await launch('sms:'+sms)) throw 'Could not launch $sms';
    }catch (e){
      AlertToast.show_warning_toast(message:e.toString());
    }

  }

  launchUrl(url) async{
    try{
      if (!await launch(url)) throw 'Could not launch $url';
    }catch (e){
      AlertToast.show_warning_toast(message:e.toString());
    }
  }


}