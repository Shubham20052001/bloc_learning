import 'package:bloc_1/constants/enums.dart';
import 'package:bloc_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_1/logic/cubit/internet_cubit.dart';
import 'package:bloc_1/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text('Wi-fi',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.green));
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile Data',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.red));
                } else if (state is InternetDisconnected) {
                  return Text('Disconnected',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.grey));
                }
                return const CircularProgressIndicator();
              },
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       FloatingActionButton(
            //         heroTag: "btn1",
            //         onPressed: () {
            //           BlocProvider.of<CounterCubit>(context).decrement();
            //         },
            //         tooltip: 'Decrement',
            //         child: const Icon(Icons.remove),
            //       ),
            //       const SizedBox(
            //         width: 90,
            //       ),
            //       FloatingActionButton(
            //         heroTag: "btn2",
            //         onPressed: () {
            //           BlocProvider.of<CounterCubit>(context).increment();
            //         },
            //         tooltip: 'Increment',
            //         child: const Icon(Icons.add),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              child: const Text(
                "Go to 2nd screen",
                style: TextStyle(color: Colors.white),
              ),
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed("/second");
              },
            ),
            const SizedBox(
              height: 24,
            ),
            MaterialButton(
              child: const Text(
                "Go to 3rd screen",
                style: TextStyle(color: Colors.white),
              ),
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
              },
            ),
          ],
        ),
      ),
    );
  }
}
