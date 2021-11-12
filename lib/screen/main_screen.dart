import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_authorization/screen/view_on_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: AppBar(
            leading: const Icon(Icons.link, color: Colors.grey),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    //TODO
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: ViewOnScreen(),
        ),
      ),
    );
  }
}
