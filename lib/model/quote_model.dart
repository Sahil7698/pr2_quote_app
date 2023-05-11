class Quote {
  int? id;
  late final String quote;

  Quote({
    this.id,
    required this.quote,
  });

  factory Quote.fromMap({required Map<String, dynamic> data}) {
    return Quote(
      id: data['Id'],
      quote: data['Name'],
    );
  }
}
