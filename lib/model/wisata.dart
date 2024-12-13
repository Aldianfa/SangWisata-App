class GetWisata {}

class Wisata {
  int id;
  String nama;
  String lokasi;
  String deskripsi;
  String foto1;
  String foto2;
  String tiket;

  Wisata(
      {required this.id,
      required this.nama,
      required this.lokasi,
      required this.deskripsi,
      required this.foto1,
      required this.foto2,
      required this.tiket});

  factory Wisata.fromJson(Map<String, dynamic> json) {
    return Wisata(
        id: int.parse(json['id'].toString()),
        nama: json['nama'],
        lokasi: json['lokasi'],
        deskripsi: json['deskripsi'],
        foto1: json['foto1'],
        foto2: json['foto2'],
        tiket: json['tiket']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'lokasi': lokasi,
      'deskripsi': deskripsi,
      'foto1': foto1,
      'foto2': foto2,
      'tiket': tiket
    };
  }
}
