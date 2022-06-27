import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp1/bloc/bottomnavbar/cubithome.dart';

import '../bloc/bottomnavbar/statehome.dart';

class homelayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<shophomecubit, shophomestates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = shophomecubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Salla'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homelayout()));
                  },
                  icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.screen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changebottomnavifationbar(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'categores'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        );
      },
    );
  }
}
