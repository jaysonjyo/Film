part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

class FecthMovie extends MoviesEvent {}