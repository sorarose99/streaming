///Local player, source control switch

class PlayContr {
  bool open;

  PlayContr({required this.open});

  PlayContr.fromJson(Map<String, dynamic> json) : open = json['open'];
}
