import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuButton {
  final VoidCallback onPressed;
  final IconData icon;

  MenuButton({
    required this.onPressed,
    required this.icon,
  });
}

class MenuApp extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<MenuButton> items;

  const MenuApp({
    super.key, 
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (context) {
            Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
          return _MenuBackgroud(
            child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _MenuBackgroud extends StatelessWidget {

  final Widget child;

  const _MenuBackgroud({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColors = Provider.of<_MenuModel>(context).backgroundColor;
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColors,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ]
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  
  final List<MenuButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
        List.generate(menuItems.length, (i) => _MenuButton(i, menuItems[i]))
    );
  }
}

class _MenuButton extends StatelessWidget {

  final int index;
  final MenuButton item;

  const _MenuButton(this.index,  this.item);

  @override
  Widget build(BuildContext context) {

    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false ).itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (itemSeleccionado == index) ? 35 : 20,
        color: (itemSeleccionado == index) ? menuModel.activeColor : menuModel.inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  
  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index){
    _itemSeleccionado = index;
    notifyListeners();
  }
}