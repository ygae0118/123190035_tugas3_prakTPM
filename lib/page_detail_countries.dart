import 'package:flutter/material.dart';
import 'package:tugas3_prakTPM/countries_model.dart';
import 'package:tugas3_prakTPM/covid_data_source.dart';

class PageDetailCountries extends StatefulWidget {
  const PageDetailCountries({Key? key}) : super(key: key);

  @override
  State<PageDetailCountries> createState() => _PageDetailCountriesState();
}

class _PageDetailCountriesState extends State<PageDetailCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COUNTRIES DETAILS"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return FutureBuilder(
        future: CovidDataSource.instance.loadCountries(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CountriesModel countriesModel =
                CountriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel);
          }
          return _buildLoadingSection();
        });
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CountriesModel data) {
    return ListView.builder(
      itemCount: data.countries?.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: InkWell(
          onTap: () {},
          child: _buildItemCountries("${data.countries?[index].name}",
              "${data.countries?[index].iso3}"),
        ));
      },
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error");
  }

  Widget _buildItemCountries(String value, String value2) {
    var text = Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value, style: const TextStyle(fontSize: 28.0)),
            Text(" (" + value2 + ")",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 28.0)),
          ],
        ));
    return text;
  }
}
