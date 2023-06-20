import "dart:convert";
import "dart:io";

import "package:flutter/material.dart";
import "package:stream/views/DrawerStream.dart";
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> itemList = [];
  List<String> Movies = [];

  List<String> IDYear = [];
  List<String> IDTop = [];
  List<String> IDRating = [];

  List<String> type = [
    "all",
    "Action",
    "Horror",
    "Carton",
    "Fantasiy",
    "Zombie"
  ];
  List<String> years = [];
  List<int> year = [];
  List<String> Rating = [];
  List<double> rating = [];
  List<String> filterByYears = [];
  List<String> filterByRating = [];

  getTopMovies() async {
    try {
      Uri url =
          Uri.parse("https://imdb-api.com/en/API/Top250Movies/k_u6t92qno");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var JsonM = json.decode(response.body)['items'];
        itemList = [];
        for (dynamic item in JsonM) {
          Map<String, dynamic> itemMap = Map<String, dynamic>.from(item);
          itemList.add(itemMap);
        }

        setState(() {
          for (var i = 0; i < 100; i++) {
            Movies.add(itemList[i]['image']);
            IDTop.add(itemList[i]['id']);
          }
          for (var i = 0; i < 100; i++) {
            if (!years.contains(itemList[i]['year'])) {
              years.add(itemList[i]['year']);
            }
          }
          year = years.map((str) => int.parse(str)).toList();
          year.sort((a, b) => b.compareTo(a));

          for (var i = 0; i < 100; i++) {
            if (!Rating.contains(itemList[i]['imDbRating'])) {
              Rating.add(itemList[i]['imDbRating']);
            }
          }
          rating = Rating.map((str) => double.parse(str)).toList();
          print(Rating);
          rating.sort((a, b) => b.compareTo(a));
          print(Rating);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  getMoviesByRating(String r) async {
    try {
      Uri url =
          Uri.parse("https://imdb-api.com/en/API/Top250Movies/k_u6t92qno");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var JsonM = json.decode(response.body)['items'];
        List<Map<String, dynamic>> itemList = [];
        for (dynamic item in JsonM) {
          Map<String, dynamic> itemMap = Map<String, dynamic>.from(item);
          itemList.add(itemMap);
        }

        setState(() {
          filterByRating = [];
          for (var i = 0; i < 100; i++) {
            if (itemList[i]['imDbRating'] == r) {
              filterByRating.add(itemList[i]['image']);
              IDRating.add(itemList[i]['id']);
            }
          }
          print(filterByRating);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  getMoviesByYear(String y) async {
    try {
      Uri url =
          Uri.parse("https://imdb-api.com/en/API/Top250Movies/k_u6t92qno");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var JsonM = json.decode(response.body)['items'];
        List<Map<String, dynamic>> itemList = [];
        for (dynamic item in JsonM) {
          Map<String, dynamic> itemMap = Map<String, dynamic>.from(item);
          itemList.add(itemMap);
        }

        setState(() {
          filterByYears = [];
          for (var i = 0; i < 100; i++) {
            if (itemList[i]['year'] == y) {
              filterByYears.add(itemList[i]['image']);
              IDYear.add(itemList[i]['id']);
            }
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  /* SearchMovie(String search)async{
    try {
      Uri url =
          Uri.parse("https://imdb-api.com/en/API/Top250Movies/k_u6t92qno");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var JsonM = json.decode(response.body)['items'];
        itemList = [];
        for (dynamic item in JsonM) {
          Map<String, dynamic> itemMap = Map<String, dynamic>.from(item);
          itemList.add(itemMap);
        }

        setState(() {
          
        });
      }
    } catch (e) {
      print(e);
    }
    
  } */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTopMovies();
    getMoviesByYear("2019");
    getMoviesByRating("9.0");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
        endDrawer: const DrawerStream(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 80,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("Hi,othman !",
                style: TextStyle(
                  fontSize: 15.0,
                )),
          ),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/bg.png"),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                      child: Center(
                        child: TextField(
                          controller: searchController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              hintText: "Searsh",
                              hintStyle: const TextStyle(color: Colors.black45),
                              focusColor: Colors.black,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    print(searchController.text);
                                  },
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                              border: InputBorder.none,
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text("Top 100",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ),
                ),

                ///Recent ******************************************************
                Container(
                    height: MediaQuery.of(context).size.height / 1.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                      child: ListView.builder(
                          itemCount: Movies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.8,
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      Movies[index],
                                      fit: BoxFit.fill,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),

                //Fillter
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: rating.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: GestureDetector(
                            onTap: () =>
                                getMoviesByRating(rating[index].toString()),
                            child: Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "${rating[index]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 20, 20),
                      child: ListView.builder(
                          itemCount: filterByRating.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 1.8,
                                  width:
                                      MediaQuery.of(context).size.width / 3.2,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      filterByRating[index],
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )),

                //Fillter2
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: year.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              getMoviesByYear("${year[index]}");
                            },
                            child: Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  " ${year[index]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 20, 20),
                      child: Center(
                        child: ListView.builder(
                            itemCount: filterByYears.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        1.8,
                                    width:
                                        MediaQuery.of(context).size.width / 3.2,
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: Image.network(
                                            filterByYears[index],
                                            fit: BoxFit.fill,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(Colors.white),
                                                ),
                                              );
                                            },
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(Icons.error);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
