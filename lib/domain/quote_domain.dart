class QuoteDomain {
  int id;
  String quote;
  String author;

  QuoteDomain({required this.id, required this.quote, required this.author});

  QuoteDomain.initial() : this(id: 0, quote: 'Yep', author: 'Me');

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'quote': this.quote,
      'author': this.author,
    };
  }

  factory QuoteDomain.fromMap(Map<String, dynamic> map) {
    return QuoteDomain(
      id: map['id'] as int,
      quote: map['quote'] as String,
      author: map['author'] as String,
    );
  }
}
