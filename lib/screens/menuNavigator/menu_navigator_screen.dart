  import 'package:appunificada/providers/model_menu_provider.dart';
  import 'package:appunificada/screens/listImages/search_screen.dart';
  import 'package:appunificada/screens/tips/tips_screen.dart';
  import 'package:appunificada/screens/todoTasks/todo_tasks_screen.dart';
  import 'package:appunificada/widgets/custom_menu.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';

  class MenuScreen extends StatelessWidget {
    const MenuScreen({super.key});

    @override
    Widget build(BuildContext context) {
      final pageController = PageController();

      return Scaffold(
        body: Stack(
          children: [
            PageViewScreen(pageController: pageController),
            _MenuLocation(pageController: pageController),
          ],
        ),
      );
    }
  }

  class _MenuLocation extends StatelessWidget {
    final PageController pageController;

    const _MenuLocation({required this.pageController});

    @override
    Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width;
      final mostrar = Provider.of<MenuNavigatorModel>(context).mostrar;

      return Positioned(
        bottom: 30,
        child: SizedBox(
          width: width,
          child: Align(
            child: MenuApp(
              mostrar: mostrar,
              items: [
                MenuButton(
                  onPressed: () {
                    pageController.jumpToPage(0);
                  },
                  icon: Icons.search,
                ),
                MenuButton(
                  onPressed: () {
                    pageController.jumpToPage(1);
                  },
                  icon: Icons.notifications,
                ),
                MenuButton(
                  onPressed: () {
                    pageController.jumpToPage(2);
                  },
                  icon: Icons.supervised_user_circle,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  class PageViewScreen extends StatelessWidget {
    final PageController pageController;

    const PageViewScreen({super.key, required this.pageController});

    @override
    Widget build(BuildContext context) {
      return PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          TipsScreen(),
          TaskListScreen(),  
          SearchScreen(),
        ],
      );
    }
  }
