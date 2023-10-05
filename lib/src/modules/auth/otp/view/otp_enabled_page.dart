import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pagatodo/src/modules/auth/login/bloc/bloc.dart';

class OTPEnabledPage extends StatelessWidget {
  const OTPEnabledPage({super.key});

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
          shrinkWrap: true,
          children: [
            const Icon(
              Icons.fingerprint,
              size: 72.0,
              color: Color(0xff0A84FF),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Ahora podrás ingresar con el reconocimiento facial o de tu huella, según las configuraciones de tu celular. Ten presente que quedaran habilitadas todas las huellas o rostros que esten guardados en el celular. Podrás cambiar esta configuración desde la sección seguridad en el menú principal. ¿Deseas activarlo?',
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
      persistentFooterButtons: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              RejetButton(),
              ConfirmButton(),
            ],
          ),
        )
      ],
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalAuthCubit, LocalAuthState>(
      listener: (context, state) {
        if (state.isEnabled) {
          context.go('/pin');
        }
      },
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          context.read<LocalAuthCubit>().enableLocalAuth();
          if (context.read<LocalAuthCubit>().state.isEnabled) {
            context.go('/pin');
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Si, deseo activarlo")],
        ),
      ),
    );
  }
}

class RejetButton extends StatelessWidget {
  const RejetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalAuthCubit, LocalAuthState>(
      listener: (context, state) {
        if (!state.isEnabled) {
          context.go('/home');
        }
      },
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
        onPressed: () => context.read<LocalAuthCubit>().disableLocalAuth(),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("No, en otro momento")],
        ),
      ),
    );
  }
}
