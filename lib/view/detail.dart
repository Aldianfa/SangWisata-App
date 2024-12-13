import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  int? id;
  String? nama;
  String? lokasi;
  String? deskripsi;
  String? foto1;
  String? foto2;
  String? tiket;

  DetailView(
      {Key? key,
      required this.id,
      required this.nama,
      required this.lokasi,
      required this.deskripsi,
      required this.foto1,
      required this.foto2,
      required this.tiket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 18, 66, 91),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Wisata',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Color.fromARGB(255, 165, 97, 62),
              color: Colors.white,
              fontFamily: 'Poppins'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(foto1!), fit: BoxFit.cover)),
              ),
              Container(
                width: width,
                margin: EdgeInsets.only(top: height * 0.5),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    // add icon location and text location
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              lokasi!,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow
                                  .visible, // Make sure the text is visible
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Text(
                      deskripsi!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                      ),
                      // textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Harga',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              tiket!,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 55, 140, 252),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                              backgroundColor:
                                  Color.fromARGB(255, 236, 91, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          child: Text(
                            'Beli Tiket',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
