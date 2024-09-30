class IPTVChannel {
  final String id;
  final String name;
  final String url;

  IPTVChannel({required this.id, required this.name, required this.url});

  factory IPTVChannel.fromJson(Map<String, dynamic> json) {
    return IPTVChannel(
      id: json['id'],
      name: json['name'],
      url: json['url'], // Adjust the field name if needed
    );
  }
}
