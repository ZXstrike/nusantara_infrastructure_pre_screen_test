import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/controllers/edit_book_controller.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/bool_list_by_user_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/custom_button.dart';

class EditBookScreen extends StatefulWidget {
  const EditBookScreen({super.key, required this.data});

  final Datum data;

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  EditBookController pageController = Get.put(EditBookController());

  @override
  void initState() {
    super.initState();

    pageController.context = context;
    pageController.bookData = widget.data;
    pageController.showData();
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
        title: const Text('Edit Book'),
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
            GetBuilder<EditBookController>(
              builder: (controller) => ButtonSpace(
                boxColor: controller.isLoading ? Colors.white : Colors.grey,
                onPressed: pageController.editBook,
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
