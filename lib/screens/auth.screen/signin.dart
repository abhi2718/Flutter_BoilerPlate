import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import '../../services/socket_io.dart';
import './signin_view_model.dart';

class SignInScreen extends HookWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final useViewModel =
        useMemoized(() => Provider.of<SignInViewModel>(context, listen: false));
    final useSocketService =
        useMemoized(() => Provider.of<SocketService>(context, listen: false));
    useEffect(() {
      useSocketService.connect();
    },[]);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<SignInViewModel>(builder: (context, provider, child) {
              return Text(provider.count.toString());
            }),
            ElevatedButton(
              onPressed: useViewModel.setCount,
              child: const Text("Count"),
            ),
            FutureBuilder(
                future: useViewModel.loginApi({}, context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return const Text("data arrived!");
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
