class Quote {
  int id;
  late final String quote;
  late final String type;

  Quote({
    required this.id,
    required this.quote,
    required this.type,
  });

  factory Quote.fromMap({required Map<String, dynamic> data}) {
    return Quote(
      id: data['Id'],
      quote: data['Name'],
      type: data['type'],
    );
  }
}
