import "package:flutter/material.dart";
import "package:stream/views/DrawerStream.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<String> Movies = [
      "https://th.bing.com/th/id/OIP.QewGmxQBicPMq076W1DrrgHaJQ?pid=ImgDet&rs=1",
      "https://th.bing.com/th/id/R.0daf73d3471efc7ae0392b9255773ee9?rik=qGwJaT3N3GkAgg&riu=http%3a%2f%2fwww.movienewz.com%2fwp-content%2fuploads%2f2019%2f03%2favengers-endgame-movie-poster-2.jpg&ehk=4Md9OxRYgoJNzxe%2fk0w9zSF%2fuHcUwaGSRyNdp%2bLIAIc%3d&risl=&pid=ImgRaw&r=0",
      "https://moviereviewmom.com/wp-content/uploads/2019/03/Captain-Marvel-movie-poster.jpg",
      "https://vignette4.wikia.nocookie.net/thehundred/images/4/4f/The_100_SDCC_Promo.jpg/revision/latest?cb=20150612151124"
    ];

    List<String> type = [
      "all",
      "Action",
      "Horror",
      "Carton",
      "Fantasiy",
      "Zombie"
    ];
    List<String> years = ["2023", "2022", "2021", "2020", "2019", "2018"];

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
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            hintText: "Searsh",
                            hintStyle: TextStyle(color: Colors.black45),
                            focusColor: Colors.black,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text("Recent",
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
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          Movies[index],
                                        ),
                                        fit: BoxFit.fill,
                                      )),
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
                      itemCount: type.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                type[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                                      MediaQuery.of(context).size.width / 3.2,
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          Movies[index],
                                        ),
                                        fit: BoxFit.fill,
                                      )),
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
                      itemCount: years.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Container(
                            height: 10,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                years[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            itemCount: Movies.length,
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
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            Movies[index],
                                          ),
                                          fit: BoxFit.fill,
                                        )),
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
