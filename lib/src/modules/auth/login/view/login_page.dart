import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pagatodo/src/common/common.dart';

import '../bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      context.read<LocalAuthCubit>().init,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: BlocConsumer<LocalAuthCubit, LocalAuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.go('/home');
          }
        },
        builder: (context, state) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  const Logo(),
                  const EmailInputField(),
                  const PasswordInputField(),
                  const RecoveryPassword(),
                  const SizedBox(height: 16.0),
                  const LogInButton(),
                  const SizedBox(height: 16.0),
                  Visibility(
                    visible: state.isEnabled,
                    child: const LocalAuthButton(),
                  ),
                  const Divider(color: Colors.black, height: 32.0),
                  const SignUpButton(),
                  const SizedBox(height: 64.0),
                ],
              ),
            ),
          ),
          persistentFooterButtons: [
            Container(
              decoration: const BoxDecoration(
                border:
                    Border.fromBorderSide(BorderSide(color: Colors.black12)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              margin: const EdgeInsets.all(0),
              child: PersistentModalBottomSheet(
                icon: const Icon(Icons.keyboard_arrow_up),
                onPressed: () => _showModalBottomSheet(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            PersistentModalBottomSheet(
              onPressed: context.pop,
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
            const Divider(),
            const LegalText(),
            const LegalText(),
            const LegalText(),
          ],
        );
      },
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      height: orientation == Orientation.portrait
          ? size.width * 0.45
          : size.height * 0.45,
      child: Assets.images.logoPagaTodoR.svg(),
    );
  }
}

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Olvide mi contraseña',
          style: TextStyle(
            overflow: TextOverflow.clip,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class LocalAuthButton extends StatelessWidget {
  const LocalAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.read<LocalAuthCubit>().authenticateWithBiometrics,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Ingresar con Face ID")],
      ),
    );
  }
}

class PersistentModalBottomSheet extends StatelessWidget {
  const PersistentModalBottomSheet({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Row(
          children: [
            const Flexible(
              flex: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.check_circle,
                      color: Color(0xff18CE26),
                    ),
                  ),
                  Text(
                    'Acepto condiciones legales',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: IconButton(onPressed: onPressed, icon: icon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegalText extends StatelessWidget {
  const LegalText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Row(
        children: [
          const Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_circle,
                color: Color(0xff18CE26),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: RichText(
              overflow: TextOverflow.clip,
              text: const TextSpan(
                text: 'Terminos y condiciones: ',
                style: TextStyle(
                  overflow: TextOverflow.clip,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Et commodo enim quis dolore aliqua.',
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Et commodo enim quis dolore aliqua.',
                    style: TextStyle(
                      overflow: TextOverflow.clip,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInputField extends StatelessWidget {
  const EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: 50,
        onChanged: (value) {},
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: const Text('Correo electrónico'),
          counterText: '',
          prefixIcon: const Icon(Icons.email),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFFF3B30),
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFFF3B30),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFF393939),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFF393939),
              width: 1.0,
            ),
          ),
        ),
        onTapOutside: (event) =>
            FocusScope.of(context).requestFocus(FocusNode()),
      ),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: true,
        maxLength: 50,
        onChanged: (value) {},
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: const Text('Contraseña'),
          counterText: '',
          prefixIcon: const Icon(Icons.lock),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFFF3B30),
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFFFF3B30),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFF393939),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Color(0xFF393939),
              width: 1.0,
            ),
          ),
        ),
        onTapOutside: (event) =>
            FocusScope.of(context).requestFocus(FocusNode()),
      ),
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () => context.go('/otp'),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Ingresar")],
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

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
        children: [Text("Registrarme")],
      ),
    );
  }
}
