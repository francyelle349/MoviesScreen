import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviescreen1/features/favorite/bloc/favorite_bloc.dart';
import 'package:moviescreen1/features/favorite/ui/favoriteTileWidget.dart';


// bloc consumer vai ser aplicado aqui

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteBloc favoriteBloc = FavoriteBloc();
  @override
  void initState() {
    favoriteBloc.add(FavoriteInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(bloc: favoriteBloc,
      listenWhen: (previous, current) => current is FavoriteActionState,
      buildWhen: (previous, current) => current is !FavoriteActionState,
        listener: (context,state){
          
        }, builder: (context,state){

          switch(state.runtimeType){
            case FavoriteSucceState:
            final successState = state as FavoriteSucceState;

            return Scaffold(
              appBar: AppBar(title: Text('Favorite Items'),),
              body: ListView.builder(itemCount:successState.favoriteList.length, itemBuilder:  (context,index){
                return FavoriteTileWidget(movieModel: successState.favoriteList[index], favoriteBloc: favoriteBloc,);
              }),
              
            );
       
            default:
            return SizedBox();
          }
          
        },);
  }
}
