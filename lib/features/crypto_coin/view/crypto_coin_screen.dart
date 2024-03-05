import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/crypto_coin/bloc/crypto_coin_details_bloc.dart';
import 'package:flutter_application_1/features/crypto_coin/widgets/base_card.dart';
import 'package:flutter_application_1/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter_application_1/repositories/crypto_coins/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


@RoutePage()  
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin,});

final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  

  final _coinDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );
  
 
@override
  void initState() {
    _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.coin.name));
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: TextButton(
        onPressed: () {
          _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.coin.name));
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 40, 36, 36),
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: const Text('Refresh'),
      ),
      body: BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
        bloc: _coinDetailsBloc,
        builder: (context, state) {
          if (state is CryptoCoinDetailsLoaded) {
            final coin = state.coin;
            final coinDetails= coin.details;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.network(coinDetails.fullImageUrl),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    coin.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BaseCard(
                    child: Center(
                      child: Text(
                        '${coinDetails.priceInUSD} \$',
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  BaseCard(
                    child: Column(
                      children: [
                        _DataRow(
                          title: 'Hight 24 Hour',
                          value: '${coinDetails.hight24Hour} \$',
                        ),
                        const SizedBox(height: 6),
                        _DataRow(
                          title: 'Low 24 Hour',
                          value: '${coinDetails.low24Hours} \$',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        const SizedBox(width: 32),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}
