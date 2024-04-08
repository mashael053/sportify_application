import 'package:flutter/material.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';
import 'package:sportify_application/widget/player_widget.dart';
import 'package:sportify_application/data/models/team_model.dart';

class PlayersScreen extends StatefulWidget {
  final List<Player> players;
  final int teamKey;

  const PlayersScreen({Key? key, required this.players, required this.teamKey})
      : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  List<Player> displayedList = [];
  TextEditingController searchController = TextEditingController();
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    displayedList = List.from(widget.players); // Start with the original list
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void filterList(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedList = List.from(
            widget.players); // If search is empty, show the original list
      });
    } else {
      setState(() {
        displayedList.clear(); // Clear the displayed list before filtering
        for (var player in widget.players) {
          if (player.playerName.toLowerCase().contains(query.toLowerCase())) {
            displayedList.add(player); // Add filtered players to displayedList
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'Sportify',
            style: TextStyle(color: Colors.black, fontFamily: "SportsWorld"),
          ),
          backgroundColor: Color(0xFFA1C398),
          centerTitle: true,
        ),
        drawer: drawer(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: searchController,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.black,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(bottom: 8, left: 20, top: 8),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          filterList('');
                        },
                      ),
                      hintText: 'Search for a player',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onEditingComplete: () {
                      filterList(searchController.text);
                    },
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: displayedList.length,
                itemBuilder: (context, index) {
                  return FadeTransition(
                    opacity: _animation,
                    child: players(
                      MediaQuery.of(context).size,
                      context,
                      displayedList[index].playerImage,
                      displayedList[index].playerName,
                      displayedList[index].playerType,
                      displayedList[index].playerKey,
                      widget.teamKey,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
