# textile-opts

![banner](https://s3.amazonaws.com/textile.public/Textile_Logo_Horizontal.png)

---

## Network

#### Global Discovery (latency-based)

- [Nearest Gateway](https://gateway.textile.cafe)
- [Nearest Cafe](https://gateway.textile.cafe/cafe)
- [Nearest primary/secondary Cafes](https://gateway.textile.cafe/cafes)

#### us-west-1

| Cafe | Swarm IPv4 | Peer | API | Gateway |
| --- | --- | --- | --- | --- |
| `1a` | `18.144.12.135` | `12D3KooWGBW3LfzypK3zgV4QxdPyUm3aEuwBDMKRRpCPm9FrJvar` | [us-west-1a](https://us-west-1a.textile.cafe) | [us-west-1](https://gateway.us-west-1.textile.cafe) |
| `1c` | `13.57.23.210` | `12D3KooWQue2dSRqnZTVvikoxorZQ5Qyyug3hV65rYnWYpYsNMRE` | [us-west-1c](https://us-west-1c.textile.cafe) | [us-west-1](https://gateway.us-west-1.textile.cafe) |
| `beta` | `13.56.163.77` | `12D3KooWFrrmGJcQhE5h6VUvUEXdLH7gPKdWh2q4CEM62rFGcFpr` | [us-west-beta](https://us-west-beta.textile.cafe) | [us-west-beta](https://us-west-beta.textile.cafe/ipfs) |
| `dev` | `52.53.127.155` | `12D3KooWGN8VAsPHsHeJtoTbbzsGjs2LTmQZ6wFKvuPich1TYmYY` | [us-west-dev](https://us-west-dev.textile.cafe) | [us-west-dev](https://us-west-dev.textile.cafe/ipfs) |
| `dev internal` | `54.219.142.88` | `12D3KooWLaJnBr1bqWkZCDhaFeGxKiCP91rt2gQ8rn7Lx7kcKAMY` | [54.219.142.88:40601](http://54.219.142.88:40601) | [54.219.142.88:5050](http://54.219.142.88:5050) |

#### us-east-2

| Cafe | Swarm IPv4 | Peer | API | Gateway |
| --- | --- | --- | --- | --- |
| `2a` | `18.221.167.133` | `12D3KooWERmHT6g4YkrPBTmhfDLjfi8b662vFCfvBXqzcdkPGQn1` | [us-east-2a](https://us-east-2a.textile.cafe) | [us-east-2](https://gateway.us-east-2.textile.cafe) |
| `2b` | `18.224.173.65` | `12D3KooWLh9Gd4C3knv4XqCyCuaNddfEoSLXgekVJzRyC5vsjv5d` | [us-east-2b](https://us-east-2b.textile.cafe) | [us-east-2](https://gateway.us-east-2.textile.cafe) |

#### eu-west-3

| Cafe | Swarm IPv4 | Peer | API | Gateway |
| --- | --- | --- | --- | --- |
| `3a` | `35.180.16.103` | `12D3KooWDhSfXZCBVAK6SNQu7h6mfGCBJtjMS44PW5YA5YCjVmjB` | [eu-west-3a](https://eu-west-3a.textile.cafe) | [eu-west-3](https://gateway.eu-west-3.textile.cafe) |
| `3b` | `35.180.35.45` | `12D3KooWBCZEDkZ2VxdNYKLLUACWbXMvW9SpVbbvoFR9CtH4qJv9` | [eu-west-3b](https://eu-west-3b.textile.cafe) | [eu-west-3](https://gateway.eu-west-3.textile.cafe) |

#### ap-southeast-1

| Cafe | Swarm IPv4 | Peer | API | Gateway |
| --- | --- | --- | --- | --- |
| `1a` | `13.250.53.27` | `12D3KooWQ5MR9Ugz9HkVU3fYFbiWbQR4jxKJB66JoSY7nP5ShsqQ` | [ap-southeast-1a](https://ap-southeast-1a.textile.cafe) | [ap-southeast-1](https://gateway.ap-southeast-1.textile.cafe) |
| `1b` | `3.1.49.130` | `12D3KooWDWJ473M3fXMEcajbaGtqgr6i6SvDdh5Ru9i5ZzoJ9Qy8` | [ap-southeast-1b](https://ap-southeast-1b.textile.cafe) | [ap-southeast-1](https://gateway.ap-southeast-1.textile.cafe) |

## Usage

#### Initialize a new Cafe

```
$ ./init.sh -k <key_file> -r <release_tag> -p <public_ip> -u <https_url> -t <token>
```

#### Upgrade a Cafe

```
$ ./upgrade.sh -k <key_file> -r <release_tag> -p <public_ip>
```

#### Upgrade all Cafes

```
$ ./upgrade-all.sh -r <release_tag>
```
