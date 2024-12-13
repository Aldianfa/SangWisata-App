import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sangwisata3/model/wisata.dart';
import 'package:sangwisata3/view/detail.dart';
import 'package:sangwisata3/view/detail2.dart';
import 'package:sangwisata3/view/profile.dart';
import 'package:sangwisata3/viewmodel/wisata_controller.dart';

class DashboardView extends StatelessWidget {
  final User user;
  const DashboardView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // background color use hex
        backgroundColor: Color.fromARGB(255, 18, 66, 91),
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Sang Wisata',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Color.fromARGB(255, 165, 97, 62),
              color: Colors.white,
              fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Color.fromARGB(255, 18, 66, 91),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Gresik, Indonesia',
                      // user.displayName.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/img/banner2.png',
                  width: 380,
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 2,
                margin: EdgeInsets.all(5),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Features",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView(user: user)),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(15, 16, 4, 5),
                          padding: EdgeInsets.all(5),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.blue.shade200, width: 2),
                              borderRadius: BorderRadius.circular(14),
                              color: Color.fromARGB(255, 230, 241, 255)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 36, 84, 148),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 36, 84, 148)),
                              )
                            ],
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 4, 5),
                        padding: EdgeInsets.all(5),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.blue.shade200, width: 2),
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 254, 242, 225)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.map_sharp,
                              color: Color.fromARGB(255, 224, 159, 67),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text("Maps",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 224, 159, 67),
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 4, 5),
                        padding: EdgeInsets.all(5),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.blue.shade200, width: 2),
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 253, 226, 233)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.newspaper_rounded,
                              color: Color.fromARGB(255, 191, 54, 90),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Artikel",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 191, 54, 90)),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 4, 5),
                        padding: EdgeInsets.all(5),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.blue.shade200, width: 2),
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 224, 247, 220)),
                        child: Column(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Color.fromARGB(255, 63, 160, 46),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Food",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 63, 160, 46)),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "List Wisata",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                child: FutureBuilder<List<Wisata>>(
                  future: WisataController.fetchWisata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailView2(
                                              id: snapshot.data![index].id,
                                              nama: snapshot.data![index].nama,
                                              lokasi:
                                                  snapshot.data![index].lokasi,
                                              deskripsi:
                                                  snapshot.data![index].deskripsi,
                                              foto1: snapshot.data![index].foto1,
                                              foto2: snapshot.data![index].foto2,
                                              tiket: snapshot.data![index].tiket,
                                            )));
                              },
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                elevation: 2,
                                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0)),
                                      child: Image.network(
                                        snapshot.data![index].foto1,
                                        width: double
                                            .infinity, // Ensure the image takes up the full width of the Card
                                        height:
                                            200, // You can adjust the height as necessary
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(snapshot.data![index].nama, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                      subtitle:
                                          Text(snapshot.data![index].lokasi, style: TextStyle(color: Colors.grey, fontSize: 12),),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    }
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
