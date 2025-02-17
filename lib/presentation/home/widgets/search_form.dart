import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  final Function handleSearch;
  const SearchForm({super.key, required this.handleSearch});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.fromBorderSide(BorderSide(color: Colors.deepOrange)),
      ),
      child: TextFormField(
        autocorrect: false,
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search movie...',
          prefixIcon: IconButton(
            icon: Icon(Icons.close_outlined),
            onPressed: () {
              _searchController.clear();
            },
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {
              widget.handleSearch(_searchController.text);
            },
          ),
        ),
      ),
    );
  }
}
