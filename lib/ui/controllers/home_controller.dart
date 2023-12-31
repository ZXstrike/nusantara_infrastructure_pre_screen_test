import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_infrastructure_pre_screen_test/services/book_services.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/bool_list_by_user_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/delete_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/widgets/book_detail_card.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/sp_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List<Datum> bookList = [];

  late BuildContext context;

  void getAllBook() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(SPKey.token);
    if (token != null) {
      BooksList? data = await BookServices.getAllBooks(token: token);
      bookList = data!.data;
    } else {
      goToLogin();
    }
    update();
  }

  void bottomNav(BuildContext context, int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  void goToAddBook() {
    Navigator.pushNamed(context, '/addbook').then((value) => onRefresh());
  }

  Future<void> onRefresh() async {
    bookList.clear();
    getAllBook();
  }

  void goToEdit(Datum data) {
    Navigator.pushNamed(context, '/editbook', arguments: data)
        .then((value) => onRefresh());
  }

  void openDetail(Datum data) {
    showDialog(
      context: context,
      builder: (context) {
        return BookDetailCard(
          title: data.title,
          data: '''
Id : ${data.id}
ISBN : ${data.isbn}
UserId : ${data.userId}
Tittle : ${data.title}
Subtittle : ${data.subtitle}
Author : ${data.author}
Published at : ${data.published.day}-${data.published.month}-${data.published.year}
Publisher : ${data.publisher}
Pages : ${data.pages}
Description : ${data.description}
Website : ${data.website}
Created at : ${data.createdAt.day}-${data.createdAt.month}-${data.createdAt.year}
Updated at : ${data.updatedAt.day}-${data.updatedAt.month}-${data.updatedAt.year}
''',
          deleteAction: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            String? token = sp.getString(SPKey.token);
            Deleted? delete =
                await BookServices.deleteBookById(token: token!, id: data.id);
            if (delete != null) {
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              bookList.clear();
              getAllBook();
            }
          },
          editAction: () {
            Navigator.pop(context);
            goToEdit(data);
          },
        );
      },
    );
  }

  void goToLogin() {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
