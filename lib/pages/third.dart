import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_flutter/main.dart';

// class ThirdPage extends ConsumerWidget {
//   const ThirdPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);

//     return Scaffold(
//       body: Column(
//         children: [Center(child: Text(name))],
//       ),
//     );
//   }
// }

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final name = ref.watch(nameProvider);
        final firstname = ref.watch(nameStateProvider) ?? '';
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              Text(firstname),
              TextField(
                onSubmitted: (value) {
                  ref.read(nameStateProvider.notifier).update((state) => value);
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
