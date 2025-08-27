class ServicesIOffer {
  final String id;
  final String title;
  final String iconUrl;
  final String description;

  // Constructor
  ServicesIOffer({
    required this.id,
    required this.title,
    required this.iconUrl,
    required this.description,
  });

  // Convert object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'iconUrl': iconUrl,
      'description': description,
    };
  }

  // Create object from Map
  factory ServicesIOffer.fromMap(Map<String, dynamic> map) {
    return ServicesIOffer(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      iconUrl: map['iconUrl'] ?? '',
      description: map['description'] ?? '',
    );
  }
}