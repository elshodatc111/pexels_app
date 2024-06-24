import 'package:auth_register/ui/provider/forward_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FovoriteView extends StatelessWidget {
  const FovoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ForwardProvider(),
      builder: (context,_) {
        return ListView.builder(
          itemCount: context.watch<ForwardProvider>().forwards.length,
          itemBuilder: (context, index) {
            var forwards = context.watch<ForwardProvider>().forwards[index];
            return Container(
              margin: EdgeInsets.all(8.0),
              child: Image.network(forwards['image']), 
            );
          },
        );
      }
    );
  }
}
