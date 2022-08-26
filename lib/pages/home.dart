import 'package:flutter/material.dart';
import 'package:movie_flutter/states/states.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<StateMovies>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ditonton"),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  "Gerry Surya Chandra",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  "suryagerry@gmail.com",
                ),
                currentAccountPicture: Icon(
                  Icons.account_circle,
                  size: 72,
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Ditonton'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text("Now Playing", style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ));
  }
}
