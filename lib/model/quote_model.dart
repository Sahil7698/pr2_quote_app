class Quote {
  int id;
  String quote;
  String type;

  Quote({
    required this.id,
    required this.quote,
    required this.type,
  });

  factory Quote.fromMap({required Map<String, dynamic> data}) {
    return Quote(
      id: data['Id'],
      quote: data['quote'],
      type: data['type'],
    );
  }
}
