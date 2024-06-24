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
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
          ),
          itemCount: context.watch<ForwardProvider>().forwards.length,
          itemBuilder: (context, index) {
            var forwards = context.watch<ForwardProvider>().forwards[index];

            return Container(
              width: double.infinity,
              height: 200,
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.red,
              ),
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          forwards['image'],
                        ),
                        fit: BoxFit.cover,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.grey,
                        ],
                      ),
                    ),
                    child: const SizedBox(
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<ForwardProvider>().removeTodo(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )

              //Image.network(forwards['image']),
            );
          },
        );
      }
    );
  }
}
