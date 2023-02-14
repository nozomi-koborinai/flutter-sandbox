/// ※ ミュータブル/イミュータブルを確認したいので、フィールドは再代入可能、メソッドにはcopyWithをあえて用意している
class Book {
  Book({required this.id, required this.name});
  String id;
  String name;

  Book copyWith({String? id, String? name}) => Book(
        id: id ?? this.id,
        name: name ?? this.name,
      );
}
