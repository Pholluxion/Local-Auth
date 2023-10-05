import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:pagatodo/src/common/assets/assets.dart';
import 'package:rive/rive.dart';

class OTPCompletePage extends StatelessWidget {
  const OTPCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguridad'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Container(
              height: 150.0,
              color: Theme.of(context).colorScheme.surface,
              child: RiveAnimation.asset(Assets.rive.exito),
            ),
            Text(
              '¡Configuración exitosa!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Este proceso se realiza una única vez, la próxima vez que ingresa podrás hacerlo con tu Face ID',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      persistentFooterButtons: const [HomeButton()],
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () => context.go('/home'),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Ir al Inicio")],
        ),
      ),
    );
  }
}
