import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/coins_list/bloc/crypto_list_bloc.dart';
import 'package:flutter_application_1/features/coins_list/widgets/widgets.dart';
import 'package:flutter_application_1/repositories/crypto_coins/crypto_coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoCoinList'),
      ),
      bottomNavigationBar: TextButton(
                      onPressed: () {_cryptoListBloc.add(LoadCryptoList());}, 
                    child: const Text('Refresh'),
                    style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 40, 36, 36),
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                    
                    ),
                    
      body: RefreshIndicator(
        onRefresh: () async { 
          final completer = Completer();
        _cryptoListBloc.add(LoadCryptoList(completer: completer));
        return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, i) => const Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinsTile(coin: coin); 
                  }
                  );
            }
            if (state is CryptoListLoadingFail) {
              return  Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const Text('Something went wrong'),
                    const Text('Please Try Again',),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {_cryptoListBloc.add(LoadCryptoList());}, 
                    child: const Text('Try again')),
        
                  ]));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
