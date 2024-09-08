// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:moviescreen1/features/Movie/bloc/movie_bloc.dart';
import 'package:moviescreen1/features/favorite/bloc/favorite_bloc.dart';
import 'package:moviescreen1/features/model/MovieModel.dart';

// modelo de um bloco esepcifico, neste exemplo é o widget de somente um bloco de filme especifico
class MovieItemWidget extends StatelessWidget {
  final MovieModel movieModel;
  final MovieBloc movieBloc;

  const MovieItemWidget({
    Key? key,
    required this.movieModel,
    required this.movieBloc,
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
                children: [IconButton(onPressed: (){movieBloc.add(HomeMoviesFavoriteButtonClickedEvent(clickedMovie: movieModel));} , icon: Icon(Icons.favorite))],
              )
            ],
           )


        ],
      ), 
  
     
      



     
    );
  }
}
