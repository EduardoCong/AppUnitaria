import 'package:appunificada/widgets/custom_confirmation.dart';
import 'package:appunificada/widgets/custom_dialog_title.dart';
import 'package:appunificada/providers/tasks_provider.dart';
import 'package:appunificada/widgets/custom_list_task.dart';
import 'package:appunificada/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const HeadersTriangulo(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              const _TitleTask(),
              Expanded(
                child: Consumer<TaskProvider>(
                  builder: (context, taskProvider, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: taskProvider.tasks.isEmpty
                          ? const Center(
                              child: Text(
                                'No tienes tareas agregadas.',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            )
                          : ListView.builder(
                              itemCount: taskProvider.tasks.length,
                              itemBuilder: (context, index) {
                                final task = taskProvider.tasks[index];
                                return Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            color: Color(0xffffffff),
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: ListItem(
                                        title: task.title,
                                        isCompleted: task.isCompleted,
                                        onCheckboxChanged: (value) {
                                          taskProvider.updateTask(task);
                                        },
                                        onLongPress: () {
                                          _showDeleteDialog(
                                              context, taskProvider, task.id!);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              },
                            ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: const FaIcon(FontAwesomeIcons.addressBook),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TextInputDialog(
        title: 'Agregar Tarea',
        hintText: 'Título de la tarea',
        confirmButtonText: 'Agregar',
        onConfirm: (title) {
          Provider.of<TaskProvider>(context, listen: false).addTask(title);
        },
      ),
    );
  }

  void _showDeleteDialog(
      BuildContext context, TaskProvider taskProvider, int taskId) {
    showDialog(
      context: context,
      builder: (context) => ConfirmationDialog(
        title: 'Eliminar Tarea',
        content: '¿Estás seguro de eliminar esta tarea?',
        confirmButtonText: 'Eliminar',
        onConfirm: () {
          taskProvider.deleteTask(taskId);
        },
      ),
    );
  }
}

class _TitleTask extends StatelessWidget {
  const _TitleTask();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Text(
          'Lista de Tareas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
