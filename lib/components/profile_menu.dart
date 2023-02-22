import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  final String data;
  final Function onTap;
  final IconData icon;
  MenuProfile({
    super.key,
    required this.data,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 20,
          ),
          Text(
            data,
            style: TextStyle(color: Colors.black, fontSize: 22),
          )
        ],
      ),
    );
  }
}
