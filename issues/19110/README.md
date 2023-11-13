Reproduction of https://github.com/vectordotdev/vector/issues/19110


Reproducing this issue requires sending HTTP request payloads that are large enough to hit the payload limits of the series v2 endpoint.

# Steps

* Generate the input events file
* Start vector v0.34.0 using the vector.toml config which accepts statsd metrics and sends to Datadog.
* Send metrics to Vector
* Observe the 413 errors and lack of metrics in the DD UI


# Generating the input file

The metrics must be unique so as not to be aggregated.

```bash
for i in {1..6666000}
do
  echo "foo_1:1|c|#tag:$i" >> events.txt
done
```
  
# Start Vector

(Debug log level needs to be set in order to confirm the 413 HTTP status code)

```bash
vector -c ./vector.toml -v
```

# Sending the metrics

```bash
socat -dd OPEN:events.txt TCP:localhost:9000
```

