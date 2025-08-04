## Task
The goal of this project is to get familiar with systemd; creating and enabling a service, checking the status, keeping an eye on the logs, starting and stopping the service, etc.

### Requirements

Create a script called dummy.sh that keeps running forever and writes a message to the log file every 10 seconds simulating an application running in the background. Here is an example script:
```shell
#!/bin/bash

while true; do
  echo "Dummy service is running..." >> /var/log/dummy-service.log
  sleep 10
done
```
Create a systemd service dummy.service that should start the app automatically on boot and keep it running in the background. If the service fails for any reason, it should automatically restart.

You should be able to start, stop, enable, disable, check the status of the service, and check the logs i.e. following commands should be available for the service:
```shell
# Interacting with the service
sudo systemctl start dummy
sudo systemctl stop dummy
sudo systemctl enable dummy
sudo systemctl disable dummy
sudo systemctl status dummy

# Check the logs
sudo journalctl -u dummy -f
```

## How to use

- Upload files on the server in /home/user for example
- Move service file to /etc/systemd/system by `sudo mv dummy.service /etc/systemd/system/`
- Create directory for script and move script to it by:
```shell
sudo mkdir /opt/dummy
sudo mv dummy.sh /opt/dummy/
sudo chmod +x /opt/dummy/dummy.sh
```
- Reload systemd configuration by `sudo systemctl daemon-reload`
- Enable service by `sudo systemctl enable dummy`
- Start service by `sudo systemctl start dummy`