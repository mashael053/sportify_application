import 'package:flutter/material.dart';
import 'package:sportify_application/screens/players_screen.dart';

String teamk = "96";
List<Map<String, dynamic>> players_ex = [
  {
    "player_key": 3063582184,
    "player_name": "F. Israel",
    "player_number": "45",
    "player_country": null,
    "player_type": "Goalkeepers",
    "player_age": "21",
    "player_match_played": "0",
    "player_goals": "0",
    "player_yellow_cards": "0",
    "player_red_cards": "0",
    "player_image":
        "https://apiv2.allsportsapi.com/logo/players/79274_f-israel.jpg"
  },
  {
    "player_key": 41841276,
    "player_name": "M. Perin",
    "player_number": "",
    "player_country": null,
    "player_type": "Goalkeepers",
    "player_age": "",
    "player_match_played": "",
    "player_goals": "",
    "player_yellow_cards": "",
    "player_red_cards": "",
    "player_image":
        "https://apiv2.allsportsapi.com/logo/players/472_m-perin.jpg"
  }
];

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("wefjnwke"),
        onPressed: () {
          print("done");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      players_screen(players: players_ex, teamKey: teamk)));
          print("done");
        },
      )),
    );
  }
}
