import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:identification/screens/verification_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Future<void> _navigateToHome() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerificationScreen()),
    );
  }

  final _formKey = GlobalKey<FormState>();
  String _diplome = 'BAC';
  String _sexe = 'Masculin';
  String _situationMatrimoniale = 'Célibataire';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 144, 23),
        title: Center(
          child: Column(
            children: [
              Text(
                "Identifiez vous... Togolais !",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          // Form
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputBox(
                      label: 'Numéro de téléphone',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    InputBox(
                      label: 'Nom',
                      icon: Icons.person,
                    ),
                    InputBox(
                      label: 'Prénom',
                      icon: Icons.text_format_sharp,
                    ),
                    InputBox(
                      label: 'Âge',
                      icon: Icons.cake_rounded,
                      keyboardType: TextInputType.number,
                    ),
                    InputBox(
                      label: 'Email',
                      icon: Icons.mail,
                    ),
                    SelectedChoice(
                      label: 'Sexe',
                      icon: FontAwesomeIcons.person,
                      value: _sexe,
                      items: ['Masculin', 'Feminin', 'LGBTQ', 'Non binaire'],
                      onChanged: (String? newValue) {
                        setState(() {
                          _sexe = newValue!;
                        });
                      },
                    ),
                    SelectedChoice(
                      label: 'Diplôme',
                      icon: FontAwesomeIcons.graduationCap,
                      value: _diplome,
                      items: [
                        'CEPD',
                        'BEPC',
                        'BAC',
                        'Licence',
                        'Master',
                        'Doctorat'
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          _diplome = newValue!;
                        });
                      },
                    ),
                    InputBox(
                      label: 'Emploi',
                      icon: Icons.work,
                    ),
                    SelectedChoice(
                      label: 'Situation matrimoniale',
                      icon: FontAwesomeIcons.peopleArrows,
                      value: _situationMatrimoniale,
                      items: ['Marié', 'Célibataire', 'Veuf/Veuve'],
                      onChanged: (String? newValue) {
                        setState(() {
                          _situationMatrimoniale = newValue!;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Traitement du formulaire
                        }
                      },
                      child: Text(
                        'Valider',
                        style: TextStyle(
                          color: Color.fromARGB(255, 19, 144, 23),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget InputBox({
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer $label';
          }
          return null;
        },
      ),
    );
  }

  Widget SelectedChoice({
    required String label,
    required IconData icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
