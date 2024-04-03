class Team {
  final int teamKey;
  final String teamName;
  final String teamLogo;

  Team({
    required this.teamKey,
    required this.teamName,
    required this.teamLogo,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamKey: json['team_key'],
      teamName: json['team_name'],
      teamLogo: json['team_logo'],
    );
  }
}
