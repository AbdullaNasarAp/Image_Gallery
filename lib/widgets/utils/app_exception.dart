import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppExceptions {
  static void errorHandler(Object e) {
    if (e is PlatformException) {
      AppToast.showToast('Platform Error Occured');
    }
    if (e is SocketException) {
      AppToast.showToast('No Internet Connection');
    } else if (e is TimeoutException) {
      AppToast.showToast('Connection Timedout');
    } else if (e is MissingPluginException) {
      AppToast.showToast('Plugin error occured');
    } else if (e is DioError) {
      if (e.response?.statusCode == 403 &&
          e.response?.data['message'] == 'forbidden') {
        log('refresh token expired so loging out');
      }
      if (e.response?.data['message'] != null) {
        AppToast.showToast(e.response!.data['message'].toString());
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppToast.showToast('Response timedout');
      } else if (e.type == DioErrorType.cancel) {
        AppToast.showToast('Request cancelled');
      } else if (e.type == DioErrorType.sendTimeout) {
        AppToast.showToast('Request timedout');
      } else if (e.error is SocketException) {
        AppToast.showToast('No Internet Connection');
      }
    }
  }
}

class AppToast {
  static Future<void> showToast(
    String msg, [
    Toast toastLength = Toast.LENGTH_SHORT,
  ]) async {
    await Fluttertoast.cancel();
    await Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.red,
      toastLength: toastLength,
    );
  }
}
