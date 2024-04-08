import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportify_application/data/models/countries_model.dart';
import 'package:sportify_application/data/repositories/country_api_servie.dart';
import 'package:sportify_application/screens/leagues_screen.dart';
import 'package:sportify_application/widget/DrawerScreen.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<Country> countries = [];
  int? currentCountryIndex;
  final ScrollController _scrollController = ScrollController();
  TextEditingController _searchController = TextEditingController();
  List<Country> allCountries = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      final countryData = CountryData();
      final fetchedCountries = await countryData.fetchCountries();
      setState(() {
        countries = fetchedCountries;
        allCountries = List.of(fetchedCountries); // Create a copy of the list
      });
    } catch (e) {
      print('Failed to fetch countries: $e');
      // Handle error
    }
  }

  void _onSearchTextChanged() {
    String searchText = _searchController.text.toLowerCase();
    List<Country> filteredCountries = searchText.isEmpty
        ? List.of(
            allCountries) // Use the unfiltered list if search text is empty
        : allCountries.where((country) {
            return country.countryName.toLowerCase().contains(searchText);
          }).toList();

    setState(() {
      countries = filteredCountries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text(
            'Sportify',
            style: TextStyle(color: Colors.black, fontFamily: "SportsWorld"),
          ),
          backgroundColor: Color(0xFFA1C398), // Set AppBar color to A1C398
          centerTitle: true,
        ),
        drawer: drawer(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: const Color.fromARGB(45, 158, 158, 158),
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFFA1C398),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Riyadh, Saudi Arabia',
                      style: GoogleFonts.getFont("Rubik",
                          fontSize: 14,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextField(
                controller: _searchController,
                cursorColor: Colors.black,
                style: GoogleFonts.poppins(fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search for a country',
                  focusColor: Colors.black,
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(bottom: 8, left: 20, top: 8),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA1C398)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  final isCurrentCountry = index == currentCountryIndex;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LeaguesScreen(countryKey: country.countryKey),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          country.countryLogo != null
                              ? Image.network(
                                  country.countryLogo!,
                                  width: 70,
                                  height: 45,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                ),
                          SizedBox(height: 10),
                          Text(
                            country.countryName,
                            style: GoogleFonts.getFont(
                              "Rubik",
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
