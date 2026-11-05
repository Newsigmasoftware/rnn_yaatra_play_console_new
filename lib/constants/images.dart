// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppImage { 
  static const String LOGO = "assets/images/Logo.png";
  // static const String LOGO = "assets/images/Logo.png";
  static const String LOGO_2 = "assets/images/Logo2.png";
  static const String QUALITY_STRIP = "assets/images/quality_strip.png";
  static const String SPLASH_BOTTOM = "assets/images/ftr-light-bg.png";
  static const String TITLE_SEPARATOR = "assets/images/Title-Separator.png";
  static const String LOGIN_TOP = "assets/images/login_top.png";
  static const String PROFILE_CARD = "assets/images/profile_card.png";
  static const String WALLET_CARD = "assets/images/wallet_card.png";
  static const String PLAN_BANNER = "assets/images/plan_banner.png";
  
  static const String BANNER_ONE = "assets/images/banner_1.png";
  static const String BANNER_TWO = "assets/images/banner_2.png";
  static const String PACKAGE_ONE = "assets/images/package_1.jpg";
  static const String PACKAGE_TWO = "assets/images/package_2.jpg";
  
  static const String PIC_ONE = "assets/images/pic1.jpg";
  static const String PIC_TWO = "assets/images/pic2.jpg";
  static const String PIC_THREE = "assets/images/pic3.jpg";
  static const String PIC_FOUR = "assets/images/pic4.jpg";
  static const String PIC_FIVE = "assets/images/pic5.jpg";
  static const String PIC_SIX = "assets/images/pic6.jpg";
  
  
  
  static const String LOGO_HORIZONTAL = "assets/images/logo_horizontal.png";
  static const String LOGO_NEW = "assets/images/logo_new.png";
  static const String LOGO_WITH_NAME = "assets/images/Logo.png";
  static const String Favicon = "assets/images/FavIcon.png"; 
  static const String SPLASH_BG = "assets/images/splash_bg.png";
  static const String TOP_DESIGN_BG = "assets/images/top_design_bg.png";
  static const String AVATAR = "assets/images/avatar.png";
  static const String AVATAR2 = "assets/images/avatar2.png";
  static const String TOP_DESIGN_BG2 = "assets/images/top_design_2.png";
  static const String WALLET_SHIELD = "assets/images/wallet_shield.png";
  static const String BOOK_WITH_GLOBE = "assets/images/book_with_globe.png";
  static const String KYC_ICON = "assets/images/kyc_icon.png";
  
  
  
  
  
  static const String LOGIN_BG = "assets/images/login_bg.png";
  static const String WELCOME_BACK_CARD = "assets/images/welcome_back.png";
  static const String BUTTON = "assets/images/button.png";
  static const String LOGIN_BUTTON = "assets/images/login_button.png";
  static const String BACK_BUTTON = "assets/images/back_button.png";
  static const String JOIN_TITLE_REGISTER = "assets/images/join_title.png";
  static const String ICON_BG = "assets/images/icon_bg.png";
  static const String PLAN_COIN_ICON = "assets/images/plan_coin_icon.png";
  static const String SHIELD = "assets/images/shield.png";
  static const String PROFIT_MONEY = "assets/images/profit_money.png";
  static const String BG_TWO = "assets/images/bg_2.png";
  static const String MENU = "assets/images/menu.png";
  static const String PENDING = "assets/images/pending.png";
  static const String BAR_UP = "assets/images/return_up.png";
  static const String WALLET_PURPLE = "assets/images/wallet_purple.png";
  static const String GIFT = "assets/images/gift.png";
  static const String INVESTMENT_BANNER = "assets/images/investment_banner.png";
  static const String SHIELD_CALENDER = "assets/images/shield_calender.png";
  static const String BOTTOM_MENU_ONE = "assets/images/bottom_menu_one.png";
  static const String BOTTOM_MENU_TWO = "assets/images/bottom_menu_two.png";
  static const String BOTTOM_MENU_THREE = "assets/images/bottom_menu_3.png";
  static const String BOTTOM_BAR_BG = "assets/images/bottom_bar_bg.png";
  static const String EMI_REPORT_CARD = "assets/images/emi_report_card.png";
  static const String FD_LABLE = "assets/images/fd_lable.png";
  static const String LOCKER = "assets/images/locker.png";
  static const String TRANSACTION_LABLE = "assets/images/transaction_lable.png";
  static const String MY_TEAM_LABLE = "assets/images/my_team_lable.png";
  
  
  static const String AVATAR_FRAME = "assets/images/avatar_frame.png";
  static const String SUPPORT_BANNER = "assets/images/support_banner.png";
  static const String AVATAR_FRAME_TWO = "assets/images/avatar_frame_2.png";
  static const String USER_ACCOUNT = "assets/images/user_account.png";

  static const String WITHDRAW_ICON = "assets/images/withdraw.png";
  static const String BANK_ICON = "assets/images/bank.png";
  static const String CALENDER_ICON = "assets/images/calender_icon.png";
  static const String MONEY_ICON = "assets/images/money.png";
  static const String REFER_ICON = "assets/images/refer.png";
  static const String SUPPORT_ICON = "assets/images/support.png";
  static const String KEY = "assets/images/key.png";
  static const String TRANSACTION_ICON = "assets/images/transactions.png";
  static const String TREE_VIEW_ICON = "assets/images/tree_view.png";
  
 
  static const String BUTTON_BG = "assets/images/Button.png";
  static const String LOGIN_BG_2 = "assets/images/login_bg_2.png";
  static const String APP_BAR_BG = "assets/images/app_bar_bg.jpg";
  static const String FORM_BG = "assets/images/form_bg.png";
  static const String GROCERY_BOTTOM = "assets/images/grocery_bottom.png";
  static const String HOME_TOP = "assets/images/home_top.png";
  static const String BASKET = "assets/images/basket.png";
  static const String REFER_BANNER = "assets/images/refer_banner.png";
  static const String LABLE = "assets/images/lable.png";
  static const String LABLE_CIRCLE = "assets/images/lable_circle.png";
  static const String PRODUCT_ITEM = "assets/images/product_item.png";
  static const String STORE_BG = "assets/images/store_bg.jpg";
  static const String MAP_PIN_STONE = "assets/images/map_pin.png";
  static const String WELCOME_BANNER = "assets/images/welcome_banner.png";
 


  get_visit_icon({String? icons}){
    switch(icons) {
      case "store":
        return Icons.storefront_outlined;

      case "gym":
        return Icons.fitness_center;

      case "supplement":
        return Icons.medication_outlined;

      case "nutrition":
        return Icons.local_drink_outlined;

      default:
        return Icons.location_on_outlined;
    }
  }
  
  get_lead_icon({String? businessIcon}){
    switch (businessIcon) {
      case "person":
        return Icons.person_outline;

      case "store":
        return Icons.storefront_outlined;

      case "gym":
        return Icons.fitness_center;

      case "building":
        return Icons.apartment_outlined;

      case "supplement":
        return Icons.medication_outlined;

      default:
        return Icons.business_outlined;
    }
  }



  static IconData get_ledger_icons(String? name) {
    switch (name?.toLowerCase()) {
      // Ledger
      case 'ledger':
      case 'book':
        return Iconsax.book_1;

      case 'wallet':
        return Iconsax.wallet_2;

      case 'bank':
        return Iconsax.bank;

      case 'cash':
        return Iconsax.money_2;

      // Assets
      case 'folder':
        return Iconsax.folder;

      case 'asset':
        return Iconsax.box;

      // Income
      case 'income':
        return Iconsax.chart_success;

      case 'direct_income':
        return Iconsax.chart_2;

      case 'indirect_income':
        return Iconsax.dollar_circle;

      // Expense
      case 'expense':
        return Iconsax.money_remove;

      case 'direct_expense':
        return Iconsax.receipt_minus;

      case 'indirect_expense':
        return Iconsax.card_remove;

      // Student
      case 'student':
        return Iconsax.teacher;

      case 'teacher':
        return Iconsax.personalcard;

      case 'school':
        return Iconsax.building_3;

      // User
      case 'profile':
        return Iconsax.profile_circle;

      case 'user':
        return Iconsax.user;

      // Reports
      case 'report':
        return Iconsax.document_text;

      case 'print':
        return Iconsax.printer;

      // Search
      case 'search':
        return Iconsax.search_normal;

      case 'filter':
        return Iconsax.filter;

      case 'calendar':
        return Iconsax.calendar;

      // Navigation
      case 'back':
        return CupertinoIcons.back;

      case 'forward':
        return CupertinoIcons.forward;

      case 'home':
        return CupertinoIcons.home;

      case 'settings':
        return CupertinoIcons.settings;

      case 'notification':
        return CupertinoIcons.bell;

      case 'logout':
        return Iconsax.logout;

      default:
        return Iconsax.folder5;
    }
  }
}

class AppLottie{
  static const NO_INTERNET = "assets/lottie/no_internet.json";
  static const SUCCESS = "assets/lottie/success.json";
  static const ALERT = "assets/lottie/alert.json";
  static const NOT_FOUND = "assets/lottie/not_found.json";
  static const SEND_EMAIL = "assets/lottie/send_email.json";
  static const WINGS = "assets/json/wings.json";
  static const APP_UPDATE = "assets/lottie/app_update.json";

  static const String SPLASH_SCREEN_BG = "assets/lottie/background_lottie.json";
  static const String CART_ITEM_REMOVE = "assets/lottie/cart_item_remove.json";
  static const String PAGINATION_LOADER = "assets/lottie/pagination.json";
}





class SubjectIconHelper {
  static IconData getIcon(String? subject) {
    switch (subject?.trim().toLowerCase()) {
      case 'mathematics':
        return Iconsax.calculator;

      case 'science':
        return Iconsax.global_search;

      case 'physics':
        return Iconsax.flash;

      case 'chemistry':
        return Icons.flaky_sharp;

      case 'biology':
        return Iconsax.health;

      case 'english':
        return Iconsax.language_square;

      case 'hindi':
        return Iconsax.book;

      case 'social science':
        return Iconsax.people;

      case 'history':
        return Iconsax.clock;

      case 'geography':
        return Iconsax.map;

      case 'civics':
        return Iconsax.building_3;

      case 'computer science':
        return Iconsax.monitor;

      case 'physical education':
        return Iconsax.activity;

      case 'art & craft':
      case 'art':
        return Iconsax.brush_2;

      case 'music':
        return Iconsax.music;

      case 'sanskrit':
        return Iconsax.book_saved;

      case 'economics':
        return Iconsax.chart_2;

      case 'accountancy':
        return Iconsax.receipt_item;

      default:
        return Iconsax.book_1;
    }
  }
}




class EarningOverviewIconSvgStringHelper {
  static String getIcon(String? title) {
    switch (title) {
      case 'Today Earning':
        return "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"12\" r=\"10\"/><path d=\"M6 9h12\"/><path d=\"M6 13h12\"/><path d=\"M9 9c0 5 6 3 6 7\"/><path d=\"M12 7v10\"/></svg>";
      case 'Last 7 Days Earning':
        return "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><rect width=\"18\" height=\"18\" x=\"3\" y=\"4\" rx=\"2\" ry=\"2\"/><line x1=\"16\" x2=\"16\" y1=\"2\" y2=\"6\"/><line x1=\"8\" x2=\"8\" y1=\"2\" y2=\"6\"/><line x1=\"3\" x2=\"21\" y1=\"10\" y2=\"10\"/></svg>";

      case 'Last 30 Days Earning':
        return "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M8 2v4\"/><path d=\"M16 2v4\"/><rect width=\"18\" height=\"18\" x=\"3\" y=\"4\" rx=\"2\"/><path d=\"M3 10h18\"/><path d=\"M8 14h.01\"/><path d=\"M12 14h.01\"/><path d=\"M16 14h.01\"/><path d=\"M8 18h.01\"/><path d=\"M12 18h.01\"/><path d=\"M16 18h.01\"/></svg>";

      case 'Total Earning':
        return "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path d=\"M21 12V7H5a2 2 0 0 1 0-4h14v4\"/><path d=\"M3 5v14a2 2 0 0 0 2 2h16v-5\"/><path d=\"M18 12a2 2 0 0 0 0 4h4v-4z\"/></svg>";

       
      default:
        return "<svg viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><circle cx=\"12\" cy=\"12\" r=\"10\"/><path d=\"M6 9h12\"/><path d=\"M6 13h12\"/><path d=\"M9 9c0 5 6 3 6 7\"/><path d=\"M12 7v10\"/></svg>";
    }
  }
}



 