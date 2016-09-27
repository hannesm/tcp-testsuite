# Handling the Reception of TCP Segments with the RST-bit Set

## Description
This set of tests focuses on the handling of RST-segments moving the state of the TCP connection
either to `CLOSED` or leaving it untouched.
The behavior is described in [RFC 0793](https://tools.ietf.org/html/rfc0793) or
[RFC 5961](https://tools.ietf.org/html/rfc5961#section-3) and selected by the
`sysctl`-variable `net.inet.tcp.insecure_rst`.
The default is to follow [RFC 5961](https://tools.ietf.org/html/rfc5961#section-3).

## Status

| Name                                                                                                                                                                                                                                     | Result FreeBSD 11.0 | Result FreeBSD Head |
|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-------------------:|:-------------------:|
|[rcv-rst-closed-secure-ipv4](rcv-rst-closed-secure-ipv4 "Ensure that the reception of a TCP RST in the CLOSED state does not trigger the sending of a TCP RST")                                                                           | Unknown             | Unknown             |
|[rcv-rst-closed-secure-ipv6](rcv-rst-closed-secure-ipv6 "Ensure that the reception of a TCP RST in the CLOSED state does not trigger the sending of a TCP RST")                                                                           | Unknown             | Unknown             |
|[rcv-rst-listen-secure-ipv4](rcv-rst-listen-secure-ipv4 "Ensure that the reception of a TCP RST in the LISTEN state does not trigger the sending of a TCP RST")                                                                           | Unknown             | Unknown             |
|[rcv-rst-listen-secure-ipv6](rcv-rst-listen-secure-ipv6 "Ensure that the reception of a TCP RST in the LISTEN state does not trigger the sending of a TCP RST")                                                                           | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-left-secure-ipv4](rcv-rst-syn-sent-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-SENT state does not affect the TCP connection")                           | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-left-secure-ipv6](rcv-rst-syn-sent-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-SENT state does not affect the TCP connection")                           | Unknown             | Unknown             |
|[rcv-rst-syn-sent-left-edge-secure-ipv4](rcv-rst-syn-sent-left-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-SENT state destroys the TCP connection")                                          | Unknown             | Unknown             |
|[rcv-rst-syn-sent-left-edge-secure-ipv6](rcv-rst-syn-sent-left-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-SENT state destroys the TCP connection")                                          | Unknown             | Unknown             |
|[rcv-rst-syn-sent-right-edge-secure-ipv4](rcv-rst-syn-sent-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-SENT state triggers the sending of a challenge ACK")                  | Unknown             | Unknown             |
|[rcv-rst-syn-sent-right-edge-secure-ipv6](rcv-rst-syn-sent-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-SENT state triggers the sending of a challenge ACK")                  | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-right-secure-ipv4](rcv-rst-syn-sent-outside-right-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-SENT state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-right-secure-ipv6](rcv-rst-syn-sent-outside-right-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-SENT state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-left-secure-ipv4](rcv-rst-syn-received-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-RECEIVED state does not affect the TCP connection")               | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-left-secure-ipv6](rcv-rst-syn-received-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-RECEIVED state does not affect the TCP connection")               | Unknown             | Unknown             |
|[rcv-rst-syn-received-left-edge-secure-ipv4](rcv-rst-syn-received-left-edge-secure-ipv4   "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-RECEIVED state destroys the TCP connection")                            | Unknown             | Unknown             |
|[rcv-rst-syn-received-left-edge-secure-ipv6](rcv-rst-syn-received-left-edge-secure-ipv6   "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-RECEIVED state destroys the TCP connection")                            | Unknown             | Unknown             |
|[rcv-rst-syn-received-right-edge-secure-ipv4](rcv-rst-syn-received-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-RECEIVED state triggers the sending of a challenge ACK")      | Unknown             | Unknown             |
|[rcv-rst-syn-received-right-edge-secure-ipv6](rcv-rst-syn-received-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-RECEIVED state triggers the sending of a challenge ACK")      | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-right-secure-ipv4](rcv-rst-syn-received-outside-right-secure-ipv4       "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-RECEIVED state does not affect the TCP connection") | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-right-secure-ipv6](rcv-rst-syn-received-outside-right-secure-ipv6       "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-RECEIVED state does not affect the TCP connection") | Unknown             | Unknown             |
|[rcv-rst-established-outside-left-secure-ipv4](rcv-rst-established-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the ESTABLISHED state does not affect the TCP connection")                  | Unknown             | Unknown             |
|[rcv-rst-established-outside-left-secure-ipv6](rcv-rst-established-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the ESTABLISHED state does not affect the TCP connection")                  | Unknown             | Unknown             |
|[rcv-rst-established-left-edge-secure-ipv4](rcv-rst-established-left-edge-secure-ipv4   "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the ESTABLISHED state destroys the TCP connection")                               | Unknown             | Unknown             |
|[rcv-rst-established-left-edge-secure-ipv6](rcv-rst-established-left-edge-secure-ipv6   "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the ESTABLISHED state destroys the TCP connection")                               | Unknown             | Unknown             |
|[rcv-rst-established-right-edge-secure-ipv4](rcv-rst-established-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the ESTABLISHED state triggers the sending of a challenge ACK")         | Unknown             | Unknown             |
|[rcv-rst-established-right-edge-secure-ipv6](rcv-rst-established-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the ESTABLISHED state triggers the sending of a challenge ACK")         | Unknown             | Unknown             |
|[rcv-rst-established-outside-right-secure-ipv4](rcv-rst-established-outside-right-secure-ipv4       "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the ESTABLISHED state does not affect the TCP connection")    | Unknown             | Unknown             |
|[rcv-rst-established-outside-right-secure-ipv6](rcv-rst-established-outside-right-secure-ipv6       "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the ESTABLISHED state does not affect the TCP connection")    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-left-secure-ipv4](rcv-rst-fin-wait-1-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-1 state does not affect the TCP connection")                     | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-left-secure-ipv6](rcv-rst-fin-wait-1-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-1 state does not affect the TCP connection")                     | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-left-edge-secure-ipv4](rcv-rst-fin-wait-1-left-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-1 state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-left-edge-secure-ipv6](rcv-rst-fin-wait-1-left-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-1 state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-right-edge-secure-ipv4](rcv-rst-fin-wait-1-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-1 state triggers the sending of a challenge ACK")            | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-right-edge-secure-ipv6](rcv-rst-fin-wait-1-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-1 state triggers the sending of a challenge ACK")            | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-right-secure-ipv4](rcv-rst-fin-wait-1-outside-right-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-1 state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-right-secure-ipv6](rcv-rst-fin-wait-1-outside-right-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-1 state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-left-secure-ipv4](rcv-rst-fin-wait-2-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-2 state does not affect the TCP connection")                     | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-left-secure-ipv6](rcv-rst-fin-wait-2-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-2 state does not affect the TCP connection")                     | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-left-edge-secure-ipv4](rcv-rst-fin-wait-2-left-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-2 state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-left-edge-secure-ipv6](rcv-rst-fin-wait-2-left-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-2 state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-right-edge-secure-ipv4](rcv-rst-fin-wait-2-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-2 state triggers the sending of a challenge ACK")            | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-right-edge-secure-ipv6](rcv-rst-fin-wait-2-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-2 state triggers the sending of a challenge ACK")            | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-right-secure-ipv4](rcv-rst-fin-wait-2-outside-right-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-2 state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-right-secure-ipv6](rcv-rst-fin-wait-2-outside-right-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-2 state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-left-secure-ipv4](rcv-rst-close-wait-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSE-WAIT state does not affect the TCP connection")                     | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-left-secure-ipv6](rcv-rst-close-wait-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSE-WAIT state does not affect the TCP connection")                     | Unknown             | Unknown             |
|[rcv-rst-close-wait-left-edge-secure-ipv4](rcv-rst-close-wait-left-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSE-WAIT state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-close-wait-left-edge-secure-ipv6](rcv-rst-close-wait-left-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSE-WAIT state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-close-wait-right-edge-secure-ipv4](rcv-rst-close-wait-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSE-WAIT state triggers the sending of a challenge ACK")            | Unknown             | Unknown             |
|[rcv-rst-close-wait-right-edge-secure-ipv6](rcv-rst-close-wait-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSE-WAIT state triggers the sending of a challenge ACK")            | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-right-secure-ipv4](rcv-rst-close-wait-outside-right-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSE-WAIT state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-right-secure-ipv6](rcv-rst-close-wait-outside-right-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSE-WAIT state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-closing-outside-left-secure-ipv4](rcv-rst-closing-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSING state does not affect the TCP connection")                              | Unknown             | Unknown             |
|[rcv-rst-closing-outside-left-secure-ipv6](rcv-rst-closing-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSING state does not affect the TCP connection")                              | Unknown             | Unknown             |
|[rcv-rst-closing-left-edge-secure-ipv4](rcv-rst-closing-left-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSING state destroys the TCP connection")                                             | Unknown             | Unknown             |
|[rcv-rst-closing-left-edge-secure-ipv6](rcv-rst-closing-left-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSING state destroys the TCP connection")                                             | Unknown             | Unknown             |
|[rcv-rst-closing-right-edge-secure-ipv4](rcv-rst-closing-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSING state triggers the sending of a challenge ACK")                     | Unknown             | Unknown             |
|[rcv-rst-closing-right-edge-secure-ipv6](rcv-rst-closing-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSING state triggers the sending of a challenge ACK")                     | Unknown             | Unknown             |
|[rcv-rst-closing-outside-right-secure-ipv4](rcv-rst-closing-outside-right-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSING state does not affect the TCP connection")                      | Unknown             | Unknown             |
|[rcv-rst-closing-outside-right-secure-ipv6](rcv-rst-closing-outside-right-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSING state does not affect the TCP connection")                      | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-left-secure-ipv4](rcv-rst-last-ack-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the LAST-ACK state does not affect the TCP connection")                           | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-left-secure-ipv6](rcv-rst-last-ack-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the LAST-ACK state does not affect the TCP connection")                           | Unknown             | Unknown             |
|[rcv-rst-last-ack-left-edge-secure-ipv4](rcv-rst-last-ack-left-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the LAST-ACK state destroys the TCP connection")                                          | Unknown             | Unknown             |
|[rcv-rst-last-ack-left-edge-secure-ipv6](rcv-rst-last-ack-left-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the LAST-ACK state destroys the TCP connection")                                          | Unknown             | Unknown             |
|[rcv-rst-last-ack-right-edge-secure-ipv4](rcv-rst-last-ack-right-edge-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the LAST-ACK state triggers the sending of a challenge ACK")                  | Unknown             | Unknown             |
|[rcv-rst-last-ack-right-edge-secure-ipv6](rcv-rst-last-ack-right-edge-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the LAST-ACK state triggers the sending of a challenge ACK")                  | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-right-secure-ipv4](rcv-rst-last-ack-outside-right-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the LAST-ACK state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-right-secure-ipv6](rcv-rst-last-ack-outside-right-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the LAST-ACK state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-closed-insecure-ipv4](rcv-rst-closed-insecure-ipv4 "Ensure that the reception of a TCP RST in the CLOSED state does not trigger the sending of a TCP RST")                                                                       | Unknown             | Unknown             |
|[rcv-rst-closed-insecure-ipv6](rcv-rst-closed-insecure-ipv6 "Ensure that the reception of a TCP RST in the CLOSED state does not trigger the sending of a TCP RST")                                                                       | Unknown             | Unknown             |
|[rcv-rst-listen-insecure-ipv4](rcv-rst-listen-insecure-ipv4 "Ensure that the reception of a TCP RST in the LISTEN state does not trigger the sending of a TCP RST")                                                                       | Unknown             | Unknown             |
|[rcv-rst-listen-insecure-ipv6](rcv-rst-listen-insecure-ipv6 "Ensure that the reception of a TCP RST in the LISTEN state does not trigger the sending of a TCP RST")                                                                       | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-left-insecure-ipv4](rcv-rst-syn-sent-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-SENT state does not affect the TCP connection")                         | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-left-insecure-ipv6](rcv-rst-syn-sent-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-SENT state does not affect the TCP connection")                         | Unknown             | Unknown             |
|[rcv-rst-syn-sent-left-edge-insecure-ipv4](rcv-rst-syn-sent-left-edge-insecure-ipv4   "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-SENT state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-syn-sent-left-edge-insecure-ipv6](rcv-rst-syn-sent-left-edge-insecure-ipv6   "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-SENT state destroys the TCP connection")                                    | Unknown             | Unknown             |
|[rcv-rst-syn-sent-right-edge-insecure-ipv4](rcv-rst-syn-sent-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-SENT state destroys the TCP connection")                          | Unknown             | Unknown             |
|[rcv-rst-syn-sent-right-edge-insecure-ipv6](rcv-rst-syn-sent-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-SENT state destroys the TCP connection")                          | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-right-insecure-ipv4](rcv-rst-syn-sent-outside-right-insecure-ipv4       "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-SENT state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-syn-sent-outside-right-insecure-ipv6](rcv-rst-syn-sent-outside-right-insecure-ipv6       "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-SENT state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-left-insecure-ipv4](rcv-rst-syn-received-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-RECEIVED state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-left-insecure-ipv6](rcv-rst-syn-received-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the SYN-RECEIVED state does not affect the TCP connection")             | Unknown             | Unknown             |
|[rcv-rst-syn-received-left-edge-insecure-ipv4](rcv-rst-syn-received-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-RECEIVED state destroys the TCP connection")                          | Unknown             | Unknown             |
|[rcv-rst-syn-received-left-edge-insecure-ipv6](rcv-rst-syn-received-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the SYN-RECEIVED state destroys the TCP connection")                          | Unknown             | Unknown             |
|[rcv-rst-syn-received-right-edge-insecure-ipv4](rcv-rst-syn-received-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-RECEIVED state destroys the TCP connection")              | Unknown             | Unknown             |
|[rcv-rst-syn-received-right-edge-insecure-ipv6](rcv-rst-syn-received-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the SYN-RECEIVED state destroys the TCP connection")              | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-right-insecure-ipv4](rcv-rst-syn-received-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-RECEIVED state does not affect the TCP connection")   | Unknown             | Unknown             |
|[rcv-rst-syn-received-outside-right-insecure-ipv6](rcv-rst-syn-received-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the SYN-RECEIVED state does not affect the TCP connection")   | Unknown             | Unknown             |
|[rcv-rst-established-outside-left-insecure-ipv4](rcv-rst-established-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the ESTABLISHED state does not affect the TCP connection")                | Unknown             | Unknown             |
|[rcv-rst-established-outside-left-insecure-ipv6](rcv-rst-established-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the ESTABLISHED state does not affect the TCP connection")                | Unknown             | Unknown             |
|[rcv-rst-established-left-edge-insecure-ipv4](rcv-rst-established-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the ESTABLISHED state destroys the TCP connection")                             | Unknown             | Unknown             |
|[rcv-rst-established-left-edge-insecure-ipv6](rcv-rst-established-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the ESTABLISHED state destroys the TCP connection")                             | Unknown             | Unknown             |
|[rcv-rst-established-right-edge-insecure-ipv4](rcv-rst-established-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the ESTABLISHED state destroys the TCP connection")                 | Unknown             | Unknown             |
|[rcv-rst-established-right-edge-insecure-ipv6](rcv-rst-established-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the ESTABLISHED state destroys the TCP connection")                 | Unknown             | Unknown             |
|[rcv-rst-established-outside-right-insecure-ipv4](rcv-rst-established-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the ESTABLISHED state does not affect the TCP connection")      | Unknown             | Unknown             |
|[rcv-rst-established-outside-right-insecure-ipv6](rcv-rst-established-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the ESTABLISHED state does not affect the TCP connection")      | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-left-insecure-ipv4](rcv-rst-fin-wait-1-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-1 state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-left-insecure-ipv6](rcv-rst-fin-wait-1-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-1 state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-left-edge-insecure-ipv4](rcv-rst-fin-wait-1-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-1 state destroys the TCP connection")                                | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-left-edge-insecure-ipv6](rcv-rst-fin-wait-1-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-1 state destroys the TCP connection")                                | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-right-edge-insecure-ipv4](rcv-rst-fin-wait-1-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-1 state destroys the TCP connection")                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-right-edge-insecure-ipv6](rcv-rst-fin-wait-1-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-1 state destroys the TCP connection")                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-right-insecure-ipv4](rcv-rst-fin-wait-1-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-1 state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-fin-wait-1-outside-right-insecure-ipv6](rcv-rst-fin-wait-1-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-1 state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-left-insecure-ipv4](rcv-rst-fin-wait-2-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-2 state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-left-insecure-ipv6](rcv-rst-fin-wait-2-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the FIN-WAIT-2 state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-left-edge-insecure-ipv4](rcv-rst-fin-wait-2-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-2 state destroys the TCP connection")                                | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-left-edge-insecure-ipv6](rcv-rst-fin-wait-2-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the FIN-WAIT-2 state destroys the TCP connection")                                | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-right-edge-insecure-ipv4](rcv-rst-fin-wait-2-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-2 state destroys the TCP connection")                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-right-edge-insecure-ipv6](rcv-rst-fin-wait-2-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the FIN-WAIT-2 state destroys the TCP connection")                    | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-right-insecure-ipv4](rcv-rst-fin-wait-2-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-2 state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-fin-wait-2-outside-right-insecure-ipv6](rcv-rst-fin-wait-2-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the FIN-WAIT-2 state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-left-insecure-ipv4](rcv-rst-close-wait-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSE-WAIT state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-left-insecure-ipv6](rcv-rst-close-wait-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSE-WAIT state does not affect the TCP connection")                   | Unknown             | Unknown             |
|[rcv-rst-close-wait-left-edge-insecure-ipv4](rcv-rst-close-wait-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSE-WAIT state destroys the TCP connection")                                | Unknown             | Unknown             |
|[rcv-rst-close-wait-left-edge-insecure-ipv6](rcv-rst-close-wait-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSE-WAIT state destroys the TCP connection")                                | Unknown             | Unknown             |
|[rcv-rst-close-wait-right-edge-insecure-ipv4](rcv-rst-close-wait-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSE-WAIT state destroys the TCP connection")                    | Unknown             | Unknown             |
|[rcv-rst-close-wait-right-edge-insecure-ipv6](rcv-rst-close-wait-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSE-WAIT state destroys the TCP connection")                    | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-right-insecure-ipv4](rcv-rst-close-wait-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSE-WAIT state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-close-wait-outside-right-insecure-ipv6](rcv-rst-close-wait-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSE-WAIT state does not affect the TCP connection")         | Unknown             | Unknown             |
|[rcv-rst-closing-outside-left-insecure-ipv4](rcv-rst-closing-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSING state does not affect the TCP connection")                            | Unknown             | Unknown             |
|[rcv-rst-closing-outside-left-insecure-ipv6](rcv-rst-closing-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the CLOSING state does not affect the TCP connection")                            | Unknown             | Unknown             |
|[rcv-rst-closing-left-edge-insecure-ipv4](rcv-rst-closing-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSING state destroys the TCP connection")                                         | Unknown             | Unknown             |
|[rcv-rst-closing-left-edge-insecure-ipv6](rcv-rst-closing-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the CLOSING state destroys the TCP connection")                                         | Unknown             | Unknown             |
|[rcv-rst-closing-right-edge-insecure-ipv4](rcv-rst-closing-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSING state destroys the TCP connection")                             | Unknown             | Unknown             |
|[rcv-rst-closing-right-edge-insecure-ipv6](rcv-rst-closing-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the CLOSING state destroys the TCP connection")                             | Unknown             | Unknown             |
|[rcv-rst-closing-outside-right-insecure-ipv4](rcv-rst-closing-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSING state does not affect the TCP connection")                  | Unknown             | Unknown             |
|[rcv-rst-closing-outside-right-insecure-ipv6](rcv-rst-closing-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the CLOSING state does not affect the TCP connection")                  | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-left-insecure-ipv4](rcv-rst-last-ack-outside-left-secure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the LAST-ACK state does not affect the TCP connection")                         | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-left-insecure-ipv6](rcv-rst-last-ack-outside-left-secure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT-1 in the LAST-ACK state does not affect the TCP connection")                         | Unknown             | Unknown             |
|[rcv-rst-last-ack-left-edge-insecure-ipv4](rcv-rst-last-ack-left-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the LAST-ACK state destroys the TCP connection")                                      | Unknown             | Unknown             |
|[rcv-rst-last-ack-left-edge-insecure-ipv6](rcv-rst-last-ack-left-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT in the LAST-ACK state destroys the TCP connection")                                      | Unknown             | Unknown             |
|[rcv-rst-last-ack-right-edge-insecure-ipv4](rcv-rst-last-ack-right-edge-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the LAST-ACK state destroys the TCP connection")                          | Unknown             | Unknown             |
|[rcv-rst-last-ack-right-edge-insecure-ipv6](rcv-rst-last-ack-right-edge-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND-1 in the LAST-ACK state destroys the TCP connection")                          | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-right-insecure-ipv4](rcv-rst-last-ack-outside-right-insecure-ipv4 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the LAST-ACK state does not affect the TCP connection")               | Unknown             | Unknown             |
|[rcv-rst-last-ack-outside-right-insecure-ipv6](rcv-rst-last-ack-outside-right-insecure-ipv6 "Ensure that the reception of a TCP RST with SEG.SEQ=RCV.NXT+RCV.WND in the LAST-ACK state does not affect the TCP connection")               | Unknown             | Unknown             |

## Notes
1. The `systcl`-variable `net.inet.tcp.insecure_rst` is not described in `man 4 tcp`.
2. The condition in [RFC 5961](https://tools.ietf.org/html/rfc5961#section-3.2) defining
   `outside the current receive window` should read
   `(SEG.SEQ < RCV.NXT || SEG.SEQ >= RCV.NXT + RCV.WND)`
   instead of
   `(SEG.SEQ <= RCV.NXT || SEG.SEQ > RCV.NXT + RCV.WND)`.