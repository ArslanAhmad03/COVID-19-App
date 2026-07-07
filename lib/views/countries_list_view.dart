import 'package:covid_app/services/states_services.dart';
import 'package:covid_app/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListView extends StatefulWidget {
  const CountriesListView({super.key});

  @override
  State<CountriesListView> createState() => _CountriesListViewState();
}

class _CountriesListViewState extends State<CountriesListView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: statesServices.getCountriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 40,
                                  width: 60,
                                  color: Colors.white,
                                ),
                                title: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 80,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country']
                            .toString();

                        if (searchController.text.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailView(
                                          image: snapshot
                                              .data![index]['countryInfo']['flag']
                                              .toString(),
                                          name: snapshot.data![index]['country']
                                              .toString(),
                                          totalCases:
                                              snapshot.data![index]['cases'],
                                          totalDeaths:
                                              snapshot.data![index]['deaths'],
                                          totalRecovered: snapshot
                                              .data![index]['recovered'],
                                          active:
                                              snapshot.data![index]['active'],
                                          critical:
                                              snapshot.data![index]['critical'],
                                          todayRecovered: snapshot
                                              .data![index]['todayRecovered'],
                                          test: snapshot.data![index]['tests'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 40,
                                      width: 60,
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                        snapshot
                                            .data![index]['countryInfo']['flag'],
                                      ),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country']
                                          .toString(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else if (name.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        )) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailView(
                                          image: snapshot
                                              .data![index]['countryInfo']['flag']
                                              .toString(),
                                          name: snapshot.data![index]['country']
                                              .toString(),
                                          totalCases:
                                              snapshot.data![index]['cases'],
                                          totalDeaths:
                                              snapshot.data![index]['deaths'],
                                          totalRecovered: snapshot
                                              .data![index]['recovered'],
                                          active:
                                              snapshot.data![index]['active'],
                                          critical:
                                              snapshot.data![index]['critical'],
                                          todayRecovered: snapshot
                                              .data![index]['todayRecovered'],
                                          test: snapshot.data![index]['tests'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    leading: Image(
                                      height: 40,
                                      width: 60,
                                      fit: BoxFit.contain,
                                      image: NetworkImage(
                                        snapshot
                                            .data![index]['countryInfo']['flag'],
                                      ),
                                    ),
                                    title: Text(
                                      snapshot.data![index]['country']
                                          .toString(),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index]['cases'].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
