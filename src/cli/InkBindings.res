type inkKey = {
  upArrow: bool,
  downArrow: bool,
  leftArrow: bool,
  rightArrow: bool,
  return: bool,
  tab: bool,
  shift: bool,
  escape: bool,
}

// AIDEV-NOTE: Ink render function returns an instance with cleanup methods
type inkInstance = {unmount: unit => unit}
@module("ink") external render: React.element => inkInstance = "render"

module Box = {
  @module("ink") @react.component
  external make: (
    ~children: React.element,
    ~flexDirection: string=?,
    ~maxHeight: int=?,
  ) => React.element = "Box"
}

module Text = {
  @module("ink") @react.component
  external make: (
    ~children: React.element,
    ~color: string=?,
    ~backgroundColor: string=?,
    ~dimColor: bool=?,
    ~bold: bool=?,
    ~italic: bool=?,
    ~underline: bool=?,
    ~strikethrough: bool=?,
    ~inverse: bool=?,
    ~wrap: string=?,
  ) => React.element = "Text"
}

module Hooks = {
  @module("ink") @val external useStdout: unit => {"rows": option<int>} = "useStdout"
  @module("ink") @val
  external useInput: (
    (string, inkKey) => unit,
    // AIDEV-NOTE: Options can be used to exit the app if needed
    // {exitOnCtrlC: bool}
    option<Js.t<{..}>>,
  ) => unit = "useInput"
}
