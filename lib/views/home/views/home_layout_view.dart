import 'package:flutter/material.dart';
import 'package:permium_parts/views/home/bloc/home_bloc.dart';

class HomeLayoutView extends StatefulWidget {
  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  @override
  Widget build(BuildContext context) {
    HomeBloc bloc = HomeBloc.get(context);
    return Scaffold(
      body: bloc.pages[bloc.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bloc.index,
        onTap: (index) {
          bloc.add(ChangeIndex(index: index));
          setState(() {});
        },
        elevation: 0,
        selectedItemColor: Colors.blue[700],
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontSize: 11, color: Color.fromARGB(255, 0, 0, 0)),
        unselectedItemColor: Colors.blue[900],
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_shopping_cart_outlined,
                  size: 20,
                ),
                label: "Collections"),
           
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervisor_account_outlined,
                  size: 20,
                ),
                label: "Profile"),
        ],
      ),
    );
  }
}
