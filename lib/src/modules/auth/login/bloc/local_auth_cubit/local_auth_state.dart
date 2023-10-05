part of 'local_auth_cubit.dart';

class LocalAuthState extends Equatable {
  const LocalAuthState({
    this.isEnabled = false,
    this.isDeviceSupported = false,
    this.checkBiometrics = false,
    this.isAuthenticated = false,
    this.availableBiometrics = const [],
  });

  final bool isEnabled;
  final bool isDeviceSupported;
  final bool checkBiometrics;
  final bool isAuthenticated;
  final List<BiometricType> availableBiometrics;

  @override
  List<Object> get props => [
        isEnabled,
        isDeviceSupported,
        checkBiometrics,
        isAuthenticated,
        availableBiometrics
      ];

  LocalAuthState copyWith({
    bool? isEnabled,
    bool? isDeviceSupported,
    bool? checkBiometrics,
    bool? isAuthenticated,
    List<BiometricType>? availableBiometrics,
  }) =>
      LocalAuthState(
        isEnabled: isEnabled ?? this.isEnabled,
        isDeviceSupported: isDeviceSupported ?? this.isDeviceSupported,
        checkBiometrics: checkBiometrics ?? this.checkBiometrics,
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        availableBiometrics: availableBiometrics ?? this.availableBiometrics,
      );
}
