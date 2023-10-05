import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class OTPErrorPage extends StatelessWidget {
  const OTPErrorPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.numbers,
                  size: 72.0,
                  color: Color(0xff0A84FF),
                ),
                Icon(
                  Icons.numbers,
                  size: 72.0,
                  color: Color(0xff0A84FF),
                ),
                Icon(
                  Icons.numbers,
                  size: 72.0,
                  color: Color(0xff0A84FF),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Text(
              'Si no recibiste el código de verificación y tu número celular ingresado está digitado correctamente escribenos a soporte.digital@gelsa.com.co para recibir ayuda.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 24.0),
            Text(
              'Número de celular registrado:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              '3001234567',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      persistentFooterButtons: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              ContactButton(),
              ReTryButton(),
            ],
          ),
        )
      ],
    );
  }
}

class ReTryButton extends StatelessWidget {
  const ReTryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () => context.go('/pin'),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Volver a intentar")],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(
            color: Color(0xff212631),
            strokeAlign: 5.0,
            style: BorderStyle.solid,
            width: 5.0,
          ),
        ),
      ),
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Contáctanos")],
      ),
    );
  }
}
