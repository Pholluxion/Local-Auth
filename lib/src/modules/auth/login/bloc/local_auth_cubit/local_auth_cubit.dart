import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:local_auth_platform_interface/local_auth_platform_interface.dart';

import '../../data/data.dart';

part 'local_auth_state.dart';

class LocalAuthCubit extends Cubit<LocalAuthState> {
  LocalAuthCubit()
      : _localAuthRepository = LocalAuthRepository(),
        super(const LocalAuthState());

  final LocalAuthRepository _localAuthRepository;

  void isDeviceSupported() async {
    final isDeviceSupported = await _localAuthRepository.isDeviceSupported();

    emit(state.copyWith(
      isDeviceSupported: isDeviceSupported,
    ));
  }

  void checkBiometrics() async {
    final checkBiometrics = await _localAuthRepository.checkBiometrics();

    emit(state.copyWith(
      checkBiometrics: checkBiometrics,
    ));
  }

  void getAvailableBiometrics() async {
    final getAvailableBiometrics =
        await _localAuthRepository.getAvailableBiometrics();

    emit(state.copyWith(
      getAvailableBiometrics: getAvailableBiometrics,
    ));
  }

  void authenticate() async {
    final authenticate = await _localAuthRepository.authenticate();

    emit(state.copyWith(
      authenticate: authenticate,
    ));
  }

  void authenticateWithBiometrics() async {
    final authenticateWithBiometrics =
        await _localAuthRepository.authenticateWithBiometrics();

    emit(state.copyWith(
      authenticateWithBiometrics: authenticateWithBiometrics,
    ));
  }

  void cancelAuthentication() async {
    final cancelAuthentication =
        await _localAuthRepository.cancelAuthentication();

    if (cancelAuthentication) {
      emit(state.copyWith(
        authenticate: false,
        authenticateWithBiometrics: false,
      ));
    }
  }
}
