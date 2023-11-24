import 'package:driver_ambulance/feactures/mapa/presentation/providers/storage/edificios_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends ConsumerState<Welcome> {
  @override
  void initState() {
    super.initState();
    ref.read(edificioProvider.notifier).getEdificio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/mapa'),
      ),
    );
  }
}
