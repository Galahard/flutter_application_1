// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
   @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({
    required this.coinsList,
  });
  final List<CryptoCoin> coinsList;
   @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFail extends CryptoListState {
   CryptoListLoadingFail({
    this.exception,
  });

  final Object? exception;
 List<Object?> get props => [exception];
}
