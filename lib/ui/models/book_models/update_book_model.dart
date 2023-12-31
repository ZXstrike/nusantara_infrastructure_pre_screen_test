
class BookUpdate {
    String message;
    Book book;

    BookUpdate({
        required this.message,
        required this.book,
    });

    factory BookUpdate.fromJson(Map<String, dynamic> json) => BookUpdate(
        message: json["message"],
        book: Book.fromJson(json["book"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "book": book.toJson(),
    };
}

class Book {
    int id;
    int userId;
    String isbn;
    String title;
    String subtitle;
    String author;
    DateTime published;
    String publisher;
    int pages;
    String description;
    String website;
    DateTime createdAt;
    DateTime updatedAt;

    Book({
        required this.id,
        required this.userId,
        required this.isbn,
        required this.title,
        required this.subtitle,
        required this.author,
        required this.published,
        required this.publisher,
        required this.pages,
        required this.description,
        required this.website,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        userId: json["user_id"],
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: DateTime.parse(json["published"]),
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published.toIso8601String(),
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
