import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_game/config/config.dart';
import 'package:todo_game/main.dart';
import 'package:todo_game/screens/home.dart';
import 'package:todo_game/screens/shop.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int pageIndex = 0;

  List<Widget> pages = [HomeScreen(), ShopScreen()];

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(Config.title),
        actions: [
          Badge(
            label: Text("${appState.points}p"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) => setState(() => pageIndex = index),
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        selectedIndex: pageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.shop), label: "Shop"),
        ],
      ),
    );
  }
}
