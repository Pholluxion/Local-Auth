import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pagatodo/src/common/assets/assets.dart';
import 'package:pagatodo/src/modules/auth/login/bloc/bloc.dart';

import 'widgets/home_shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 5),
        () => true,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<LocalAuthCubit>().cancelAuthentication();
                    context.go('/login');
                  },
                  icon: const Icon(
                    Icons.menu,
                  ),
                )
              ],
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hola Carlos Daniel',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  // const SizedBox(height: 8.0),
                  // Text(
                  //   'Tu saldo \n\$ 5.000',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .titleMedium
                  //       ?.copyWith(color: Colors.white),
                  // ),
                ],
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              toolbarHeight: kToolbarHeight * 2,
              shape: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            body: Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Assets.images.home.image(),
              ),
            ),
          );
        }

        return const ShimmerWidget();
      },
    );
  }
}
