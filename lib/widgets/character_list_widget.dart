import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget(
      {Key? key,
      required this.onPress,
      required this.imageUrl,
      required this.name,
      required this.gender})
      : super(key: key);

  final Function onPress;
  final String imageUrl;
  final String name;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: InkWell(
        onTap: () => onPress.call(),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 120,
              height: 120,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                children: [
                  SvgPicture.asset(
                    defineGenderIcon(),
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String defineGenderIcon() {
    switch (gender) {
      case "Female":
        return 'assets/icons/ic_female.svg';
      case "Male":
        return 'assets/icons/ic_male.svg';
      case "Genderless":
        return 'assets/icons/ic_genderless.svg';
      case "unknown":
        return 'assets/icons/ic_unknown.svg';
      default:
        return 'assets/icons/ic_unknown.svg';
    }
  }
}
