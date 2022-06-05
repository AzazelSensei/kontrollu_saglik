import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kontrollu_saglik/bloc/login_cubit/login_cubit.dart';

void main() {
  runApp(const ApiTest());
}

class ApiTest extends StatefulWidget {
  const ApiTest({key});

  @override
  _ApiTestState createState() {
    return _ApiTestState();
  }
}

class _ApiTestState extends State<ApiTest> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => LoginCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Create Data Example'),
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: buildColumn(),
          ),
        ),
      ),
    );
  }

  Widget buildColumn() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (state is LoginLoaded)
                Center(
                    child: Text(
                  'name: ${state.user.name} surName: ${state.user.surName}',
                  style: TextStyle(fontSize: 30),
                )),
              if (state is LoginError)
                Center(
                    child: Text(
                  'error: ${state.errorMessage}',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                )),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'username'),
              ),
              TextField(
                controller: _controller2,
                decoration: const InputDecoration(hintText: 'password'),
              ),
              loginButton(context),
            ],
          );
        }
      },
    );
  }

  Widget loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context
            .read<LoginCubit>()
            .login(username: _controller.text, password: _controller2.text);
      },
      child: const Text('Create Data'),
    );
  }
}
