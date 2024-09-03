import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviescreen1/data/data.dart';
import 'package:moviescreen1/features/model/MovieModel.dart';




part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeFavoriteButtonNavigateEvent>(homeFavoriteButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<MovieState> emit) async {
    emit(loadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(LoadedWithSuccess(movies: DataMovies.listMovies.map((e)=> MovieModel(id: e['id'], title: e['title'],genre: e['genre'],time: e['time'], urlImage: e['ImageUrl'] )).toList()) );

  }

  FutureOr<void> homeFavoriteButtonNavigateEvent(HomeFavoriteButtonNavigateEvent event, Emitter<MovieState> emit) {
    emit(homeNavigateToFavoritePageActionState());
  }
}
