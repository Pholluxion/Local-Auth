import 'package:flutter/services.dart';

import 'package:local_auth_platform_interface/local_auth_platform_interface.dart';
import 'package:logger/logger.dart';

import '../service/services.dart';

class LocalAuthRepository {
  final Logger _logger;

  final PagaTodoLocalAuthenticationService _authService;

  LocalAuthRepository()
      : _logger = Logger(),
        _authService = PagaTodoLocalAuthenticationService();

  Future<bool> isDeviceSupported() async {
    try {
      _logger.i({"LocalAuthRepository": "isDeviceSupported"});
      return await _authService.isDeviceSupported();
    } catch (e) {
      _logger.e(e);
      return false;
    }
  }

  Future<bool> checkBiometrics() async {
    try {
      _logger.i({"LocalAuthRepository": "isDeviceSupported"});
      return await _authService.isDeviceSupported();
    } on PlatformException catch (e) {
      _logger.e(e);
      return false;
    }
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      _logger.i({"LocalAuthRepository": "getAvailableBiometrics"});
      return await _authService.getAvailableBiometrics();
    } on PlatformException catch (e) {
      _logger.e(e);
      return <BiometricType>[];
    }
  }

  Future<bool> authenticate() async {
    try {
      _logger.i({"LocalAuthRepository": "authenticate"});
      return await _authService.authenticate(
        options: const AuthenticationOptions(stickyAuth: true),
      );
    } on PlatformException catch (e) {
      _logger.e(e);
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    try {
      _logger.i({"LocalAuthRepository": "authenticateWithBiometrics"});
      return await _authService.authenticate(
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      _logger.e(e);
      return false;
    }
  }

  Future<bool> cancelAuthentication() async {
    try {
      _logger.i({"LocalAuthRepository": "cancelAuthentication"});
      return await _authService.stopAuthentication();
    } catch (e) {
      _logger.e(e);
      return false;
    }
  }
}
