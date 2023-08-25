import 'package:owner/Helper/Network%20Manager/manager/network_manager.dart';

enum ProjectEnvironment { test, production }

ProjectEnvironment environment = ProjectEnvironment.production;
String apiPlatForm = "";

String testBaseUrl = "";
String productionBaseUrl = "http://3.6.38.95/public/api/";

String baseURL() {
  switch (environment) {
    case ProjectEnvironment.test:
      apiPlatForm = "test";
      return "https://dev.wamatechnology.com/projects/wama-trendz-reseller-project/";

    case ProjectEnvironment.production:
      apiPlatForm = "production";
      return "http://13.126.160.153:8005/";
    //    return "http://13.233.70.250/public/api/";
  }
}

enum ServiceApi {
  signUp,
  verifyOTP,
  login,
  register,
  resendOtp,
  logout,
  checkDocumentStatus,
  getUserinfo,
  getColor,
  getBrand,
  getVehicleName,
  getVehicleType,
  getFuelType,
  getOwner,
  uploadImage,
  checkVehicleDocStatus,
  getVehicleInfo,
  assignDriver,
  getDriverList,
  getCity,
  getState,
  registervehicle,
  registrationYearList,
  getVehicleByStatus,
  editVehicleDocuments,
  insuranceType,
  insuranceCompanies,
  vehicleDetailsById,
  editVehicleAllDetails,
  getOwnerByStatus,
  assignVehicle,
  editOwnerDocuments,
  removeVehicle,
  searchDriver,
  verifyDriverOTP,
  assignDriverToOwner,
  ownrDriverList
}

extension ServiceExtension on ServiceApi {
  String get endpoint {
    switch (this) {
      case ServiceApi.signUp:
        return "public/api/registerowner";
      case ServiceApi.verifyOTP:
        return "public/api/verifyownerotp";
      case ServiceApi.login:
        return "public/api/loginowner";
      case ServiceApi.resendOtp:
        return "public/api/resendownerotp";
      case ServiceApi.register:
        return "public/api/processregistration";

      case ServiceApi.logout:
        return "public/api/ownerlogout";

      case ServiceApi.checkDocumentStatus:
        return "public/api/checkdocumentstatus";

      case ServiceApi.getUserinfo:
        return "public/api/getownerinfo";

      case ServiceApi.getColor:
        return "public/api/getcolor";

      case ServiceApi.getBrand:
        return "public/api/getbrand";

      case ServiceApi.getVehicleName:
        return "public/api/getvehiclenamebybrand";

      case ServiceApi.getVehicleType:
        return "public/api/getvehicletype";

      case ServiceApi.getFuelType:
        return "public/api/getfueltype";

      case ServiceApi.getOwner:
        return "public/api/getowner";

      case ServiceApi.getVehicleType:
        return "public/api/getvehicletype";

      case ServiceApi.checkVehicleDocStatus:
        return "public/api/checkvehicledocstatus";

      case ServiceApi.getVehicleInfo:
        return "public/api/getvehicleinfo";

      case ServiceApi.assignDriver:
        return "public/api/assigndriver";

      case ServiceApi.getDriverList:
        return "public/api/getdriverlist";

      case ServiceApi.uploadImage:
        return "public/api/upload-image";

      case ServiceApi.getCity:
        return "public/api/getcity";

      case ServiceApi.getState:
        return "public/api/getstate";

      case ServiceApi.registervehicle:
        return "public/api/registervehicle";

      case ServiceApi.registrationYearList:
        return "get-registrations-years-list";

      case ServiceApi.getVehicleByStatus:
        return "get-vehicles-by-status";

      case ServiceApi.editVehicleDocuments:
        return "edit-vehicle-documents";

      case ServiceApi.insuranceType:
        return "public/api/insurance-types";

      case ServiceApi.insuranceCompanies:
        return "public/api/insurance-companies";

      case ServiceApi.vehicleDetailsById:
        return "vehicle-details-by-id";

      case ServiceApi.editVehicleAllDetails:
        return "edit-vehicle-all-details";

      case ServiceApi.getOwnerByStatus:
        return "get-owner-by-status";


      case ServiceApi.assignVehicle:
        return "public/api/assignvehicle";


      case ServiceApi.editOwnerDocuments:
        return "edit-owner-documents";

      case ServiceApi.removeVehicle:
        return "remove-vehicle";

      case ServiceApi.searchDriver:
        return "public/api/search-driver-mobile-send-otp";


      case ServiceApi.verifyDriverOTP:
        return "public/api/search-driver-mobile-verify-otp";


      case ServiceApi.assignDriverToOwner:
        return "public/api/assigndriver";

      case ServiceApi.ownrDriverList:
        return "owner-drivers-list";

    }
  }

  APIMethod get method {
    switch (this) {
      case ServiceApi.getColor:
        return APIMethod.get;

      case ServiceApi.getVehicleType:
        return APIMethod.get;

      case ServiceApi.getFuelType:
        return APIMethod.get;

      case ServiceApi.getOwner:
        return APIMethod.get;

      case ServiceApi.getBrand:
        return APIMethod.get;

      case ServiceApi.getVehicleName:
        return APIMethod.post;

      default:
        return APIMethod.post;
    }
  }
}
