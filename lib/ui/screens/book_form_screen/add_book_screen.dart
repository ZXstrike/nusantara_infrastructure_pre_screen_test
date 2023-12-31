import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/controllers/add_book_controller.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/custom_button.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  AddBookController pageController = Get.put(AddBookController());

  @override
  void initState() {
    super.initState();

    pageController.context = context;
  }

  @override
  void dispose() {
    super.dispose();

    pageController.isbnController.clear();
    pageController.titleController.clear();
    pageController.subtitleController.clear();
    pageController.authorController.clear();
    pageController.publishedController.clear();
    pageController.publisherController.clear();
    pageController.pagesController.clear();
    pageController.descController.clear();
    pageController.websiteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Book'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                controller: pageController.isbnController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('ISBN'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.titleController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Title'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.subtitleController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('SubTitle'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.authorController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Author'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.publishedController,
                onTap: pageController.datePicker,
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Published'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.publisherController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Publisher'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.pagesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Pages'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.descController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Description'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: pageController.websiteController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text('Website'),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<AddBookController>(
                builder: (controller) => ButtonSpace(
                  boxColor: controller.isLoading ? Colors.white : Colors.grey,
                  onPressed: pageController.addBook,
                  child: const Text(
                    'Add',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
