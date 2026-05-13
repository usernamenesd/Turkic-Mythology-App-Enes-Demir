import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/mythology/presentation/cubit/myth_cubit.dart';
import 'features/mythology/presentation/cubit/myth_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MythCubit()..fetchFigures(),
        child: const MythologyPage(),
      ),
    );
  }
}

class MythologyPage extends StatelessWidget {
  const MythologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Koyu monokrom arka plan
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          "Türk Mitolojisi",
          style: TextStyle(
            color: Colors.white70,
            fontFamily: 'serif',
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<MythCubit, MythState>(
        builder: (context, state) {
          if (state is MythLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white54),
            );
          } else if (state is MythLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.figures.length,
              itemBuilder: (context, index) {
                final item = state.figures[index];
                return Card(
                  color: const Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(color: Colors.white24, width: 1),
                  ),
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.history_edu,
                                color: Colors.white54, size: 28),
                            const SizedBox(width: 12),
                            Text(
                              item.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'serif',
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(color: Colors.white12, thickness: 1),
                        ),
                        Text(
                          item.description,
                          style: const TextStyle(
                            color: Colors.white70,
                            height: 1.5,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text(
                "Bir hata oluştu!",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}
