import 'package:dio/dio.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/book_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/bool_list_by_user_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/delete_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/ui/models/book_models/update_book_model.dart';
import 'package:nusantara_infrastructure_pre_screen_test/utils/constant/url.dart';

class BookServices {
  static final Dio _dio = Dio();

  static Map<String, String> head = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<BooksList?> getAllBooks({
    required String token,
  }) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        Url.baseUrl + Url.books,
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return BooksList.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<BookById?> getBookById({
    required String token,
    required int id,
  }) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.get(
        "${Url.baseUrl}${Url.books}/$id",
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return BookById.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<Deleted?> deleteBookById({
    required String token,
    required int id,
  }) async {
    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.delete(
        "${Url.baseUrl}${Url.books}/$id",
        options: Options(headers: head),
      );
      if (response.statusCode == 200) {
        return Deleted.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<BookUpdate?> addBook({
    required String token,
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String publishedDate,
    required String publisher,
    required int pages,
    required String description,
    required String website,
  }) async {
    Map<String, dynamic> data = {
      "isbn": isbn,
      "title": title,
      "subtitle": subtitle,
      "author": author,
      "published": publishedDate,
      "publisher": publisher,
      "pages": pages,
      "description": description,
      "website": website
    };

    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.post(
        '${Url.baseUrl}${Url.books}/add',
        options: Options(headers: head),
        data: data,
      );
      if (response.statusCode == 200) {
        return BookUpdate.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<BookUpdate?> editBook({
    required String token,
    required int bookId,
    required String isbn,
    required String title,
    required String subtitle,
    required String author,
    required String publishedDate,
    required String publisher,
    required int pages,
    required String description,
    required String website,
  }) async {
    Map<String, dynamic> data = {
      "isbn": isbn,
      "title": title,
      "subtitle": subtitle,
      "author": author,
      "published": publishedDate,
      "publisher": publisher,
      "pages": pages,
      "description": description,
      "website": website
    };

    try {
      _dio.options.headers['Authorization'] = "Bearer $token";
      Response response = await _dio.put(
        '${Url.baseUrl}${Url.books}/$bookId/edit',
        options: Options(headers: head),
        data: data,
      );
      if (response.statusCode == 200) {
        return BookUpdate.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
