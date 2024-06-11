part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}
class MoviesBlocLoading extends MoviesState {}
class MoviesBlocLoaded extends MoviesState {}
class MovieBlocerror extends MoviesState {}
