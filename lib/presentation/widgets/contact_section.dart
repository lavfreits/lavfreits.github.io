import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portifolio/model/localization.dart';

import '../../design_system.dart';
import '../../utils.dart';

class ContactSection extends StatelessWidget {
  final Localization i18n;
  final String locale;

  const ContactSection({
    super.key,
    required this.i18n,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final design = DesignSystem.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      key: key,
      children: [
        Container(
          height: screenSize.width < 600
              ? 0.45 * screenSize.height
              : 0.52 * screenSize.height,
          color: design.terciary500,
        ),
        Padding(
          padding: getPadding(
            screenSize.width > 1100
                ? 0.2 * screenSize.width
                : 0.09 * screenSize.width,
            0.05 * screenSize.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                i18n.contactMeDesc,
                style: design.h3().copyWith(
                      fontSize: screenSize.width > 1200
                          ? 0.02 * screenSize.width
                          : 0.028 * screenSize.width,
                      height: 1.7,
                    ),
              ),
              SizedBox(
                  height: screenSize.width > 900
                      ? 0.1 * screenSize.height
                      : 0.05 * screenSize.height),
              screenSize.width < 900
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          icon: FaIcon(
                            FontAwesomeIcons.solidFileLines,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL(
                                "https://docs.google.com/document/d/11dns9jkwr_1IzTt7nw-35F6trrQoT7L25ZeVnac6uqo/edit?usp=sharing");
                          },
                          label: Text(
                            locale == 'pt-br' ? 'Currículo' : 'Resume/CV',
                            style: design.paragraphS(),
                          ),
                        ),
                        SizedBox(height: 0.015 * screenSize.height),
                        TextButton.icon(
                          icon: Icon(
                            Icons.email,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL("mailto:llimafreitas@gmail.com");
                          },
                          label: Text(
                            'Email',
                            style: design.paragraphS(),
                          ),
                        ),
                        SizedBox(height: 0.015 * screenSize.height),
                        TextButton.icon(
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL(
                                "https://www.linkedin.com/in/lavinia-lima-de-freitas/");
                          },
                          label: Text(
                            'Linkedin',
                            style: design.paragraphS(),
                          ),
                        ),
                        SizedBox(height: 0.015 * screenSize.height),
                        TextButton.icon(
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL("https://github.com/lavfreits");
                          },
                          label: Text(
                            'Github',
                            style: design.paragraphS(),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                          icon: FaIcon(
                            FontAwesomeIcons.solidFileLines,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL(
                                "https://docs.google.com/document/d/11dns9jkwr_1IzTt7nw-35F6trrQoT7L25ZeVnac6uqo/edit?usp=sharing");
                          },
                          label: Text(
                            locale == 'pt-br' ? 'Currículo' : 'Resume',
                            style: design.paragraphS(),
                          ),
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.email,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL("mailto:llimafreitas@gmail.com");
                          },
                          label: Text(
                            'Email',
                            style: design.paragraphS(),
                          ),
                        ),
                        TextButton.icon(
                          icon: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL(
                                "https://www.linkedin.com/in/lavinia-lima-de-freitas/");
                          },
                          label: Text(
                            'Linkedin',
                            style: design.paragraphS(),
                          ),
                        ),
                        TextButton.icon(
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                            color: design.white,
                          ),
                          onPressed: () {
                            launchURL("https://github.com/lavfreits");
                          },
                          label: Text(
                            'Github',
                            style: design.paragraphS(),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }
}