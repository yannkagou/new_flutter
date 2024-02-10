import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_flutter/main.dart';

class Third extends ConsumerWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      body: Column(
        children: [Center(child: Text(name))],
      ),
    );
  }
}
