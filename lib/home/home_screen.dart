import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listPopMenu = {'Logout'};
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          PopupMenuButton(
            onSelected: ((value) {
              handleClick(context, value);
            }),
            itemBuilder: ((context) {
              return listPopMenu.map((choice) {
                return PopupMenuItem(value: choice, child: Text(choice));
              }).toList();
            }),
          )
        ],
      ),
      body: Center(child: Column(
        children: [
          Image.asset('assets/img/teh.png'),
          const Text("Selamat datang, User!"),
        ],
      )),
    );
  }

  void handleClick(BuildContext context, Object? value) {
    switch (value) {
      case 'Logout':
      const snackBar = SnackBar(content: Text('Logout Berhasil!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.of(context)
      .pushNamedAndRemoveUntil('login', (route) => false);
      break;
    }
  }
}
