polipo-tor
==========
This container will start and expose a HTTP Proxy (polipo) on port 8118. Polipo is runnings as tcp to socks bridge to Tor.

Usage
-----

Files
-----
* `polipo.conf`: polipo configuration
* `supervisor_tor.conf`: supervisord configuration to start polipo and Tor
* `torrc`: tor configuration
