import 'dart:async';

import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_platform_interface/local_auth_platform_interface.dart';

/// Autor: Carlos Daniel Peñaloza Torres
/// Correo: carlos.penaloza@dcsas.com.co
///
/// Servicio para autenticar la identidad del usuario de forma local.
class PagaTodoLocalAuthenticationService {
  /// Autentica al usuario con biometría disponible en el dispositivo, permitiendo también
  /// al usuario usar la autenticación del dispositivo, como PIN, patrón o código de acceso.
  ///
  /// Devuelve true si el usuario se autenticó con éxito, false en caso contrario.
  ///
  /// [localizedReason] es el mensaje que se muestra al usuario al solicitarle
  /// autenticación. Típicamente, se trata de algo como: 'Autenticar
  /// para acceder a MiApp.'. Este campo no debe estar vacío.
  ///
  /// Proporciona [authMessages] si deseas
  /// personalizar los mensajes en los diálogos.
  ///
  /// Proporciona [options] para configurar opciones adicionales relacionadas con la autenticación.
  ///
  /// Lanza una excepción [PlatformException] si hubo problemas técnicos con la
  /// autenticación local (por ejemplo, falta de hardware relevante). Esto podría lanzar
  /// una excepción [PlatformException] con el código de error [otherOperatingSystem] en el simulador de iOS.
  Future<bool> authenticate({
    AuthenticationOptions options = const AuthenticationOptions(),
  }) =>
      LocalAuthPlatform.instance.authenticate(
        localizedReason: 'Autentite para acceder a Paga Todo',
        authMessages: [iosAuthMessages, androidAuthMessages],
        options: options,
      );

  /// Cancela cualquier autenticación en curso, devolviendo true si la autenticación se
  /// canceló con éxito.
  ///
  /// Devuelve false si hubo algún error, no hay autenticación en curso,
  /// o la plataforma actual no admite la autenticación.
  Future<bool> stopAuthentication() async =>
      LocalAuthPlatform.instance.stopAuthentication();

  /// Devuelve true si el dispositivo es capaz de verificar la biometría.
  Future<bool> get canCheckBiometrics =>
      LocalAuthPlatform.instance.deviceSupportsBiometrics();

  /// Devuelve true si el dispositivo es capaz de verificar la biometría o si puede
  /// recurrir a las credenciales del dispositivo en caso de fallo.
  Future<bool> isDeviceSupported() async =>
      LocalAuthPlatform.instance.isDeviceSupported();

  /// Devuelve una lista de biometrías inscritas.
  Future<List<BiometricType>> getAvailableBiometrics() =>
      LocalAuthPlatform.instance.getEnrolledBiometrics();
}

/// Definicion de mensajes en plataformas Android

final androidAuthMessages = AndroidAuthMessages(
  signInTitle: _androidSignInTitle,
  cancelButton: _androidCancelButton,
  biometricHint: _androidBiometricHint,
  biometricSuccess: _androidBiometricSuccess,
  goToSettingsButton: _androidGoToSettings,
  biometricNotRecognized: _androidBiometricNotRecognized,
  biometricRequiredTitle: _androidBiometricRequiredTitle,
  goToSettingsDescription: _androidGoToSettingsDescription,
  deviceCredentialsRequiredTitle: _androidDeviceCredentialsRequiredTitle,
  deviceCredentialsSetupDescription: _androidDeviceCredentialsSetupDescription,
);

/// Mensaje que se muestra en un botón en el que el usuario puede hacer clic para ir a
/// páginas de configuración desde el cuadro de diálogo actual.
String get _androidGoToSettings => Intl.message('Ir a configuración',
    desc:
        'Mensaje que se muestra en un botón en el que el usuario puede hacer clic para ir a '
        'páginas de configuración desde el cuadro de diálogo actual. Máximo 30 caracteres.');

/// Mensaje de sugerencia que aconseja al usuario cómo autenticarse con biometría.
String get _androidBiometricHint => Intl.message('Verificar identidad',
    desc:
        'Mensaje de sugerencia que aconseja al usuario cómo autenticarse con biometría. '
        'Máximo 60 caracteres.');

/// Mensaje para informar al usuario que la autenticación falló.
String get _androidBiometricNotRecognized =>
    Intl.message('No reconocido. Intente de nuevo.',
        desc: 'Mensaje para informar al usuario que la autenticación falló. '
            'Máximo 60 caracteres.');

/// Mensaje para informar al usuario que la autenticación fue exitosa.
String get _androidBiometricSuccess => Intl.message('Éxito',
    desc: 'Mensaje para informar al usuario que la autenticación fue exitosa. '
        'Máximo 60 caracteres.');

/// Mensaje que se muestra en un botón en el que el usuario puede hacer clic para salir
/// del cuadro de diálogo actual.
String get _androidCancelButton => Intl.message('Cancelar',
    desc:
        'Mensaje que se muestra en un botón en el que el usuario puede hacer clic para salir '
        'del cuadro de diálogo actual. Máximo 30 caracteres.');

/// Mensaje que se muestra como título en un cuadro de diálogo que indica al usuario
/// que necesita escanear la biometría para continuar.
String get _androidSignInTitle => Intl.message('Autenticación requerida',
    desc:
        'Mensaje que se muestra como título en un cuadro de diálogo que indica al usuario '
        'que necesita escanear la biometría para continuar. Máximo 60 caracteres.');

/// Mensaje que se muestra como título en un cuadro de diálogo que indica al usuario
/// que no ha configurado la autenticación biométrica en su dispositivo.
String get _androidBiometricRequiredTitle => Intl.message('Biometría requerida',
    desc:
        'Mensaje que se muestra como título en un cuadro de diálogo que indica al usuario '
        'que no ha configurado la autenticación biométrica en su dispositivo. Máximo 60 caracteres.');

/// Mensaje que se muestra como título en un cuadro de diálogo que indica al usuario
/// que no ha configurado la autenticación de credenciales en su dispositivo.
String get _androidDeviceCredentialsRequiredTitle => Intl.message(
    'Credenciales del dispositivo requeridas',
    desc:
        'Mensaje que se muestra como título en un cuadro de diálogo que indica al usuario '
        'que no ha configurado la autenticación de credenciales en su dispositivo. Máximo 60 caracteres.');

/// Mensaje que aconseja al usuario ir a la configuración y configurar
/// las credenciales del dispositivo en su dispositivo.
String get _androidDeviceCredentialsSetupDescription => Intl.message(
    'Credenciales del dispositivo requeridas',
    desc: 'Mensaje que aconseja al usuario ir a la configuración y configurar '
        'las credenciales del dispositivo en su dispositivo.');

/// Mensaje que aconseja al usuario ir a la configuración y configurar
/// la autenticación biométrica en su dispositivo.
String get _androidGoToSettingsDescription => Intl.message(
    'La autenticación biométrica no está configurada en su dispositivo. Vaya a '
    "'Configuración > Seguridad' para agregar la autenticación biométrica.",
    desc: 'Mensaje que aconseja al usuario ir a la configuración y configurar '
        'la autenticación biométrica en su dispositivo.');

/// Definicion de mensajes en plataformas iOS

final iosAuthMessages = IOSAuthMessages(
  lockOut: _iOSLockOut,
  cancelButton: _iOSOkButton,
  goToSettingsButton: _iOSGoToSettings,
  goToSettingsDescription: _iOSGoToSettingsDescription,
  localizedFallbackTitle: _localizedFallbackTitle,
);

/// El título localizado para el botón de respaldo en el cuadro de diálogo que se
/// presenta al usuario durante la autenticación.
String get _localizedFallbackTitle => Intl.message('Botón de respaldo',
    desc:
        'El título localizado para el botón de respaldo en el cuadro de diálogo que se '
        'presenta al usuario durante la autenticación');

/// Mensaje que se muestra en un botón en el que el usuario puede hacer clic para ir a
/// páginas de configuración del cuadro de diálogo actual.
String get _iOSGoToSettings => Intl.message('Ir a la configuración',
    desc:
        'Mensaje mostrado en un botón en el que el usuario puede hacer clic para ir a '
        'páginas de configuración del cuadro de diálogo actual. Máximo 30 caracteres.');

/// Mensaje que aconseja al usuario volver a habilitar la biometría en su dispositivo.
/// Se muestra en un cuadro de diálogo en iOS.
String get _iOSLockOut => Intl.message(
    'La autenticación biométrica está deshabilitada. Bloquee y desbloquee su pantalla para '
    'activarla.',
    desc:
        'Mensaje que aconseja al usuario volver a habilitar la biometría en su dispositivo.');

/// Mensaje que aconseja al usuario ir a la configuración y configurar la Biometría
/// en su dispositivo.
String get _iOSGoToSettingsDescription => Intl.message(
    'La autenticación biométrica no está configurada en su dispositivo. Por favor habilite '
    'Touch ID o Face ID en tu teléfono.',
    desc:
        'Mensaje advirtiendo al usuario que vaya a los ajustes y configure la Biometría'
        'para su dispositivo.');

/// Mensaje que se muestra en un botón en el que el usuario puede hacer clic para salir
/// del cuadro de diálogo actual.
String get _iOSOkButton => Intl.message('Aceptar',
    desc:
        'Mensaje que se muestra en un botón en el que el usuario puede hacer clic para salir '
        'del cuadro de diálogo actual. Máximo 30 caracteres.');
