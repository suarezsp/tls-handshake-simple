(lang dune 3.9)
(name tls_handshake_simple)

(package
 (name tls_handshake_simple)
 (synopsis "Simulador de handshake TLS")
 (description "Simulador simplificado del protocolo TLS usando OCaml y Opium")
 (depends
  dune
  lwt
  opium
  yojson
  nocrypto))
