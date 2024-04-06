import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify_application/data/models/getPlayer_model.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';
import 'package:sportify_application/utils/style.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';
import '../widget/player_widget.dart';
import '../data/models/team_model.dart';

class players_screen extends StatefulWidget {
  List<Player> players;
  int teamKey;
  players_screen({super.key, required this.players, required this.teamKey});

  @override
  State<players_screen> createState() => _players_screenState();
}

class _players_screenState extends State<players_screen> {
  List<Player> displayedList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedList = List.from(widget.players); // Start with the original list
  }

  void filterList(String query) {
    if (query.isEmpty) {
      setState(() {
        displayedList = List.from(
            widget.players); // If search is empty, show the original list
      });
    } else {
      setState(() {
        for (var player in widget.players) {
          if (player.playerName.toLowerCase().contains(query.toLowerCase())) {
            displayedList.clear();
            displayedList.add(player);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sportify',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFA1C398),
      ),
      drawer: drawer(context),
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
                  style: GoogleFonts.poppins(fontSize: 15),
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
                    // Calling function to search in API
                  },
                ),
              ),
            ),
            for (int i = 0; i < displayedList.length; i++)
              players(
                  _screen,
                  context,
                  displayedList[i].playerImage,
                  displayedList[i].playerName,
                  displayedList[i].playerType,
                  displayedList[i].playerKey,
                  widget.teamKey),
          ],
        ),
      ),
    );
  }
}
