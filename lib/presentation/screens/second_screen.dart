import 'package:bloc_1/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Incremented!"),
              duration: Duration(milliseconds: 300),
            ));
          } else if (state.wasIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Decremented!"),
              duration: Duration(milliseconds: 300),
            ));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: widget.color,
                      heroTag: "btn3",
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    FloatingActionButton(
                      backgroundColor: widget.color,
                      heroTag: "btn4",
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
