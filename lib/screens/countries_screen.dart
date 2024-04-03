import 'package:flutter/material.dart';
import 'package:sportify_application/data/models/countries_model.dart';
import 'package:sportify_application/data/repositories/country_api_servie.dart';
import 'package:sportify_application/screens/leagues_screen.dart';
import 'package:sportify_application/section2/DrawerScreen.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<Country> countries = [];
  int? currentCountryIndex;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> fetchCountries() async {
    try {
      final countryData = CountryData();
      final fetchedCountries = await countryData.fetchCountries();
      setState(() {
        countries = fetchedCountries;
      });
    } catch (e) {
      print('Failed to fetch countries: $e');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sportify', style: TextStyle(color: Colors.black),),
        backgroundColor: Color(0xFFA1C398), // Set AppBar color to A1C398
        centerTitle: true,
      ),
      drawer: Drawer(
        child: drawer(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding:  EdgeInsets.all(16.0),
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
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                
              ],
            ),
          ),

                  SizedBox(
            height: 10,
        
          ),
Container(
  height: 60,
  width: 320,
  child: TextField(
    decoration: InputDecoration(
      labelText: 'Search for a country',
      suffixIcon: Icon(Icons.search),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38),
        borderRadius: BorderRadius.circular(20),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
),
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(10.0),
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
                           builder: (context) => LeaguesScreen(countryKey: country.countryKey),
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
                          offset: Offset(0, 3), // changes position of shadow
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
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}