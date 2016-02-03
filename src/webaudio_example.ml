module Html = Dom_html

let start _ =
  let context = jsnew WebAudio.audioContext () in
  Js._false

let _ =
  Html.window##onload <- Html.handler start
