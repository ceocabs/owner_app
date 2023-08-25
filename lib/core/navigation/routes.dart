import 'package:flutter/material.dart';
import 'package:owner/ui/auth/login_screen.dart';
import 'package:owner/ui/auth/otp_verification_page.dart';
import 'package:owner/ui/auth/sign_up_screen.dart';
import 'package:owner/ui/auth/successfully_register-page.dart';
import 'package:owner/ui/drive_list_screen.dart';
import 'package:owner/ui/driver_info/driver_personal_info_page.dart';
import 'package:owner/ui/home/bank_details_page.dart';
import 'package:owner/ui/home/complaint_management_screen.dart';
import 'package:owner/ui/home/edit_vehicle_info/edit_vehicle__fourth_page.dart';
import 'package:owner/ui/home/edit_vehicle_info/edit_vehicle_first_page.dart';
import 'package:owner/ui/home/edit_vehicle_info/edit_vehicle_second_page.dart';
import 'package:owner/ui/home/home_page.dart';
import 'package:owner/ui/home/login_history_page.dart';
import 'package:owner/ui/home/menu_options_screen.dart';
import 'package:owner/ui/home/new_complaint_screen.dart';
import 'package:owner/ui/home/owner_driver_list_screen.dart';
import 'package:owner/ui/home/pending_approval_page.dart';
import 'package:owner/ui/home/search_driver_page.dart';
import 'package:owner/ui/home/transaction_history_page.dart';
import 'package:owner/ui/home/withdraw_history_page.dart';
import 'package:owner/ui/home/withdrawal_request_page.dart';
import 'package:owner/ui/info/privacy_policy_page.dart';
import 'package:owner/ui/info/terms_and_conditions_page.dart';
import 'package:owner/ui/vehicle_registration/vehicle_register_success_page.dart';
import '../../driver_list_details_page.dart';
import '../../ui/auth/driver_documents_page.dart';
import '../../ui/auth/upload_document_page.dart';
import '../../ui/driver_info/driver_documents_image_page.dart';
import '../../ui/driver_otp_verification_page.dart';
import '../../ui/home/add_driver_page.dart';
import '../../ui/home/assign_vehicle_page.dart';
import '../../ui/home/complaint_history_details_page.dart';
import '../../ui/home/driver_confirmation_page.dart';
import '../../ui/home/driver_earning_details_page.dart';
import '../../ui/home/earning_filter_data_page.dart';
import '../../ui/home/login_history_details.dart';
import '../../ui/home/message_screen.dart';
import '../../ui/home/online_offline_driver_screen.dart';
import '../../ui/home/successfully_connected_screen.dart';
import '../../ui/home/update_vehicle_docuemts_page.dart';
import '../../ui/home/upload_rejected_document_page.dart';
import '../../ui/home/upload_rejected_vehicle_document.dart';
import '../../ui/home/vehicle_info_page.dart';
import '../../ui/home/vehicle_status_page.dart';
import '../../ui/splash.dart';
import '../../ui/vehicle_info/vehicle_info_first_page.dart';
import '../../ui/vehicle_info/vehicle_info_second_page.dart';
import '../../ui/vehicle_registration/vehicle_registration_first_page.dart';
import '../../ui/vehicle_registration/vehicle_registration_fourth_screen.dart';
import '../../ui/vehicle_registration/vehicle_registration_second_page.dart';
import '../../ui/vehicle_registration/vehicle_registration_test_demo_page.dart';
import '../../ui/vehicle_registration/vehicle_registration_third_page.dart';

abstract class RouteName {
  static const String root = "splash";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String homePage = "homePage";
  static const String ownerDriverList = "ownerDriverList";
  static const String vehicleStatusPage = "VehicleStatusPage";
  static const String addDriverPage = "addDriverPage";
  static const String vehicleInfoFirstPage = "vehicleInfoFirstPage";
  static const String vehicleInfoSecondPage = "vehicleInfoSecondPage";
  static const String searchDriverPage = "searchDriverPage";
  static const String vehicleRegistrationDemoPage = "vehicleRegistrationDemoPage";
  static const String vehicleRegisterSuccess = "vehicleRegisterSuccess";
  static const String successfullyConnectedScreen =
      "successfullyConnectedScreen";
  static const String driverConfirmationPage = "driverConfirmationPage";
  static const String forgotPassword = "forgotPassword";
  static const String driverListScreen = "driverListScreen";
  static const String onlineOfflineDriverScreen = "onlineOfflineDriverScreen";
  static const String otpVerificationPage = "otpVerificationPage";
  static const String privacyPolicyPage = "privacyPolicyPage";
  static const String menuOptionScreen = "menuOptionScreen";
  static const String loginHistoryPage = "loginHistoryPage";
  static const String messageScreen = "messageScreen";
  static const String vehicleInfoPage = "vehicleInfoPage";
  static const String editVehicleFirstPage = "editVehicleFirstPage";
  static const String editVehicleSecondPage = "editVehicleSecondPage";
  static const String editVehicleThirdPage = "editVehicleThirdPage";
  static const String editVehicleFourthPage = "editVehicleFourthPage";
  static const String bankDetailsScreen = "bankDetailsScreen";
  static const String uploadDocumentPage = "uploadDocumentPage";
  static const String driverDocumentsPage = "driverDocumentsPage";
  static const String loginHistoryDetailsPage = "loginHistoryDetailsPage";
  static const String termsAndConditionPage = "termsAndConditionPage";
  static const String transactionDetailsPage = "transactionDetailsPage";
  static const String transactionHistoryPage = "transactionHistoryPage";
  static const String driverPersonalInfoPage = "driverPersonalInfoPage";
  static const String driverDocumentPage = "driverDocumentPage";
  static const String assignVehiclePage = "assignVehiclePage";
  static const String topUpPage = "topUpPage";
  static const String driverEarningDetailsPage = "driverEarningDetailsPage";
  static const String earningFilterDataPage = "earningFilterDataPage";
  static const String driverListDetailsPage = "driverListDetailsPage";
  static const String driverOtpVerificationPage = "driverOtpVerificationPage";
  static const String successfullyRegisterPage = "successfullyRegisterPage";
  static const String pendingApprovalPage = "pendingApprovalPage";
  static const String newComplaintScreen = "newComplaintScreen";
  static const String withdrawalRequestPage = "withdrawalRequestPage";
  static const String uploadRejectedDocumentPage = "uploadRejectedDocumentPage";
  static const String withdrawalHistoryPage = "withdrawalHistoryPage";
  static const String pendingVehicleApprovalPage = "pendingVehicleApprovalPage";
  static const String driverDocumentImagePage = "driverDocumentImagePage";
  static const String complaintManagementScreen = "complaintManagementScreen";
  static const String updateVehicleApprovalPage = "updateVehicleApprovalPage";
  static const String uploadRejectedVehicleDocument = "UploadRejectedVehicleDocument";
  static const String complaintHistoryDetailsPage =
      "complaintHistoryDetailsPage";
  static const String vehicleRegistrationFirstPage =
      "vehicleRegistrationFirstPage";
  static const String vehicleRegistrationThirdPage =
      "vehicleRegistrationThirdPage";
  static const String vehicleRegistrationSecondPage =
      "vehicleRegistrationSecondPage";
  static const String vehicleRegistrationFourthPage =
      "vehicleRegistrationFourthPage";
}

class Routes {
  static dynamic route() {
    return {
      RouteName.root: (BuildContext context) => Splash(),
    };
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    debugPrint("Route Name ${settings.name} args $args ");
    var page;
    switch (settings.name) {
      case RouteName.root:
        page = const Splash();
        break;
      case RouteName.login:
        page = const LoginScreen();
        break;
      case RouteName.otpVerificationPage:
        page = const OTPVerificationPage();
        break;
      case RouteName.signUp:
        page = const SignUpScreen();
        break;

      case RouteName.privacyPolicyPage:
        page = const PrivacyPolicyPage();
        break;

      case RouteName.termsAndConditionPage:
        page = const TermsAndConditionsPage();
        break;

      case RouteName.pendingVehicleApprovalPage:
        page = const PendingAppovalPage();
        break;

      case RouteName.homePage:
        page = const HomePage();
        break;

      case RouteName.menuOptionScreen:
        page = const MenuOptionsScreen();
        break;

      case RouteName.driverListScreen:
        page = const DriverListScreen();
        break;

      case RouteName.updateVehicleApprovalPage:
        page = const UpdateVehicleDocumentsPage();
        break;

      case RouteName.searchDriverPage:
        page = const SearchDriverPage();
        break;

      case RouteName.loginHistoryPage:
        page = const LoginHistoryPage();
        break;

      case RouteName.loginHistoryDetailsPage:
        page = const LoginHistoryDetailsPage();
        break;


      case RouteName.driverOtpVerificationPage:
        page = const DriverOtpVerificationPage();
        break;

      case RouteName.earningFilterDataPage:
        page = const EarningFilterDataPage();
        break;


      case RouteName.uploadRejectedVehicleDocument:
        page = const UploadRejectedVehicleDocument();
        break;

      case RouteName.uploadDocumentPage:
        page = const UploadDocumentPage();
        break;


      case RouteName.ownerDriverList:
        page = const OwnerDriverList();
        break;

      case RouteName.driverDocumentsPage:
        page = const DriverDocumentsPage();
        break;

      case RouteName.vehicleRegistrationFirstPage:
        page = const VehicleRegistrationPage();
        break;
      case RouteName.vehicleRegistrationThirdPage:
        page = const VehicleRegistrationThirdPage();
        break;

      case RouteName.vehicleRegistrationSecondPage:
        page = const VehicleRegistrationSecondPage();
        break;

      case RouteName.messageScreen:
        page = const MessageScreen();
        break;


      case RouteName.driverListDetailsPage:
        page = const DriverListDetailsPage();
        break;

      case RouteName.transactionHistoryPage:
        page = const TransactionHistoryPage();
        break;

      case RouteName.vehicleRegistrationFourthPage:
        page = const VehicleRegistrationFourthScreen();
        break;

      case RouteName.bankDetailsScreen:
        page = const BankDetailsPage();
        break;

      case RouteName.vehicleInfoPage:
        page = const VehicleInfoPage();
        break;

      case RouteName.editVehicleFirstPage:
        page = const EditVehicleFirstPage();
        break;

      case RouteName.editVehicleSecondPage:
        page = const EditVehicleSecondPage();
        break;

      case RouteName.driverDocumentsPage:
        page = const DriverDocumentsPage();
        break;

      case RouteName.editVehicleThirdPage:
        page = const VehicleRegistrationThirdPage();
        break;

      case RouteName.vehicleInfoFirstPage:
        page = const VehicleInfoFirstPage();
        break;


      case RouteName.vehicleInfoSecondPage:
        page = const VehicleInfoSecondPage();
        break;

      case RouteName.editVehicleFourthPage:
        page = const EditVehicleFourthPage();
        break;

      case RouteName.driverPersonalInfoPage:
        page = const DriverPersonaInfoPage();
        break;

      case RouteName.driverDocumentPage:
        page = const DriverDocumentsPage();
        break;

      case RouteName.driverDocumentImagePage:
        page = const DriverDocumentImagePage();
        break;

      case RouteName.addDriverPage:
        page = const AddDriverPage();
        break;

      case RouteName.assignVehiclePage:
        page = const AssignVehiclePage();
        break;

      case RouteName.driverConfirmationPage:
        page = const DriverConfirmationPage();
        break;

      case RouteName.successfullyConnectedScreen:
        page = const SuccessfullyConnectedScreen();
        break;

      case RouteName.withdrawalRequestPage:
        page = const WithdrawalRequestPage();
        break;

      case RouteName.withdrawalHistoryPage:
        page = const WithDrawHistoryPage();
        break;

      case RouteName.complaintManagementScreen:
        page = const ComplaintManagementScreen();
        break;

      case RouteName.complaintHistoryDetailsPage:
        page = const ComplaintHistoryDetailsPage();
        break;

      case RouteName.newComplaintScreen:
        page = const NewComplaintScreen();
        break;

      case RouteName.pendingApprovalPage:
        page = const PendingAppovalPage();
        break;

      case RouteName.successfullyRegisterPage:
        page = const SuccessfullyRegisterPage();
        break;

      case RouteName.vehicleRegisterSuccess:
        page = const VehicleRegisterSuccessPage();
        break;

      case RouteName.uploadRejectedDocumentPage:
        page = const UploadRejectedDocumentPage();
        break;


      case RouteName.onlineOfflineDriverScreen:
        page = const OnlineOfflineDriverScreen();
        break;


      case RouteName.vehicleStatusPage:
        page = const VehicleStatusPage();
        break;


      case RouteName.vehicleRegistrationDemoPage:
        page = const VehicleRegistrationDemoPage();
        break;

      case RouteName.driverEarningDetailsPage:
        page = const DriverEarningDetailsPage();
        break;
    }
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(settings.name ?? ''),
          centerTitle: true,
        ),
        body: Center(
          child: Text('${settings.name!.split} Coming soon..'),
        ),
      ),
    );
  }
}
