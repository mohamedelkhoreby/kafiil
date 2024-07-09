import 'package:flutter/material.dart';

import 'package:kafiil/core/resources/font_manager.dart';
import 'package:kafiil/core/resources/style_manager.dart';
import '../../../core/resources/color_manager.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  // Number of rows to display per page
  final int rowsPerPage = 5;
  // Current page index
  int currentPage = 0;

  // Function to navigate to the first page
  void firstPage() {
    setState(() {
      currentPage = 0;
    });
  }

  // Function to navigate to the previous page
  void previousPage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
      }
    });
  }

  // Function to navigate to the next page
  void nextPage() {
    setState(() {
      if (currentPage < (data.length / rowsPerPage).ceil() - 1) {
        currentPage++;
      }
    });
  }

  // Function to navigate to the last page
  void lastPage() {
    setState(() {
      currentPage = (data.length / rowsPerPage).ceil() - 1;
    });
  }

  // Sample data: list of countries and their capitals
  final List<Map<String, String>> data = [
    {'Country': 'Egypt', 'Capital': 'Cairo'},
    {'Country': 'France', 'Capital': 'Paris'},
    {'Country': 'Germany', 'Capital': 'Berlin'},
    {'Country': 'Japan', 'Capital': 'Tokyo'},
    {'Country': 'Canada', 'Capital': 'Ottawa'},
    {'Country': 'Brazil', 'Capital': 'Brasilia'},
    {'Country': 'Australia', 'Capital': 'Canberra'},
    {'Country': 'India', 'Capital': 'New Delhi'},
    {'Country': 'China', 'Capital': 'Beijing'},
    {'Country': 'Russia', 'Capital': 'Moscow'},
    {'Country': 'United Kingdom', 'Capital': 'London'},
    {'Country': 'Italy', 'Capital': 'Rome'},
    {'Country': 'Spain', 'Capital': 'Madrid'},
    {'Country': 'Mexico', 'Capital': 'Mexico City'},
    {'Country': 'South Korea', 'Capital': 'Seoul'},
    {'Country': 'Turkey', 'Capital': 'Ankara'},
    {'Country': 'Argentina', 'Capital': 'Buenos Aires'},
    // Additional data...
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container that holds the DataTable
                  Container(
                    width: screenWidth * 0.9,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.white,
                    ),
                    child: Stack(
                      children: [
                        // DataTable displaying the data
                        DataTable(
                          horizontalMargin: 70,
                          columnSpacing: 100,
                          dataRowMaxHeight: 40,
                          dataRowMinHeight: 30,
                          columns: const [
                            DataColumn(label: Text('')),
                            DataColumn(label: Text('')),
                          ],
                          rows: data
                              .skip(currentPage * rowsPerPage)
                              .take(rowsPerPage)
                              .map((item) {
                            return DataRow(
                              cells: [
                                DataCell(Text(
                                  item['Country']!,
                                  style: mediumMontserratStyle(
                                      fontSize: FontSize.s10,
                                      color: ColorManager.black),
                                )),
                                DataCell(Text(
                                  item['Capital']!,
                                  style: mediumMontserratStyle(
                                      fontSize: FontSize.s10,
                                      color: ColorManager.black),
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                        // Header for the DataTable
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Container(
                            width: screenWidth * 0.85,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.background,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Country',
                                  style: semiBlodMontserrat(
                                      fontSize: FontSize.s10,
                                      color: ColorManager.grey),
                                ),
                                Text(
                                  'Capital',
                                  style: semiBlodMontserrat(
                                      fontSize: FontSize.s10,
                                      color: ColorManager.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Container holding the pagination controls
          SizedBox(
            width: screenWidth * 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Button to navigate to the first page
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: ColorManager.grey),
                      color: ColorManager.background,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: firstPage,
                        icon: Icon(
                          Icons.keyboard_double_arrow_left,
                          color: currentPage == 0
                              ? ColorManager.mainColor
                              : ColorManager.grey,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  // Button to navigate to the previous page
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: ColorManager.grey),
                      color: ColorManager.background,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: previousPage,
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          color: currentPage == 0
                              ? ColorManager.mainColor
                              : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  // ListView.builder to create page number buttons
                  SizedBox(
                    height: 30,
                    width: screenWidth * 0.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (data.length / rowsPerPage).ceil(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                            border: currentPage == index
                                ? Border.all(color: ColorManager.mainColor)
                                : Border.all(color: ColorManager.grey),
                            color: currentPage == index
                                ? ColorManager.mainColor
                                : ColorManager.background,
                          ),
                          child: FittedBox(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentPage = index;
                                });
                              },
                              child: Text(
                                '${index + 1}',
                                style: mediumMontserratStyle(
                                    fontSize: FontSize.s16,
                                    color: currentPage == index
                                        ? ColorManager.white
                                        : ColorManager.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Button to navigate to the next page
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: ColorManager.grey),
                      color: ColorManager.background,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: nextPage,
                        icon: Icon(
                          Icons.keyboard_arrow_right,
                          color: currentPage ==
                                  (data.length / rowsPerPage).ceil() - 1
                              ? ColorManager.mainColor
                              : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                  // Button to navigate to the last page
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: ColorManager.grey),
                      color: ColorManager.background,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: lastPage,
                        icon: Icon(
                          Icons.keyboard_double_arrow_right,
                          color: currentPage ==
                                  (data.length / rowsPerPage).ceil() - 1
                              ? ColorManager.mainColor
                              : Colors.grey,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
