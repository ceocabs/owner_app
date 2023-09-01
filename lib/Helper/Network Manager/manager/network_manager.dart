import 'dart:convert';
import 'dart:io';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:owner/Helper/Network%20Manager/manager/service_api.dart';
import 'package:owner/ui/auth/otp_verification_page.dart';
import '../../../model/response.dart';
import '../../../ui/auth/login_screen.dart';
import '../../constants.dart';
import '../exception/exception.dart';

NetworkManager client = NetworkManager.getInstance();

enum APIMethod { get, post, put, patch, delete }

/// A singleton class for making API requests
class NetworkManager {
  /// Create http client, used for making API calls
  http.Client client = http.Client();

  /// Instance of [NetworkManager]
  static NetworkManager? _instance;

  String? _token;

  /// Private constructor
  NetworkManager._();

  /// static method to return the static singleton instance
  factory NetworkManager.getInstance() {
    /// create and return a new instance of [NetworkManager]
    _instance = NetworkManager._();
    return _instance!;
  }

  /// Save token, will be used throughout the app for authentication
  Future<void> saveToken(String? token) async {
    assert(token != null && token.isNotEmpty);

    _token = token;
    try {
      await sharedDefault.save('auth_token', token);
    } catch (_) {}
  }

  /// Returns the token from the [sharedPref]
  Future<String?> _getToken() async {
    try {
      _token = await sharedDefault.read('auth_token');
    } catch (e) {
      _token = null;
    }

    return _token;
  }

  Future<String?> getTokenNew() async {
    try {
      _token = await sharedDefault.read('auth_token');
    } catch (e) {
      _token = null;
    }

    return _token;
  }

  // Check if the user is logged in or not
  Future<bool> isLoggedIn() async {
    String? token = await _getToken();
    return token != null && token != "";
  }

  /// Logout and clear shared prefrence
  /* Future<void> logout() async {
    helperClass.getId().then((id) {
      var apiHandler = LogoutViewModel();

      apiHandler.logoutUser(deviceId: id).then((response) async {
        if (response?.success == true) {
          try {
            await sharedDefault.clearPreference();
            Get.offAll(() => LoginScreen());
          } catch (e) {
            throw APIException(
                "Failed to clear user defaults. Error: ${e.toString()}",
                statusCode: ErrorCode.local.index);
          }
        } else {
          throw APIException("${response?.message?.join("\n")}",
              statusCode: ErrorCode.local.index);
        }
      });
    });
  }*/

  /// Dispose the [APIManager] instance
  static dispose() {
    _instance = null;
  }

  /// Makes the API request here
  ///
  /// [endPoint] - Endpoint of the API
  /// [method] - Type of [APIMethod]. Defaults to [APIMethod.get] See [APIMethod] enum for all the available methods
  /// [data] - data to be passed in the request in [Map] format
  /// [isAuthenticated] - if authenticated, Bearer token authorization will be added, otherwise not
  Future<Response> request(
    ServiceApi target, {
    Map<String, dynamic>? data,
    bool isAuthenticated = true,
  }) async {
    assert(target.endpoint.isNotEmpty);

    /// Set url
    var url = Uri.parse(baseURL() + target.endpoint);

    print('url-' + url.toString());

    /// Create non-auth header
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':token
    };

    /// Add bearer token, if the APIcall is to be authenticated
    if (isAuthenticated) {
      String? token = await _getToken();

      headers.addAll({'Authorization': token ?? ""});
    }

    _printRequest(target, data: data, headers: headers);

    late http.Response response;
    try {
      switch (target.method) {
        case APIMethod.get:
          if (data != null) {
            url = Uri.parse(baseURL() + target.endpoint)
                .replace(queryParameters: data);
          }
          response = await client.get(url, headers: headers);
          break;
        case APIMethod.post:
          response =
              await client.post(url, headers: headers, body: json.encode(data));
          break;
        case APIMethod.put:
          response =
              await client.put(url, headers: headers, body: json.encode(data));
          break;
        case APIMethod.patch:
          response = await client.patch(url,
              headers: headers, body: json.encode(data));
          break;
        case APIMethod.delete:
          response = await client.delete(url, headers: headers);
          break;
      }
    } catch (e) {
      throw APIException(e.toString(), statusCode: ErrorCode.api.index);
    }

    return _handleResponse(response);
  }

  /// This method uploads the file
  ///
  /// [endPoint] - Endpoint of the API
  /// [file] - the file which is to be uploaded
  /// [fileKey] - file will be posted under this key
  /// [data] - Map representation of data to be posted along with the file
  /// [isAuthenticated] - if the API is to be authenticated or not
  Future<Response> uploadFile(ServiceApi target,
      {required File file,
      required String fileKey,
      Map<String, String>? data,
      bool isAuthenticated = true}) async {
    assert(target.endpoint.isNotEmpty);
    assert(fileKey.isNotEmpty);

    /// Common header
    var headers = {
      'Content-Type': 'application/json',
    };

    /// Add bearer token, if the API call is to be authenticated
    if (isAuthenticated) {
      String? token = await _getToken();

      headers.addAll({'Authorization': '$token'});
    }

    _printRequest(target, data: data, headers: headers);

    /// Create multipart request
    final mimeTypeData =
        lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])!.split('/');
    final multipartRequest =
        http.MultipartRequest('POST', Uri.parse(baseURL() + target.endpoint));
    final _file = await http.MultipartFile.fromPath(fileKey, file.path,
        contentType: MediaType(mimeTypeData[0], mimeTypeData[1]));

    /// Add headers, files and fields to the multipart request
    multipartRequest.headers.addAll(headers);
    multipartRequest.files.add(_file);
    if (data != null) multipartRequest.fields.addAll(data);

    var response;

    /// Send the request and await for the response
    final streamedResponse = await multipartRequest.send();
    response = await http.Response.fromStream(streamedResponse);

    return _handleResponse(response);
  }

  /// This method handles the response of the API
  _handleResponse(http.Response response) {
    /// parse the response
    var responseBody = json.decode(response.body);

    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    print("RESPONSE: ${encoder.convert(responseBody)}");

    /// status code of the response
    int statusCode = response.statusCode;

    bool isSuccessful = statusCode >= 200 && statusCode < 300;

    String error = '';
    if (!isSuccessful && statusCode == HttpStatus.unauthorized) {
      Get.off(LoginScreen());
      error = "Unauthorized user";
      throw APIException(error, data: responseBody, statusCode: statusCode);
    }

    return Response(
      data: responseBody,
      rawData: response,
      statusCode: statusCode,
      isSuccessful: isSuccessful,
      error: error,
    );
  }

  _printRequest(ServiceApi target, {Map? data, required Map? headers}) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(data);

    print(
        "\n\nURL: ${baseURL() + "${target.endpoint}"} \nParameters: $prettyprint \nMethod: ${target.method} \nHeaders: $headers\n\n");
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
