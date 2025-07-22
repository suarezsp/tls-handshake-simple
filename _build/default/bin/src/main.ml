open Opium
open Simulator
open Yojson.Basic

let handle_api_request _req =
  let current = !estado_global in
    let new_state = transition_state current "next" in
      estado_global := new_state;
      let json = handshake_state_to_json new_state in
        let body = Yojson.Basic.to_string json in
          Response.of_plain_text body |> Lwt.return

let () =
  App.empty
  |> App.get "/handshake/step" handle_api_request
  |> App.run_command
  |> ignore