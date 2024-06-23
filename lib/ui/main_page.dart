import 'package:auth_register/ui/provider/main_provider.dart';
import 'package:auth_register/utels/wedgets/bottomnav_bar/bottomnav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>MainProvider(),
      builder: (context, snapshot) {
        return Consumer<MainProvider>(
          builder: (context, provider, _) {
            return Scaffold(
              appBar: AppBar(
                title: Text("${provider.currentViewTitle}"),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: provider.currentViewWidget,
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          }
        );
      }
    );
  }
}
