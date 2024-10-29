import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomCartSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 600,
        padding: EdgeInsets.only(top: 20),
        color: Color(0xFFCEDDEE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Lista de productos con scroll limitado
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F9FD),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF475269).withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/itemPage");
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10, right: 60),
                                    height: 90,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF475269),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Nike Shoe",
                                    style: TextStyle(
                                      color: Color(0xFF475269),
                                      fontSize: 23,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      _buildIconButton(CupertinoIcons.minus),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "02",
                                          style: TextStyle(
                                            color: Color(0xFF475269),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      _buildIconButton(CupertinoIcons.add),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Column(
                                children: [
                                  _buildDeleteButton(),
                                  Spacer(),
                                  Text(
                                    "\$ 50",
                                    style: TextStyle(
                                      color: Color(0xFF475269),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    _buildSummarySection(),
                  ],
                ),
              ),
            ),
            _buildTotalSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFFF5F9FD),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(icon, size: 18),
    );
  }

  Widget _buildDeleteButton() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xFF475269),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.4),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        Icons.delete,
        color: Colors.red,
        size: 20,
      ),
    );
  }

  Widget _buildSummarySection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFF5F9FD),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow("Delivery Fee:", "\$ 20"),
          Divider(height: 20, thickness: 0.5, color: Color(0xFF475269)),
          _buildRow("Sub-total:", "\$ 100"),
          Divider(height: 20, thickness: 0.4, color: Color(0xFF475269)),
          _buildRow("Discount:", "-\$10", textColor: Colors.red),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String amount, {Color? textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF475269),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor ?? Color(0xFF475269),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFF5F9FD),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total:",
                style: TextStyle(
                  color: Color(0xFF475269),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "\$120",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFF475269),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Check out",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
