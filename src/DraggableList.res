module Template = {
  type t<'a, 'handleProps, 'commonProps> = {
    "item": 'a,
    "itemSelected": float,
    "anySelected": float,
    "dragHandleProps": {..} as 'handleProps,
    "commonProps": option<{..} as 'commonProps>,
  } => React.element

  type wrapped<'a, 'handleProps, 'commonProps>

  @module("./wrap.js")
  @val external wrap: t<'a, 'handleProps, 'commonProps> => wrapped<'a, 'handleProps, 'commonProps> = "wrap"
}

@module("react-draggable-list") external make_: 'a = "default"

let makeProps = (
  ~items,
  ~itemKey,
  ~template,
  ~onMoveEnd=?,
  ~container,
  ~springConfig=?,
  ~padding=?,
  ~unsetZIndex=?,
  ~constrainDrag=?,
  ~autoScrollMaxSpeed=?,
  ~commonProps=?,
  (),
) =>
  {
    "list": items,
    "itemKey": itemKey,
    "template": Template.wrap(template),
    "onMoveEnd": onMoveEnd,
    "container": container,
    "springConfig": springConfig,
    "padding": padding,
    "unsetZIndex": unsetZIndex,
    "constrainDrag": constrainDrag,
    "autoScrollMaxSpeed": autoScrollMaxSpeed,
    "commonProps": commonProps,
  }

let make = props => React.createElement(make_, props)
