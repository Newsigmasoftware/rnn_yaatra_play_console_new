// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'dart:io';  

class AppConstants {

  static const String APP_NAME = "RNN Yaatraay";
  static const String TAG_LINE = "";
  static const CURRENCY_SYMBOL = "₹";
  static const COUNTRY_ID = "1";
  static const ANDROID_APP_VERSION = "1.0";
  static const IOS_APP_VERSION = "1.0";
  static const DOT_EMOJI = "•";
  static const SIGMA_IT_LINK = "https://www.sigmasoftwares.org";
  static String FINANCIAL_YEAR = "${DateTime.now().year}-${DateTime.now().add(Duration(days: 366)).year}";
  static const String DUMMY_TEXT = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  Future<String?> getIPv4Address() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
          return addr.address;
        }else{
          return addr.address;
        }
      }
    }
    return "Not Found";
  }

  static String hideMobileNoLast4Digits(String mobileNo) {
    if (mobileNo.length < 4) {
      return mobileNo;
    }
    return "${mobileNo.substring(0, mobileNo.length - 4)}****";
  }
}


class AppDummyData{

  static List home_dashboard_count_site_engineer = [
    {
      "title": "Total Customer Agency",
      "count": 5,
      "action": "View"
    },
    {
      "title": "Total Vendor",
      "count": 46,
      "action": "View"
    },
    {
      "title": "Total Project",
      "count": 2,
      "action": "View"
    },
    {
      "title": "Total Activity ( Schedule )",
      "count": 85,
      "action": "View"
    },
    {
      "title": "Total Pending DPR",
      "count": 3,
      "action": "View"
    },
    {
      "title": "Total Approved DPR",
      "count": 44,
      "action": "View"
    },
    {
      "title": "Total Return DPR",
      "count": 0,
      "action": "View"
    },
    {
      "title": "Total Rejected DPR",
      "count": 0,
      "action": "View"
    },
    {
      "title": "Daily Progress Report",
      "count": 0,
      "action": "View"
    },
    {
      "title": "Total Hindrance Log",
      "count": 20,
      "action": "View"
    },
    {
      "title": "Total DPR",
      "count": 47,
      "action": "View"
    }
  ];

  static List gender_list = [
    {
      "title" : "Male",
      "value" : "Male",
    },
    {
      "title" : "Female",
      "value" : "Female",
    }
  ];

  static List shorting_list = [
    {
      'name' : "Default Sorting",
      'value' : "2",
    },
    {
      'name' : "Latest Items",
      'value' : "1",
    },
    {
      'name' : "Price - Low To High",
      'value' : "3",
    },
    {
      'name' : "Price - High To Low",
      'value' : "4",
    },
    {
      'name' : "Best Seller Items",
      'value' : "5",
    },
  ];

  static List month_list =  [
    {'title' : "January", "value" : "1"},
    {'title' : "February", "value" : "2"},
    {'title' : "March", "value" : "3"},
    {'title' : "April", "value" : "4"},
    {'title' : "May", "value" : "5"},
    {'title' : "June", "value" : "6"},
    {'title' : "July", "value" : "7"},
    {'title' : "August", "value" : "8"},
    {'title' : "September", "value" : "9"},
    {'title' : "October", "value" : "10"},
    {'title' : "November", "value" : "11"},
    {'title' : "December", "value" : "12"},
  ];

  static List year_list =  [
    {'title' : "2025", "value" : "2025"},
    {'title' : "2026", "value" : "2026"},
    {'title' : "2027", "value" : "2027"},
    {'title' : "2028", "value" : "2028"},
    {'title' : "2029", "value" : "2029"},
    {'title' : "2030", "value" : "2030"},
  ];


}

class APIURL {
  
  static const DOMAIN = "https://rnnyaatraay.com/";

  static const String COMPANY_DOMAIN = "https://rnnyaatraay.com/"; 
  static const String BASE_URL = "${DOMAIN}api/";
  
  static const String ABOUT_US = "${COMPANY_DOMAIN}Website/Aboutus.aspx";
  
  static const String CONTACT_US = "${COMPANY_DOMAIN}Website/Contactus.aspx";
  
  static const String PRIVACY_POLICY = "${COMPANY_DOMAIN}Privacy-policy.html";
  static const String TERMS_AND_CONDITIONS = "${COMPANY_DOMAIN}Privacy-policy.html";
  
  static const String IMAGE_BASE_URL = "${COMPANY_DOMAIN}Resources/";
  static const String IMAGE_BASE_URL_APP = ""; 
   
  static const String HOME = "Home";
  static String LOGIN({String? userID,String? password}){
    return "login?Userid=$userID&Password=$password";
  }

  static String REGISTER({String? sponsorid,String? standingposition,String? username,String? mobile,String? email,String? countryId}){
    return "InsertUser?sponsorid=$sponsorid&standingposition=$standingposition&username=$username&mobile=$mobile&email=$email&CountryId=$countryId";
  }
  
  static const String VERIFY_OTP = "VerifyOTP"; 
  static const String GET_CATEGORY = "GetCategory"; 
  static const String GET_BANNER = "GetBanner"; 
  static const String GET_BRAND = "GetBrand"; 

  static String VERIFY_SPONSOR({String? userID}) {
    return "CheckSponsor?userid=$userID";
  }

  static const String GET_COUNTRY = "GetCountry"; 

  static String GET_DASHBOARD({String? userID}) {
    return "UserDashboard?UserId=$userID";
  }

  static String GET_PROFILE_DETAIL({String? userId}) {
    return "GetUserDetail?userid=$userId";
  }

  static String GET_KYC_DETAIL({String? userId}) {
    return "GetKYCDetails?userid=$userId";
  }

  static const String GET_BANK = "GetBank";
  static const String UPLOAD_KYC_DETAILS = "UploadKycDetails";
  static const String UPDATE_PROFILE = "UpdateProfile";

  static String DIRECT_TEAM({String? userID, String? from, String? to}) {
    String query = "direct-team?userid=${userID ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    return query;
  }

  static String DOWNLINE_TEAM({String? userID, String? from, String? to, String? direction}) {
    String query = "get-team?userid=${userID ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    if (direction != null && direction.trim().isNotEmpty && direction != "null") query += "&direction=${Uri.encodeComponent(direction.trim())}";
    return query;
  }

  static String AIPII_ENCOME({String? userID, String? from, String? to, String? direction}) {
    String query = "AIPIncome?userid=${userID ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    if (direction != null && direction.trim().isNotEmpty && direction != "null") query += "&direction=${Uri.encodeComponent(direction.trim())}";
    return query;
  }

  static String LIPI_ENCOME({String? userID, String? from, String? to, String? direction}) {
    String query = "LIPIncome?userid=${userID ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    if (direction != null && direction.trim().isNotEmpty && direction != "null") query += "&direction=${Uri.encodeComponent(direction.trim())}";
    return query;
  }

  static String RANK_Chart({String? userID, String? from, String? to, String? direction}) {
    String query = "rank-chart?userid=${userID ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    return query;
  }

  static String REWARD_INCENTIVE_POOL_LIST({String? userID, String? from, String? to}) {
    String query = "RewardIncentivePoolList?userid=${userID ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    return query;
  }

  static String GET_FUND_BALANCE({String? userId}) {
    return "GetFundBalance?UserId=${userId ?? ''}";
  }

  static String GET_MAX_PLAN({String? userId}) {
    return "GetMaxPlan?UserId=${userId ?? ''}";
  }

  static String GET_TOPUP_LIST({String? userId, String? from, String? to}) {
    String query = "api/User/GetTopupList?userid=${userId ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    return query;
  }

  static String GET_TRANSACTION_DETAIL({String? userId, String? from, String? to, String? type}) {
    String query = "GetTransactionDetail?UserId=${userId ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    if (type != null && type.trim().isNotEmpty && type != "null") query += "&type=${Uri.encodeComponent(type.trim())}";
    return query;
  }

  static String GET_CHAIN = "GetChain";
  static String DEPOSIT_REQUEST = "DepositRequest";

  static String GET_DEPOSIT_REQUEST_LIST({String? userId, String? from, String? to, String? status}) {
    String query = "GetDepositRequestList?UserId=${userId ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    if (status != null && status.trim().isNotEmpty && status != "null") query += "&status=${Uri.encodeComponent(status.trim())}";
    return query;
  }

  static String GET_WITHDRAWAL_REQUEST_LIST({String? userId, String? from, String? to, String? status}) {
    String query = "GetWithdrawlRequestList?UserId=${userId ?? ''}";
    if (from != null && from.trim().isNotEmpty) query += "&from=${Uri.encodeComponent(from.trim())}";
    if (to != null && to.trim().isNotEmpty) query += "&to=${Uri.encodeComponent(to.trim())}";
    if (status != null && status.trim().isNotEmpty && status != "null") query += "&status=${Uri.encodeComponent(status.trim())}";
    return query;
  }

  static String TOPUP_USER_WITH_WALLET({String? planId, String? userId, String? topupUserId}) {
    return "api/User/TopupUserWithWallet?planid=${planId ?? ''}&userid=${userId ?? ''}&topupuserid=${topupUserId ?? ''}";
  }

  static String SEND_MESSAGE({String? userId}) {
    return "SendMessage?UserId=${userId ?? ''}";
  }

  static String GET_TRANS_PASSWORD({String? transPassword, String? userId}) {
    return "api/User/GetTransPassword?transPassword=${Uri.encodeComponent(transPassword ?? '')}&UserId=${userId ?? ''}";
  }

  static String COMPOSE_MESSAGE({String? userId, String? subject, String? message}) {
    String query = "ComposeMessage?UserId=${userId ?? ''}";
    if (subject != null && subject.trim().isNotEmpty) query += "&Subject=${Uri.encodeComponent(subject.trim())}";
    if (message != null && message.trim().isNotEmpty) query += "&Message=${Uri.encodeComponent(message.trim())}";
    return query;
  }

  static String CHANGE_PASSWORD({String? userId, String? oldPassword, String? newPassword}) {
    return "ChangePassword?UserId=${userId ?? ''}&oldPassword=${Uri.encodeComponent(oldPassword ?? '')}&newpassword=${Uri.encodeComponent(newPassword ?? '')}";
  }

  static String CHANGE_TRANS_PASSWORD({String? userId, String? oldPassword, String? password}) {
    return "ChangeTransPassword?UserId=${userId ?? ''}&oldPassword=${Uri.encodeComponent(oldPassword ?? '')}&Password=${Uri.encodeComponent(password ?? '')}";
  }
}


