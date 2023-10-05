import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:local_auth_platform_interface/local_auth_platform_interface.dart';

import '../../data/data.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> with HydratedMixin {
  LocalAuthCubit()
      : _localAuthRepository = LocalAuthRepository(),
        super(const LocalAuthState());

  final LocalAuthRepository _localAuthRepository;

  void init(_) {
    if (state.isEnabled && !state.isAuthenticated) {
      this
        ..isDeviceSupported()
        ..checkBiometrics()
        ..authenticateWithBiometrics();
    }
  }

  void enableLocalAuth() => emit(state.copyWith(isEnabled: true));
  void disableLocalAuth() => emit(state.copyWith(isEnabled: false));

  void isDeviceSupported() async {
    final isDeviceSupported = await _localAuthRepository.isDeviceSupported();

    emit(state.copyWith(isDeviceSupported: isDeviceSupported));
  }

  void checkBiometrics() async {
    final checkBiometrics = await _localAuthRepository.checkBiometrics();

    emit(state.copyWith(checkBiometrics: checkBiometrics));
  }

  void getAvailableBiometrics() async {
    final availableBiometrics =
        await _localAuthRepository.getAvailableBiometrics();

    emit(state.copyWith(availableBiometrics: availableBiometrics));
  }

  void authenticate() async {
    final isAuthenticated = await _localAuthRepository.authenticate();

    emit(state.copyWith(isAuthenticated: isAuthenticated));
  }

  void authenticateWithBiometrics() async {
    final isAuthenticated =
        await _localAuthRepository.authenticateWithBiometrics();

    emit(state.copyWith(isAuthenticated: isAuthenticated));
  }

  void cancelAuthentication() async {
    final cancelAuthentication =
        await _localAuthRepository.cancelAuthentication();
    log(cancelAuthentication.toString());
    if (cancelAuthentication) {
      emit(state.copyWith(isAuthenticated: false));
    }
  }

  @override
  LocalAuthState? fromJson(Map<String, dynamic> json) {
    LocalAuthState stateFromJson = const LocalAuthState();
    return stateFromJson.copyWith(isEnabled: json['isEnabled'] as bool);
  }

  @override
  Map<String, dynamic>? toJson(LocalAuthState state) {
    return {'isEnabled': state.isEnabled};
  }
}
