import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify_application/utils/style.dart';
import '../data/models/getPlayer_model.dart';
import '../data/repositories/getPlayer_repo.dart';

class playerInfo extends StatefulWidget {
  int player_key;
  String player_teamKey;
  playerInfo({required this.player_key, required this.player_teamKey});
  @override
  _playerInfo createState() => _playerInfo();
}

class _playerInfo extends State<playerInfo>
    with SingleTickerProviderStateMixin {
  late PlayerModel? playerInfo;
  late TabController _tabController;
  late PlayerResult result_playerInfo = PlayerResult.empty();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getUpdates();
  }

  getUpdates() async {
    setState(() {
      isLoading = true;
    });
    playerInfo = await GetPlayerRepo().getPlayer(widget.player_key);
    List<PlayerResult> playerList = playerInfo!.result;
    for (var player in playerList) {
      if (player.teamKey == widget.player_teamKey) {
        result_playerInfo = player;
        break;
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;

    return Container(
      height: _screensize.height * 0.8,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Player Info",
                style: text_style3,
              ),
              Spacer(), // Use Spacer to push the InkWell to the right
              InkWell(
                onTap: () {
                  shareApp(
                      result_playerInfo.playerName, result_playerInfo.teamName);
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 161, 195, 152),
                  ),
                  child: Icon(
                    Icons.ios_share,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          line,
          SizedBox(height: 10),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 1, 19,
                          33))) // Show progress indicator while loading
              : Container(
                  height: _screensize.height * 0.25,
                  width: _screensize.width * 0.95,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(result_playerInfo
                          .playerImage), // Use result_playerInfo directly
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
          SizedBox(height: 10),
          TabBar(
            indicatorColor: Color.fromARGB(255, 250, 112, 112),
            labelColor: Color.fromARGB(255, 250, 112, 112),
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.sports_soccer)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                InformationTab(result_playerInfo),
                StatsTab(result_playerInfo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> shareApp(String playerName, String playerClub) async {
  await FlutterShare.share(
      title: 'Player Info',
      text: "Name of player $playerName\nPlay in $playerClub.");
}

class InformationTab extends StatelessWidget {
  PlayerResult result_playerInfo;
  InformationTab(this.result_playerInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.getFont("League Spartan",
                  color: Color.fromARGB(255, 1, 19, 33), fontSize: 20),
              children: [
                TextSpan(
                  text: 'Name:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${result_playerInfo.playerName}\n\n'),
                TextSpan(
                  text: 'Number:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${result_playerInfo.playerNumber}\n\n'),
                TextSpan(
                  text: 'Country:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${result_playerInfo.playerCountry}\n\n'),
                TextSpan(
                  text: 'Age:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${result_playerInfo.playerAge} \n'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatsTab extends StatelessWidget {
  PlayerResult result_playerInfo;

  StatsTab(this.result_playerInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Row(children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.getFont("League Spartan",
                  color: Color.fromARGB(255, 1, 19, 33),
                  fontSize: 20), // Adjust line height here
              children: [
                TextSpan(
                  text: 'Position:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' ${result_playerInfo.playerType}\n\n',
                ),
                TextSpan(
                  text: 'Yellow Cards:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' ${result_playerInfo.playerYellowCards}\n\n',
                    style: TextStyle(color: Colors.yellow)),
                TextSpan(
                  text: 'Red Cards:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: ' ${result_playerInfo.playerRedCards}\n\n',
                    style: TextStyle(color: Colors.red)),
                TextSpan(
                  text: 'Goals:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' ${result_playerInfo.playerGoals}\n\n',
                ),
                TextSpan(
                  text: 'Assists:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' ${result_playerInfo.playerAssists}',
                ),
              ],
            ),
          )
        ]));
  }
}
