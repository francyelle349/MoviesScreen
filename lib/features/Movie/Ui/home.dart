import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviescreen1/features/Movie/Ui/movie_tile_widget.dart';
import 'package:moviescreen1/features/Movie/bloc/movie_bloc.dart';
import 'package:moviescreen1/features/favorite/ui/favorite.dart';



class MoviesHome extends StatefulWidget {
  const MoviesHome({super.key});

  @override
  State<MoviesHome> createState() => _MoviesHomeState();
}

class _MoviesHomeState extends State<MoviesHome> {
  @override
  void initState() {
    movieBloc.add(HomeInitialEvent());
    super.initState();
  }
  final MovieBloc movieBloc = MovieBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
      bloc: movieBloc ,
      buildWhen: (previous, current) => current is !MovieActionState,
      listenWhen: (previous, current) => current is MovieActionState,

      // listen to the states
      listener: (context, state) {
        if(state is homeNavigateToFavoritePageActionState){
          Navigator.push(context, MaterialPageRoute(builder:(context) =>  FavoritePage()));
        }
        else if(state is HomeMovieItemFavoritedActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Favorite done!")));
        }
       
            },
      // rebuild the UI
      builder: (context, state) {
        switch(state.runtimeType){
          case loadingState:
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          
          case LoadedWithSuccess:
          final SuccessState = state as LoadedWithSuccess;

          return Scaffold(appBar: AppBar(backgroundColor: Colors.brown, title: Text("Discover Movie App", style: TextStyle(color: Colors.white),), actions: [IconButton(onPressed: (){
            movieBloc.add(HomeFavoriteButtonNavigateEvent());
          }, icon: Icon(Icons.favorite, color: Colors.white))],),

          // aqui onde vai ser mostrado todos os elementos da lista, utilizando o modelo pronto do movie_tile_widget, que está utilizando o model que tem todas as informações.
          body: ListView.builder(itemCount:SuccessState.movies.length, itemBuilder: (context,index){
           return MovieItemWidget(movieModel: SuccessState.movies[index], movieBloc: movieBloc,);

          }));
         
          case ErrorState:
          return Scaffold(body: Center(child: Text('Error'),));
          
          default:
          return SizedBox();
        }
      },
    );
  }
}
