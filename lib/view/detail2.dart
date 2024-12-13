import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class DetailView2 extends StatelessWidget {
  int? id;
  String? nama;
  String? lokasi;
  String? deskripsi;
  String? foto1;
  String? foto2;
  String? tiket;

  DetailView2(
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
            'Detail Wisata 2',
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
            // width: width,
            child: Column(
              children: [
                // Container(
                //   height: height * 0.55,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: NetworkImage(foto1!), fit: BoxFit.cover)),
                // ),
                Container(
                  child: FanCarouselImageSlider.sliderType1(
                    imagesLink: [
                      foto1!,
                      foto2!,
                    ],
                    isAssets: false,
                    autoPlay: false,
                    sliderHeight: 300,
                    currentItemShadow: const [],
                    sliderDuration: const Duration(milliseconds: 200),
                    imageRadius: 10.0,
                    slideViewportFraction: 1.2,
                    showIndicator: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: width,
                  // margin: EdgeInsets.only(top: height * 0.5),
                  padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
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
                      SizedBox(height: 20),
                      Text(
                        deskripsi!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 20),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Harga',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              tiket!,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 236, 91, 60),
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
                ),
              ],
            ),
          ),
        ));
  }
}
