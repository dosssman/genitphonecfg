# genitphonecfg

## Naming

`m/`: male
`f/`: female

## Memo / TODO: Nested SSH tunnels

[MyPC]
[Middle Node] with public IP
[TargetPC]

1. [TargetPC]: `ssh -R 3333:localhost:8022 middle-node` # Incoming @middle-node:3333 -> targetpc:8022
2. [MyPC]: `ssh -L 3333:localhost:3333 middle-node` # Incoming @mypc:3333 -> middle-node:3333 -> targetpc:8022
3. [MyPC]: `ssh -L 5900:locahost:5900 localhost:3333` # Incoming @mypc:5900 -> targetpc:5900 directly

In other words, 3. creates a tunnel through the already existing tunnel ... ?
