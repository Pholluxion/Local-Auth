import 'package:flutter/material.dart';
import 'package:pagatodo/src/common/assets/assets.gen.dart';
import 'package:rive/rive.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: RiveAnimation.asset(Assets.rive.precarga, fit: BoxFit.cover),
    );
  }
}
