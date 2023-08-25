import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

const String _BANK_ACCOUNT_DETAILS = "bank_account_details";
const String _RECHARGE_WALLET_AMOUNTS = "recharge_wallet_amount";

RemoteConfigService remoteConfigSharedInstance =
    RemoteConfigService.getInstance();

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;
/*
  WamaAccountInfo? accountInfo;
  WalletRechargeDetail? rechargeDetails;
*/

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  final defaults = <String, dynamic>{
    _BANK_ACCOUNT_DETAILS:
        "{\"account_details\":{\"bank_details\":{\"account_name\":\"WamaTrendz\",\"account_number\":\"123205000434\",\"bank_name\":\"ICICIBank\",\"ifsc_code\":\"ICIC0001232\"},\"upi_details\":{\"gpay\":\"8976382223\",\"paytm\":\"8976382223\"}}}",
    _RECHARGE_WALLET_AMOUNTS:
        "{\"rechargeAmounts\":[{\"id\":1,\"amount\":5000},{\"id\":2,\"amount\":10000},{\"id\":3,\"amount\":25000},{\"id\":4,\"amount\":50000}]}",
  };

  static RemoteConfigService? _instance;

  factory RemoteConfigService.getInstance() {
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: FirebaseRemoteConfig.instance,
      );
    }
    return _instance!;
  }

  Future initialize() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 3),
      ));
      await _remoteConfig.setDefaults(defaults);

      await _fetchAndActivate();
    } catch (exc) {
      print(
          "Unable to fetch remote config. Default value will be used. Reason: ${exc}");
    }
  }

  /*WalletRechargeDetail getWalletRechargeValues() {
    String jsonString = _remoteConfig.getString(_RECHARGE_WALLET_AMOUNTS);
    debugPrint("JSON OF AVAILABLE WALLET RECHARGES: ${jsonString}");
    var rechargeInfo =
        WalletRechargeDetail.fromJson(jsonDecode(jsonString.trim()));
    return rechargeInfo;
  }

  WamaAccountInfo getBankDetails() {
    String jsonString = _remoteConfig.getString(_BANK_ACCOUNT_DETAILS);
    debugPrint("JSON OF BANK DETAILS: ${jsonString}");
    var bankInfo = WamaAccountInfo.fromJson(jsonDecode(jsonString.trim()));
    return bankInfo;
  }*/

  Future _fetchAndActivate() async {
    await _remoteConfig.fetch();
    await _remoteConfig.fetchAndActivate();
  //  accountInfo = getBankDetails();
   // rechargeDetails = getWalletRechargeValues();
  }
}
