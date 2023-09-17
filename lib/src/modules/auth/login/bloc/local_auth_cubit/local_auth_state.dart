part of 'local_auth_cubit.dart';

class LocalAuthState extends Equatable {
  const LocalAuthState({
    this.isDeviceSupported = false,
    this.checkBiometrics = false,
    this.isAuthenticated = false,
    this.availableBiometrics = const [],
  });

  final bool isDeviceSupported;
  final bool checkBiometrics;
  final bool isAuthenticated;
  final List<BiometricType> availableBiometrics;

  @override
  List<Object> get props => [
        isDeviceSupported,
        checkBiometrics,
        isAuthenticated,
        availableBiometrics
      ];

  LocalAuthState copyWith({
    bool? isDeviceSupported,
    bool? checkBiometrics,
    bool? isAuthenticated,
    List<BiometricType>? availableBiometrics,
  }) =>
      LocalAuthState(
        isDeviceSupported: isDeviceSupported ?? this.isDeviceSupported,
        checkBiometrics: checkBiometrics ?? this.checkBiometrics,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        availableBiometrics: availableBiometrics ?? this.availableBiometrics,
      );
}
