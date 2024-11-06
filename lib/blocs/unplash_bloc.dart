import 'package:appunificada/models/photos_model.dart';
import 'package:appunificada/services/photos_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PhotoEvent {}

class SearchPhotosEvent extends PhotoEvent {
  final String query;

  SearchPhotosEvent(this.query);
}

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<Photo> photos;
  PhotoLoaded(this.photos);
}

class PhotoError extends PhotoState {
  final String message;
  PhotoError(this.message);
}

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoService photoService;

  PhotoBloc(this.photoService) : super(PhotoInitial()) {
    on<SearchPhotosEvent>((event, emit) async {
      emit(PhotoLoading());

      try {
        final photos = await photoService.searchPhotos(event.query);
        emit(PhotoLoaded(photos));
      } catch (e) {
        emit(PhotoError('Error al cargar las fotos'));
      }
    });
  }
}