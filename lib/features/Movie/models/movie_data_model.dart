// ignore_for_file: public_member_api_docs, sort_constructors_first
// este modelo eu vou utilizar EM TODA a aplicação

class MovieDataModel {
  final String id;
  final String title;
  final String genre;
  final String time;
  final String urlImage;

  MovieDataModel({
    required this.id,
    required this.title,
    required this.genre,
    required this.time,
    required this.urlImage,
  });
}
