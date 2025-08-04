## Task
The goal of this project is to help you practice some basic shell scripting skills. You will write a simple tool to analyze logs from the command line.

### Requirements
Download the sample nginx access log file from here. The log file contains the following fields:

- IP address
- Date and time
- Request method and path
- Response status code
- Response size
- Referrer
- User agent

You are required to create a shell script that reads the log file and provides the following information:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

## How to use
Solution contains python and shell scripts.

### Shell
- Upload script on the server
- Give executable rights - `chmod +x analyser.sh`
- Run script - `./analyser.sh /var/log/nginx/access.log`

The script takes 2 arguments:
- Log path
- How many rows do you need, 5 by default


### Python

- Upload script on the server
- Run script - `python3 analyser.py -p /var/log/nginx/access.log -t 5`


The script takes 2 arguments:
- Log path
- How many rows do you need, 5 by default