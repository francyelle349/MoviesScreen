part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

// initial event

class FavoriteInitialEvent extends FavoriteEvent{}

// remove Favorite from favorite 

class RemoveFavoriteInitialEvent extends FavoriteEvent{

  
}
