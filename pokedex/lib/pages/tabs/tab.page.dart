import 'package:flutter/material.dart';
import 'package:pokedex/utils/color.util.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        backgroundColor: ColorUtil.appBarColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ColorUtil.tabBorderColor,
              width: 3,
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/pokemon-tab.png'),
              label: 'Pokemon',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/moves-tab.png'),
              label: 'Moves',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/itens-tab.png'),
              label: 'Itens',
            ),
          ],
          selectedItemColor: ColorUtil.tabSelectedColor,
          backgroundColor: ColorUtil.tabColor,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
