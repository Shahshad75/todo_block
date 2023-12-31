import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_block/features/bloc/student_bloc.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final titleController = TextEditingController();
  final descroptionConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: BlocListener<StudentBloc, StudentState>(
        listenWhen: (previous, current) => current is StudentAddedMessageState,
        listener: (context, state) {
          if (state is StudentAddedMessageState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
              'Added sucessfully',
            )));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text("Title"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: descroptionConroller,
                decoration: const InputDecoration(
                  label: Text("description"),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 48, 188, 179))),
                    onPressed: () async {
                      context.read<StudentBloc>().add(AddsucessfullEvent(
                          title: titleController.text.trim(),
                          description: descroptionConroller.text.trim()));
                      context.read<StudentBloc>().add(FetchSucessEvent());
                    },
                    child: const Text('Click ')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
