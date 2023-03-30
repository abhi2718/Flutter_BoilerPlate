import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart';
import './screens/auth.screen/signin_view_model.dart';
import './services/socket_io.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignInViewModel>(
          create: (_) => SignInViewModel(),
        ),
        ChangeNotifierProvider<SocketService>(
          create: (_) => SocketService(),
        ),
      ],
      child: MaterialApp(
        title: 'Aluma',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: Routes().routes,
      ),
    );
  }
}
