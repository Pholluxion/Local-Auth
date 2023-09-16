part of 'local_auth_cubit.dart';

class LocalAuthState extends Equatable {
  const LocalAuthState({
    this.isDeviceSupported = false,
    this.checkBiometrics = false,
    this.authenticate = false,
    this.authenticateWithBiometrics = false,
    this.getAvailableBiometrics = const [],
  });

  final bool isDeviceSupported;
  final bool checkBiometrics;
  final bool authenticate;
  final bool authenticateWithBiometrics;
  final List<BiometricType> getAvailableBiometrics;

  @override
  List<Object> get props => [
        isDeviceSupported,
        checkBiometrics,
        authenticate,
        authenticateWithBiometrics,
        getAvailableBiometrics
      ];

  LocalAuthState copyWith({
    bool? isDeviceSupported,
    bool? checkBiometrics,
    bool? authenticate,
    bool? authenticateWithBiometrics,
    bool? cancelAuthentication,
    List<BiometricType>? getAvailableBiometrics,
  }) =>
      LocalAuthState(
        isDeviceSupported: isDeviceSupported ?? this.isDeviceSupported,
        checkBiometrics: checkBiometrics ?? this.checkBiometrics,
        authenticate: authenticate ?? this.authenticate,
        authenticateWithBiometrics:
            authenticateWithBiometrics ?? this.authenticateWithBiometrics,
        getAvailableBiometrics:
            getAvailableBiometrics ?? this.getAvailableBiometrics,
      );
}
