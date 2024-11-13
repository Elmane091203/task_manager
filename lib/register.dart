import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeIdentifiant = FocusNode();
  final FocusNode _focusNodePrenom = FocusNode();
  final FocusNode _focusNodeMotDePasse = FocusNode();
  final FocusNode _focusNodeConfirmMotDePasse = FocusNode();
  final TextEditingController _controllerNom = TextEditingController();
  final TextEditingController _controllerPrenom = TextEditingController();
  final TextEditingController _controllerIdentifiant = TextEditingController();
  final TextEditingController _controllerMotDePasse = TextEditingController();
  final TextEditingController _controllerConFirmMotDePasse =
      TextEditingController();

  bool _obscureMotDePasse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  "Inscription",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  "Creer votre compte",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 35),
                TextFormField(
                  controller: _controllerNom,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez saisir votre prenom.";
                    }

                    return null;
                  },
                  onEditingComplete: () => _focusNodePrenom.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerPrenom,
                  keyboardType: TextInputType.name,
                  focusNode: _focusNodePrenom,
                  decoration: InputDecoration(
                    labelText: "Prenom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez saisir votre nom.";
                    }

                    return null;
                  },
                  onEditingComplete: () => _focusNodeIdentifiant.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerIdentifiant,
                  focusNode: _focusNodeIdentifiant,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Identifiant",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez entre votre identifiant.";
                    }
                    return null;
                  },
                  onEditingComplete: () => _focusNodeMotDePasse.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerMotDePasse,
                  obscureText: _obscureMotDePasse,
                  focusNode: _focusNodeMotDePasse,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Mot de Passe",
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureMotDePasse = !_obscureMotDePasse;
                          });
                        },
                        icon: _obscureMotDePasse
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez saisir le mot de passe.";
                    } else if (value.length < 8) {
                      return "Le mot de passe doit contenir plus de 8 caractere.";
                    }
                    return null;
                  },
                  onEditingComplete: () =>
                      _focusNodeConfirmMotDePasse.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerConFirmMotDePasse,
                  obscureText: _obscureMotDePasse,
                  focusNode: _focusNodeConfirmMotDePasse,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Confirmer le mot de passe",
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureMotDePasse = !_obscureMotDePasse;
                          });
                        },
                        icon: _obscureMotDePasse
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez resaisir le mot de passe.";
                    } else if (value != _controllerMotDePasse.text) {
                      return "Le mot de passe ne correspond pas.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              width: 200,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              behavior: SnackBarBehavior.floating,
                              content: const Text("Inscription reussi!"),
                            ),
                          );

                          _formKey.currentState?.reset();

                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Incription"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Vous avez deja un compte?"),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Connexion"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodeIdentifiant.dispose();
    _focusNodeMotDePasse.dispose();
    _focusNodeConfirmMotDePasse.dispose();
    _controllerNom.dispose();
    _controllerPrenom.dispose();
    _controllerIdentifiant.dispose();
    _controllerMotDePasse.dispose();
    _controllerConFirmMotDePasse.dispose();
    super.dispose();
  }
}
