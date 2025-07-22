type handshake_state =
  | ClientHello of string
  | ServerHello of string
  | KeyExchange of string
  | Finished

type protocol = {
  state : handshake_state;
  shared_key : string option;
}