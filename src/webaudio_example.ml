module Html = Dom_html

let start _ =
  let context = jsnew WebAudio.audioContext () in

  let oscillator = context##createOscillator () in
  oscillator##frequency##value <- 200.0;
  oscillator##_type <- (Js.string "sine");
  oscillator##connect (context##destination);
  oscillator##start ();

  Js._false

let _ =
  Html.window##onload <- Html.handler start
