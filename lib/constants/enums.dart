
// ignore_for_file: constant_identifier_names

enum PaymentMethod{
  COD,
  Online,
  Wallet,
  UPIIMPS
}

enum ShortBy{
  Random,
  OrderByProductCode,
  OrderByOnSale,
  BestSeller,
  OrderByStockASC,
  OrderByStockDESC,
  OrderByDiscDESC,
  OrderByPriceASC,
  OrderByPriceDESC,
  OrderByProductCodeASC,
}

abstract class ShortByStringIndex {
  static String toValue(
      ShortBy shortByStringIndex) {
    switch (shortByStringIndex) {
      case ShortBy.Random:
        return "0";
      case ShortBy.OrderByProductCode:
        return "1";
      case ShortBy.OrderByOnSale:
        return "2";
      case ShortBy.BestSeller:
        return "3";
      case ShortBy.OrderByStockASC:
        return "4";
      case ShortBy.OrderByStockDESC:
        return "5";
      case ShortBy.OrderByDiscDESC:
        return "6";
      case ShortBy.OrderByPriceASC:
        return "7";
      case ShortBy.OrderByPriceDESC:
        return "8";
      case ShortBy.OrderByProductCodeASC:
        return "";
      default:
        return "";
    }
  }
}

enum OrderStatus { 
  PLACED,
  CANCELLED,
  READY_TO_SHIP,
  DELIVERED
}

enum PlatformType{
  App,
  Web
}

enum UserRole{
  ProjectManager,
  Principle,
  Teacher,
  Student
}


abstract class UserRoleString {
  static String toValue(
      UserRole userRoleString) {
    switch (userRoleString) {
      case UserRole.ProjectManager:
        return "Project Manager";
      case UserRole.Principle:
        return "Principle"; 
      case UserRole.Teacher:
        return "Teacher";
      case UserRole.Student:
        return "Student"; 
      default:
        return "";
    }
  }
}

 

abstract class UserRoleIDString {
  static String toValue(
      UserRole userRoleIDString) {
    switch (userRoleIDString) {
      case UserRole.Principle:
        return "1";
      case UserRole.Teacher:
        return "2";
      case UserRole.Student:
        return "3";
      default:
        return "";
    }
  }
}





abstract class UserRoleIDToNameString {
  static String toValue(
      String roleId) {
    switch (roleId) {
      case "1":
        return UserRoleString.toValue(UserRole.Principle);
      case "2":
        return UserRoleString.toValue(UserRole.Teacher);
      case "3":
        return UserRoleString.toValue(UserRole.Student); 
      default:
        return "";
    }
  }
}



enum BannerType{
  Banner,
  Strip
}

enum StockType{
  Self,
  Admin
}

enum PaymentType{
  Full,
  Credit,
  Advance,
}


abstract class PaymentTypeString {
  static String toValue(
      PaymentType paymentTypeString) {
    switch (paymentTypeString) {
      case PaymentType.Full:
        return "Full Payment";
      case PaymentType.Advance:
        return "Advance Payment";
      case PaymentType.Credit:
        return "Credit Payment";
      default:
        return "";
    }
  }
}


enum KycStatus { 
  Reject,
  Pending
}

enum BankStatus {
  Pending,
  Reject,
  Verify
}


enum GlobalStatus{
  Closed,
  Resolved,
  Assigned,
  Open
}


enum QuestionType{
  TextField,
  DateField,
  Dropdown
}

abstract class QuestionIdToTypeString {
  static String toValue(
      String questionTypeId) {
    switch (questionTypeId) {
      case "1":
        return QuestionType.Dropdown.name;
      case "2":
        return QuestionType.TextField.name;
      case "3":
        return QuestionType.DateField.name;
      default:
        return "";
    }
  }
}


enum FilterType{
  Category,
  SubCategory,
  Brand,
  Price,
  Shorting,
}



enum HomeSectionType {
  Category,
  Image,
  Product,
  Video,
  Brand,
  Crop
}

enum RedirectType{
  Category,
  Product
}