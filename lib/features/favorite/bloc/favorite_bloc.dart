import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviescreen1/data/listFavorite.dart';
import 'package:moviescreen1/features/model/MovieModel.dart';


part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
   // fazer as funções dos eventos
   on<FavoriteInitialEvent>(favoriteInitialEvent);
   on<RemoveFavoriteInitialEvent>(removeFavoriteInitialEvent);
  }

  FutureOr<void> favoriteInitialEvent(FavoriteInitialEvent event, Emitter<FavoriteState> emit) {
    emit(FavoriteSucceState(favoriteList: FavoriteMovies));
  }

  FutureOr<void> removeFavoriteInitialEvent(RemoveFavoriteInitialEvent event, Emitter<FavoriteState> emit) {
  }
}
