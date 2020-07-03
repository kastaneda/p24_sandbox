# Sandboxed environment for Privat24 «crypto-plugin»

Largest Ukrainian bank, Privatbank, force their clients to installing 
closed-source software for doing their online banking.

```sh
docker build -t my-p24 .
docker run -it --rm -p 5900:5900 -v `pwd`/home:/home/ubuntu my-p24
# ./home/ubuntu/start.sh

vncviewer 127.0.0.1::5900
# right-click -> Terminal Emulator
# xterm -> chromium-browser --no-sandbox
```
