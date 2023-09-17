import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagatodo/src/common/assets/assets.gen.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 32.0),
                  SizedBox(
                    height: 150,
                    child: Assets.images.logoPagaTodoR.svg(),
                  ),
                  const TextField(),
                  const TextField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// BlocBuilder<LocalAuthCubit, LocalAuthState>(
//         builder: (context, state) {
//           return ListView(
//             padding: const EdgeInsets.only(top: 30),
//             children: <Widget>[
//               SizedBox(
//                 height: 150,
//                 child: Assets.images.logoPagaTodoR.svg(),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   if (state.isDeviceSupported)
//                     const Text('This device is supported')
//                   else
//                     const Text('This device is not supported'),
//                   const Divider(height: 100),
//                   Text('Can check biometrics: ${state.checkBiometrics}\n'),
//                   ElevatedButton(
//                     onPressed: context.read<LocalAuthCubit>().checkBiometrics,
//                     child: const Text('Check biometrics'),
//                   ),
//                   const Divider(height: 100),
//                   Text(
//                       'Available biometrics: ${state.availableBiometrics.toString()}\n'),
//                   ElevatedButton(
//                     onPressed:
//                         context.read<LocalAuthCubit>().getAvailableBiometrics,
//                     child: const Text('Get available biometrics'),
//                   ),
//                   const Divider(height: 100),
//                   Text('Current State: ${state.isAuthenticated}\n'),
//                   if (state.isAuthenticated)
//                     ElevatedButton(
//                       onPressed:
//                           context.read<LocalAuthCubit>().cancelAuthentication,
//                       child: const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[
//                           Text('Cancel Authentication'),
//                           Icon(Icons.cancel),
//                         ],
//                       ),
//                     )
//                   else
//                     Column(
//                       children: <Widget>[
//                         ElevatedButton(
//                           onPressed:
//                               context.read<LocalAuthCubit>().authenticate,
//                           child: const Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Text('Authenticate'),
//                               Icon(Icons.perm_device_information),
//                             ],
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: context
//                               .read<LocalAuthCubit>()
//                               .authenticateWithBiometrics,
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               Text(state.isAuthenticated
//                                   ? 'Cancel'
//                                   : 'Authenticate: biometrics only'),
//                               const Icon(Icons.fingerprint),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),