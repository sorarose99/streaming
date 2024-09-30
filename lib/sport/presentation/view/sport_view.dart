import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/presentation/components/custom_slider.dart';
import 'package:movies_app/core/presentation/components/error_screen.dart';
import 'package:movies_app/core/presentation/components/loading_indicator.dart';
import 'package:movies_app/core/presentation/components/section_header.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/sport/domain/entities/sport.dart';
import 'package:movies_app/sport/presentation/components/sports_slider_card.dart';
import 'package:movies_app/sport/presentation/controllers/sport_bloc/sport_bloc.dart';
import 'package:movies_app/sport/presentation/controllers/sport_bloc/sport_event.dart';
import 'package:movies_app/sport/presentation/controllers/sport_bloc/sport_state.dart';
import 'package:intl/intl.dart';

class SportsView extends StatelessWidget {
  const SportsView({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SportsBloc>()..add(GetLiveMatchesEvent()),
      child: Scaffold(
        body: BlocBuilder<SportsBloc, SportsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return SportsWidget(
                  liveMatches: state.liveMatches,
                );
              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context.read<SportsBloc>().add(GetLiveMatchesEvent());
                  },
                );
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}

class SportsWidget extends StatelessWidget {
  final List<Sport> liveMatches;

  const SportsWidget({super.key, required this.liveMatches});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSlider(
            itemBuilder: (context, itemIndex, _) {
              var match = liveMatches[itemIndex];

              DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");
              DateTime matchDate = dateFormat.parse(match.matchTime);
              Duration timeUntilMatch = matchDate.difference(DateTime.now());

              return SportsSliderCard(
                match: match,  
              );
            },
          ),
        ],
      ),
    );
  }
}