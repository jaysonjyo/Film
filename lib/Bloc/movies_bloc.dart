import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/movie_api.dart';
import '../Repository/ModelClass/MovieModel.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  late MovieModel movieModel;
  MovieApi movieApi=MovieApi();
  MoviesBloc() : super(MoviesInitial()) {
    on<FecthMovie>((event, emit)  async{
      emit(MoviesBlocLoading());
      try{
        movieModel=await movieApi.getMovie();
        emit(MoviesBlocLoaded());
      }
          catch(a){
        emit(MovieBlocerror());
          }

    });
  }
}
