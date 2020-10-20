# Sandboxed environment for Privat24 «crypto-plugin»

Largest Ukrainian bank, Privatbank, force their clients to installing 
closed-source software for doing their online banking.

I put their plugin to Docker container.


## Sample usage

```sh
docker run -it --rm -p5900:5900 \
    -v `pwd`/data:/home/user/data \
    -v `pwd`/mozilla:/home/user/.mozilla \
    kastaneda/p24_sandbox
```

And then run `vncviewer 127.0.0.1`


## Security note

There is no VNC security. I might concider do it later.
