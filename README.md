# issue-examples

This repo is for sharing very specific Vector setups, usually for the purpose of documenting and reproducing external issues.

# Repo Setup

- `docker/` - example Docker Compose files with specific services
- `configs/` - example Vector configs
- `issues/` - directories corresponding to complete Vector setups

# Example

```bash
$ mkdir issues/$MY_ISSUE
$ cp configs/vector.toml issues/$MY_ISSUE/
$ cp docker/docker-compose.toml issues/$MY_ISSUE/
$ cd issues/$MY_ISSUE/ && docker-compose up
```
