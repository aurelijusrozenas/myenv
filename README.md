# Bits of config and software I use

If you're not me, use with caution.

Works on Ubuntu 14.04 (I think, haven't tested for some time) or later.
`bin/` and `node_modules/.bin/` should be in PATH - as done in [.config/bin/config.fish](.config/bin/config.fish).

Installing on fresh machine involves `./full-machine.sh` (`machine.sh` if low on time/space), then `./PULL.sh`.
Per-user installation involves `./user.sh` and for me `beni.sh`.
Updating involves `PULL.sh` then committing (if submodules got updated) and re-running `machine.sh` etc. (if they changed).
I'm striving for *.sh to be idempotent.

License: Do whatever you want.  https://creativecommons.org/publicdomain/zero/1.0/