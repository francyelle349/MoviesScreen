part of 'movie_bloc.dart';

@immutable

// estado do filme normal
sealed class MovieState {}

// estado para quando ocorrer uma ação

abstract class MovieActionState extends MovieState{}

final class MovieInitial extends MovieState {}

// estado de carregando

final class loadingState extends MovieState{}

// estado de carregado com sucesso

final class LoadedWithSuccess extends MovieState{
   List<MovieModel> movies;

    LoadedWithSuccess({required this.movies});
}

// estado de erro

final class ErrorState extends MovieState{}

// estado de ação para navegar para a página de favoritos
class homeNavigateToFavoritePageActionState extends MovieActionState
{}

// estado de quando os items da lista já foram colocados dentro da pagina de favoritos

class HomeMovieItemFavoritedActionState extends MovieActionState{}