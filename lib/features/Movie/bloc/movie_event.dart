part of 'movie_bloc.dart';
// event definition: a action that the user will make it 
@immutable
sealed class MovieEvent {}

// evento inicial
class HomeInitialEvent extends MovieEvent{

}

// evento quando o botão de favoritos for clicado

class HomeMoviesFavoriteButtonClickedEvent 
extends MovieEvent{
  final MovieModel clickedMovie;

  HomeMoviesFavoriteButtonClickedEvent({required this.clickedMovie});

}

// evento para clicar no botão de favoritos para navegar nele, eu acho

class HomeFavoriteButtonNavigateEvent extends MovieEvent{

}