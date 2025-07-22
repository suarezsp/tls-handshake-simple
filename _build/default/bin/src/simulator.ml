open Types 

let transition_state actual_state _msg = 
  match actual_state with
  | ClientHello _ -> ServerHello "Reply"
  | ServerHello _ -> KeyExchange "Sim. key"
  | KeyExchange _ -> Finished
  | Finished -> actual_state

let handshake_state_to_json state =
  match state with
  | ClientHello msg -> `Assoc [("type", `String "ClientHello"); ("msg", `String msg)]
  | ServerHello msg -> `Assoc [("type", `String "ServerHello"); ("msg", `String msg)]
  | KeyExchange key -> `Assoc [("type", `String "KeyExchange"); ("key", `String key)]
  | Finished -> `Assoc [("type", `String "Finished")]
