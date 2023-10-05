import 'package:flutter/material.dart';

import 'widgets/pin_otp_field.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: true,
        children: const [
          _InfoText(),
          FilledRoundedPinPut(),
          SendCodeButton(),
          _InfoErrorText()
        ],
      ),
      persistentFooterButtons: const [NextButton()],
    );
  }
}

class _InfoErrorText extends StatelessWidget {
  const _InfoErrorText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          flex: 2,
          child: Icon(Icons.info_outline, color: Color(0xff0A84FF)),
        ),
        Flexible(
          flex: 5,
          child: Text(
            '¿No recibiste un código?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Flexible(
          flex: 3,
          child: Text(
            'Obtén información.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                decoration: TextDecoration.underline,
                color: const Color(0xff0A84FF)),
          ),
        ),
      ],
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        'Ingresa el código de verificación que enviamos a tu número celular',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: OutlinedButton(
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
          children: [Text("Solicitar un nuevo código")],
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

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
        onPressed: null,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Siguiente")],
        ),
      ),
    );
  }
}
