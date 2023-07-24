See https://github.com/vectordotdev/vector/issues/18008#issuecomment-1648612861

After getting the graylog server running locally,

Using this guide from the graylog docs https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm?tocpath=Downloading%20and%20Installing%20Graylog%7CInstalling%20Graylog%7C_____2#HowtoGetinLogData

, set up an input for GELF/TCP to 12201.

Start vector using the provided config.

Run the following. After a minute or so, should see the error in the graylog server and vector logs.

while true; do
  echo '{ "version": "1.1", "host": "example.org", "short_message": "A short message that helps you identify what is going on", "full_message": "Backtrace her", "timestamp": 1385053862, "level": 1, "_user_id": 9001, "_some_info": "foo", "_some_env_var": "bar" }' | nc localhost 5555
done