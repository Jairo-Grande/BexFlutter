import 'package:bex_app_flutter/src/core/global/constants.dart';
import 'package:bex_app_flutter/src/features/crud/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final FocusNode? focus;
  final FocusNode? nextFocus;

  const CustomInput({
    super.key,
    required this.label,
    required this.placeholder,
    required this.textController,
    required this.keyBoardType,
    required this.focus,
    required this.nextFocus,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

Color textColor = Colors.black54;
IconButton? iconButton;

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    CrudBloc crudBloc = BlocProvider.of<CrudBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 25),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Const.radius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.005),
                          offset: const Offset(0, 5),
                          blurRadius: 15,
                        )
                      ]),
                  child: TextField(
                    enabled: true,
                    focusNode: widget.focus,
                    controller: widget.textController,
                    autocorrect: false,
                    keyboardType: widget.keyBoardType,
                    onEditingComplete: () {
                      if (widget.nextFocus != null) {
                        requestFocus(context, widget.nextFocus!);
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        crudBloc.add(const UpdateControllers());
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Const.radius),
                        ),
                        hintText: widget.placeholder,
                        hintStyle: TextStyle(
                            fontSize: 12, color: Colors.grey.shade400)),
                  ),
                ),
              ),
              if (iconButton != null) iconButton!
            ],
          ),
        ),
      ],
    );
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  showDataPicker() {
    return showDatePicker(
            locale: const Locale('es', "ES"),
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1920),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        widget.textController.text =
            "${value.day} / ${value.month} / ${value.year}";
      }
      return;
    });
  }
}

class NotificationAction extends Notification {}
