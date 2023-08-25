import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef void OnRetry();

class ConnectionUtil {
  ConnectionUtil._();

  static final _instance = ConnectionUtil._();

  static ConnectionUtil get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();

  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();

  Future<bool> isInternetConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }

  static getNoInternetView(OnRetry retryListner) {
    return Container(
      height: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'No Internet Connection.',
              style: TextStyle(fontSize: 26.0),
            ),
            TextButton(
              onPressed: retryListner,
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 26.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
