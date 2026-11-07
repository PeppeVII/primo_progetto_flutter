import 'package:flutter/material.dart';

// I miei dati.
const String nomeCognome = "Giuseppe D'Ambrosio";
const String matricola = 'NF22500068';
const String emailUniversitaria = 'g.dambrosio63@studenti.unisa.it';

void main() {
  runApp(const MyApp());
}

// Widget principale: configura titolo, tema e schermata iniziale.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Titolo dell'app (usato dal sistema, es. nel selettore delle app).
      title: nomeCognome,
      // Nasconde la fascia "DEBUG" in alto a destra.
      debugShowCheckedModeBanner: false,
      // Tema rosso.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD32F2F)),
      ),
      // Schermata mostrata all'avvio.
      home: const ProfilePage(),
    );
  }
}

// Schermata iniziale con il profilo dello studente.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sfondo con sfumatura dal nero (in alto a sinistra) al rosso scuro
      // (in basso a destra).
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF000000), Color(0xFF1A1A1A), Color(0xFF8B0000)],
          ),
        ),
        // SafeArea evita che il contenuto finisca sotto notch, Dynamic Island
        // e barra in basso dell'iPhone.
        child: SafeArea(
          // Centra il contenuto e lo rende scorrevole sugli schermi piccoli.
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  // Scritta in alto sopra la card.
                  const Text(
                    'PRIMO PROGETTO FLUTTER',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.5,
                    ),
                  ),
                  // Spazio tra la scritta e la card.
                  const SizedBox(height: 28),
                  // Card bianca con i dati dello studente.
                  const _ProfileCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Card bianca del profilo: avatar, nome, corso, matricola ed email.
class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      // Larghezza massima, così la card non si allarga troppo su schermi grandi.
      constraints: const BoxConstraints(maxWidth: 420),
      // Margine interno della card.
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
      // Sfondo bianco, angoli arrotondati e ombra sotto la card.
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          // Cerchio con le iniziali.
          const _Avatar(),
          const SizedBox(height: 20),
          // Nome e cognome, in grande e in grassetto.
          const Text(
            nomeCognome,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111111),
            ),
          ),
          const SizedBox(height: 6),
          // Ruolo, in grigio.
          Text(
            'Studente Magistrale',
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 4),
          // Nome del corso di laurea, in rosso.
          const Text(
            'Corso Software Engineering & IT Management',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFD32F2F),
            ),
          ),
          const SizedBox(height: 24),
          // Linea sottile che separa l'intestazione dai dati.
          const Divider(height: 1),
          const SizedBox(height: 20),
          // Riquadro con la matricola.
          const _InfoRow(
            icon: Icons.badge_outlined,
            label: 'Matricola',
            value: matricola,
          ),
          const SizedBox(height: 14),
          // Riquadro con l'email universitaria.
          const _InfoRow(
            icon: Icons.email_outlined,
            label: 'Email universitaria',
            value: emailUniversitaria,
          ),
        ],
      ),
    );
  }
}

// Avatar circolare con le iniziali "GD" su sfumatura rossa.
class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dimensione del cerchio.
      width: 104,
      height: 104,
      alignment: Alignment.center,
      // Forma circolare con sfumatura dal rosso acceso al rosso scuro.
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE53935), Color(0xFF7F0000)],
        ),
      ),
      // Iniziali in bianco al centro del cerchio.
      child: const Text(
        'GD',
        style: TextStyle(
          color: Colors.white,
          fontSize: 38,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

// Riquadro informativo riutilizzabile: icona a sinistra, etichetta e valore
// a destra (usato per matricola ed email).
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      // Sfondo rosa chiarissimo con angoli arrotondati.
      decoration: BoxDecoration(
        color: const Color(0xFFFDF1F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Quadratino con l'icona rossa.
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFD32F2F).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFD32F2F)),
          ),
          const SizedBox(width: 14),
          // Testi: etichetta piccola in grigio e valore in grassetto.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Etichetta (es. "Matricola").
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 2),
                // Valore. Rimpicciolisce i valori lunghi (es. email) invece di
                // andare a capo.
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111111),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
