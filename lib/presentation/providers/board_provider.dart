import 'package:flutter_assignment/data/datasources/local/local_storage_service.dart';
import 'package:flutter_assignment/data/datasources/remote/board_remote_datasource.dart';
import 'package:flutter_assignment/data/repositories/board_repository_impl.dart';
import 'package:flutter_assignment/domain/repositories/board_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

final boardRemoteDataSourceProvider = Provider<BoardRemoteDataSource>((ref) {
  return BoardRemoteDataSource();
});

final boardRepositoryProvider = Provider<BoardRepository>((ref) {
  return BoardRepositoryImpl(ref.read(boardRemoteDataSourceProvider));
});
