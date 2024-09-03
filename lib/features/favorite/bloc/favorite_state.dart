// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

// classe para ação
abstract class FavoriteActionState extends FavoriteState{}


// classe inicial
 class FavoriteInitial extends FavoriteState {}


// classe quando tiver o estado de sucesso

class FavoriteSucceState extends FavoriteState {
  List<MovieModel> favoriteList;
  
  FavoriteSucceState({
    required this.favoriteList,
  });
}

