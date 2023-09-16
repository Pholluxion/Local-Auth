import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalAuthCubit()..isDeviceSupported(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paga Todo Auth Prototipe')),
      body: BlocBuilder<LocalAuthCubit, LocalAuthState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.only(top: 30),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (state.isDeviceSupported)
                    const Text('This device is supported')
                  else
                    const Text('This device is not supported'),
                  const Divider(height: 100),
                  Text('Can check biometrics: ${state.checkBiometrics}\n'),
                  ElevatedButton(
                    onPressed: context.read<LocalAuthCubit>().checkBiometrics,
                    child: const Text('Check biometrics'),
                  ),
                  const Divider(height: 100),
                  Text(
                      'Available biometrics: ${state.getAvailableBiometrics.toString()}\n'),
                  ElevatedButton(
                    onPressed:
                        context.read<LocalAuthCubit>().getAvailableBiometrics,
                    child: const Text('Get available biometrics'),
                  ),
                  const Divider(height: 100),
                  Text(
                      'Current State: ${state.authenticate || state.authenticateWithBiometrics}\n'),
                  if (state.authenticate || state.authenticateWithBiometrics)
                    ElevatedButton(
                      onPressed:
                          context.read<LocalAuthCubit>().cancelAuthentication,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Cancel Authentication'),
                          Icon(Icons.cancel),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed:
                              context.read<LocalAuthCubit>().authenticate,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('Authenticate'),
                              Icon(Icons.perm_device_information),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: context
                              .read<LocalAuthCubit>()
                              .authenticateWithBiometrics,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(state.authenticate
                                  ? 'Cancel'
                                  : 'Authenticate: biometrics only'),
                              const Icon(Icons.fingerprint),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
