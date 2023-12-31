import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController pageController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    pageController.context = context;
    pageController.getAllBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: pageController.goToAddBook,
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return RefreshIndicator(
            onRefresh: pageController.onRefresh,
            child: ListView.builder(
              itemCount: controller.bookList.length,
              itemBuilder: (context, index) {
                final bookData = controller.bookList[index];

                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(bookData.title),
                  subtitle: Text(bookData.subtitle),
                  onTap: () => pageController.openDetail(bookData),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Profile')
        ],
        onTap: (value) => pageController.bottomNav(context, value),
      ),
    );
  }
}
