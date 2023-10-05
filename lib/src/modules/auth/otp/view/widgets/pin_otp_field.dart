import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:pinput/pinput.dart';

class FilledRoundedPinPut extends StatefulWidget {
  const FilledRoundedPinPut({super.key});

  @override
  State<FilledRoundedPinPut> createState() => _FilledRoundedPinPutState();
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xff212631);
    const errorColor = Color(0xffE1121B);
    const fillColor = Color(0xffF2F2F2);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, color: borderColor),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return SizedBox(
      height: 70,
      child: Pinput(
        length: 6,
        controller: controller,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        onCompleted: (pin) {
          if (pin == '666666') {
            context.go('/error');
          }
          if (pin == '777777') {
            context.go('/ok');
          }
        },
        focusedPinTheme: defaultPinTheme.copyWith(
          height: 68,
          width: 64,
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: borderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            color: errorColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
