type handshake_state =
  | ClientHello of string
  | ServerHello of string
  | KeyExchange of string
  | Finished


type protocol = {
  state : handshake_state;
  shared_Key : string option;
}

let transitionState actualState msg= 
  match actualState with
  | ClientHello _ -> ServerHello "Reply"
  | ServerHello _ -> KeyExchange "Sim. key"
  | KeyExchange _ -> Finished
  | Finished > actualState

let hanshakeStateToJson state =
  match state with
  | ClientHello msg -> `Assoc [("type", `String "ClientHello"); ("msg", `String msg)]
  | ServerHello msg -> `Assoc [("type", `String "ServerHello"); ("msg", `String msg)]
  | KeyExchange key -> `Assoc [("type", `String "KeyExchange"); ("key", `String key)]
  | Finished -> `Assoc [("type", `String "Finished")]

let handleAPIrequest ref_state = 
  let act_state = !ref_state in
    let new_state = transitionState act_state "next" in 
      ref_state := new_state;
      hanshakeStateToJson new_state;;