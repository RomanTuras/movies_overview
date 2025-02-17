import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:movies_overview/presentation/home/view_models/home_viewmodel.dart';
import 'package:movies_overview/presentation/home/widgets/home_grid.dart';
import 'package:movies_overview/presentation/home/widgets/search_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _log = Logger('HomeScreen');

  void handleSearch(String query) {
    widget.viewmodel.search.execute(query);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: ListenableBuilder(
          listenable: widget.viewmodel,
          builder: (context, child) {
            if (widget.viewmodel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (widget.viewmodel.load.error) {
              return Text('Failed!');
            }

            return child ?? Text('Null');
          },
          child: ListenableBuilder(
              listenable: widget.viewmodel,
              builder: (context, child) {
                return Column(
                  children: [
                    SearchForm(handleSearch: handleSearch),
                    // ElevatedButton(
                    //     onPressed: () =>
                    //         {handleSearch(widget.viewmodel, 'batman')},
                    //     child: Text('search')),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        child: CustomScrollView(
                          slivers: [
                            HomeGrid(viewModel: widget.viewmodel),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
