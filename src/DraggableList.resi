module Template: {
  type t<'a, 'handleProps, 'commonProps> = {
  "item": 'a,
  "itemSelected": float,
  "anySelected": float,
  "dragHandleProps": {..} as 'handleProps,
  "commonProps": option<{..} as 'commonProps>,
  } => React.element

  type wrapped<'a, 'handleProps, 'commonProps>

  let wrap: t<'a, 'h, 'c> => wrapped<'a, 'h, 'c>
}

/* The following is what you "should" read.
 * For reasons involving keywords, we've had to be a bit clever.
@react.component
let make: (
  ~items: array<'a>,
  ~itemKey: 'a => string,
  ~template: template<'a, _, 'commonProps>,
  ~onMoveEnd: (~newList: array<'a>, ~movedItem: 'a, ~oldIndex: int, ~newIndex: int) => unit=?,
  ~container: unit => React.ref<'container>,
  ~springConfig: {..}=?,
  ~padding: int=?,
  ~unsetZIndex: bool=?,
  ~constrainDrag: bool=?,
  ~autoScrollMaxSpeed: float=?,
  ~commonProps: {..} as 'commonProps=?,
) => React.element
*/

let makeProps: (
  ~items: array<'a>,
  ~itemKey: 'a => string,
  ~template: Template.t<'a, 'handleProps, 'commonProps>,
  ~onMoveEnd: (~newList: array<'a>, ~movedItem: 'a, ~oldIndex: int, ~newIndex: int) => unit=?,
  ~container: unit => Js.Nullable.t<Dom.element>,
  ~springConfig: {..} as 'springConfig=?,
  ~padding: int=?,
  ~unsetZIndex: bool=?,
  ~constrainDrag: bool=?,
  ~autoScrollMaxSpeed: float=?,
  ~commonProps: {..} as 'commonProps=?,
  unit,
) => {
  "list": array<'a>,
  "itemKey": 'a => string,
  "template": Template.wrapped<'a, 'handleProps, 'commonProps>,
  "onMoveEnd": option<
    (~newList: array<'a>, ~movedItem: 'a, ~oldIndex: int, ~newIndex: int) => unit,
  >,
  "container": unit => Js.Nullable.t<Dom.element>,
  "springConfig": option<'springConfig>,
  "padding": option<int>,
  "unsetZIndex": option<bool>,
  "constrainDrag": option<bool>,
  "autoScrollMaxSpeed": option<float>,
  "commonProps": option<'commonProps>,
}

let make: 'props => React.element
