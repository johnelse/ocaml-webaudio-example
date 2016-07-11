module Html = Dom_html

let debug line =
  Firebug.console##(log (Js.string line))

let start _ =
  let start_button = Html.getElementById("start") in
  start_button##.onclick := Html.handler (fun _ ->
    let context = new%js WebAudio.audioContext in

    let oscillator = context##createOscillator in
    oscillator##.frequency##.value := 200.0;
    oscillator##._type := (Js.string "sine");
    oscillator##(connect ((context##.destination :> WebAudio.audioNode Js.t)));

    debug "about to start oscillator";
    oscillator##start;
    debug "oscillator started";

    ignore (Html.window##(setTimeout
      ((Js.wrap_callback
        (fun () ->
          debug "setTimeout fired: about to stop oscillator";
          oscillator##stop;
          debug "oscillator stopped")))
        (5000.0)));

    Js._false);

  Js._false

let () =
  Html.window##.onload := Html.handler start
