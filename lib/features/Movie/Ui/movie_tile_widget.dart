// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moviescreen1/features/model/MovieModel.dart';



// modelo de um bloco esepcifico, neste exemplo é o widget de somente um bloco de filme especifico
class MovieItemWidget extends StatelessWidget {
  final MovieModel movieModel;

  const MovieItemWidget({
    Key? key,
    required this.movieModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         // imagem
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(movieModel.urlImage))),
          ), 
              const SizedBox(height: 20,),
              // Titulo
              Text(movieModel.title, style: TextStyle(),),

              // genero especifico
              
              Text(movieModel.genre, style: TextStyle(),),

              // tempo

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(movieModel.time, style: TextStyle(),),
              Row(
                children: [Icon(Icons.favorite)],
              )
            ],
           )


        ],
      ), 
  
     
      



     
    );
  }
}
