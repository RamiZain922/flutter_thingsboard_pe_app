import 'package:flutter/material.dart';

import 'entities_base.dart';

class EntityListCard<T> extends StatelessWidget {
  final bool _listWidgetCard;
  final T _entity;
  final EntityTapFunction<T>? _onEntityTap;
  final EntityCardWidgetBuilder<T> _entityCardWidgetBuilder;

  const EntityListCard(
    T entity, {
    Key? key,
    EntityTapFunction<T>? onEntityTap,
    required EntityCardWidgetBuilder<T> entityCardWidgetBuilder,
    bool listWidgetCard = false,
  })  : _entity = entity,
        _onEntityTap = onEntityTap,
        _entityCardWidgetBuilder = entityCardWidgetBuilder,
        _listWidgetCard = listWidgetCard,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin:
            _listWidgetCard ? const EdgeInsets.only(right: 8) : EdgeInsets.zero,
        decoration: _listWidgetCard
            ? BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFDEDEDE),
                  style: BorderStyle.solid,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              )
            : BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((255 * 0.05).ceil()),
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          child: _entityCardWidgetBuilder(context, _entity),
        ),
      ),
      onTap: () {
        if (_onEntityTap != null) {
          _onEntityTap(_entity);
        }
      },
    );
  }
}
