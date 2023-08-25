import 'package:flutter/material.dart';
import 'package:owner/Helper/shared_pref.dart';


UserDefaults sharedDefault = UserDefaults();

class Constants {
  static const placeholderUrl = 'assets/imageAssets/placeholder.png';
  static const profilePlaceholderUrl = 'assets/iconSvg/profile_placeholder.png';
  static const grayBgUrl = 'assets/imageAssets/greybg.png';
}

enum UrlType { refundPolicy, privacyPolicy, termsCondition, aboutUs, }

extension UrlTypeExtension on UrlType {
  String get navigationTitle {
    switch (this) {
      case UrlType.refundPolicy:
        return "Refund Policy";
      case UrlType.privacyPolicy:
        return "Privacy Policy";
      case UrlType.termsCondition:
        return "Terms Of Services";
      case UrlType.aboutUs:
        return "About Us";

    }
  }

  String get urlToLoad {
    switch (this) {
      case UrlType.refundPolicy:
        return "https://www.wamatrendz.com/exchange-policy";
      case UrlType.privacyPolicy:
        return "https://www.wamatrendz.com/privacy-policy";
      case UrlType.termsCondition:
        return "https://www.wamatrendz.com/terms-services";
      case UrlType.aboutUs:
        return "https://www.wamatrendz.com/about-us";

    }
  }
}

enum PlanItem { Silver, Bronze, Gold }
List<String> filterItemList = [
  "Pending Transaction",
  "All Transaction",
  "Wallet Recharge",
  "Order Transaction",
  "Other"
];

extension PlanItemExtension on PlanItem {
  Color get tileColor {
    switch (this) {
      case PlanItem.Silver:
        return Color(0xFFD8D8D8);

      case PlanItem.Bronze:
        return Color(0xFFCC8845);

      case PlanItem.Gold:
        return Color(0xFFFFD700);
    }
  }

  String get duration {
    switch (this) {
      case PlanItem.Silver:
        return "For 1 Year";

      case PlanItem.Bronze:
        return "For 1 Year";

      case PlanItem.Gold:
        return "For 1 Year";
    }
  }
}

enum NotificationType {
  OrderUpdate,
  WalletUpdate,
  NewArrivalProduct,
  OfferUpdate
}

extension NotificatioTypeExtension on NotificationType {
  String get typeDetail {
    switch (this) {
      case NotificationType.OrderUpdate:
        return "OrderUpdate";
      case NotificationType.WalletUpdate:
        return "WalletUpdate";
      case NotificationType.NewArrivalProduct:
        return "NewArrivalProduct";
      case NotificationType.OfferUpdate:
        return "OfferUpdate";
    }
  }
}

enum WalletStatus { Credited, Debited }

extension TransactionTypeExtension on WalletStatus {
  String get walletDetail {
    switch (this) {
      case WalletStatus.Credited:
        return "Credited";
      case WalletStatus.Debited:
        return "Debited";
    }
  }
}

enum ProfileType {
  signup,
  edit,
}

enum textFieldType {
  firstName,
  lastName,
  mobileNum,
  alternateMobile,
  email,
  address,
  pincode,
  company,
  gst,
}





enum ProductGridScreenType { category, catalog }

extension ProductGridScreenExtension on ProductGridScreenType {
  String get navigationTitle {
    switch (this) {
      case ProductGridScreenType.category:
        return "Category Detail";

      case ProductGridScreenType.catalog:
        return "Catalogue Detail";
    }
  }
}
