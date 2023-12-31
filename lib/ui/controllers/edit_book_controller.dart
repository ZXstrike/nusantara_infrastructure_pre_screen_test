import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nusantara_infrastructure_pre_screen_test/services/book_services.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/bool_list_by_user_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/update_book_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditBookController extends GetxController {
  late BuildContext context;

  TextEditingController isbnController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController publishedController = TextEditingController();
  TextEditingController publisherController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  late Datum bookData;

  bool isLoading = false;

  void showData() {
    DateFormat format = DateFormat('yyyy-MM-dd');
    String dateString = format.format(bookData.published);
    isbnController.text = bookData.isbn;
    titleController.text = bookData.title;
    subtitleController.text = bookData.subtitle;
    authorController.text = bookData.author;
    publishedController.text = dateString;
    publisherController.text = bookData.publisher;
    pagesController.text = bookData.pages.toString();
    descController.text = bookData.description;
    websiteController.text = bookData.website;
  }

  void editBook() async {
    if (!isLoading) {
      isLoading = true;
      update();
      SharedPreferences sp = await SharedPreferences.getInstance();
      String? token = sp.getString(SPKey.token);
      if (token != null) {
        BookUpdate? data = await BookServices.editBook(
          token: token,
          bookId: bookData.id,
          isbn: isbnController.text,
          title: titleController.text,
          subtitle: subtitleController.text,
          author: authorController.text,
          publishedDate: publishedController.text,
          publisher: publisherController.text,
          pages: int.parse(pagesController.text),
          description: descController.text,
          website: websiteController.text,
        );
        if (data != null) {
          popScreen();
        }
      }
    }
    isLoading = false;
    update();
  }

  void datePicker() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime((DateTime.now().year + 5)),
    );

    if (selectedDate != null) {
      publishedController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  void popScreen() {
    Navigator.pop(context);
  }
}
