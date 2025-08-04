## Task
The tool should run from the command line, accept the log directory as an argument, compress the logs, and store them in a new directory. The user should be able to:

Provide the log directory as an argument when running the tool.
```shell
log-archive <log-directory>
```
The tool should compress the logs in a tar.gz file and store them in a new directory.
The tool should log the date and time of the archive to a file.
```shell
logs_archive_20240816_100648.tar.gz
```

## How to use

- Upload script on the server
- Give executable rights - `chmod +x log-archive.sh`
- Run script - `./log-archive.sh`
