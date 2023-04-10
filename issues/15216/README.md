Reproduction of https://github.com/vectordotdev/vector/issues/15216

Pre-requisites:

* Checkout v0.25.1 of vector and build it
* Install ApacheBench with: `$ apt-get install apache2-utils`
* if using a default ulimit, increase it `$ ulimit -n 1000000`

Steps:

* Run `VECTOR_LOG=debug ./target/debug/vector -c vector.toml` in one console
* Run `ab -n 2947 -c 2947  localhost:8181/tmp/foo` in a different console
* The vector process should end and you should see something like:

```
2023-04-10T22:31:06.270407Z DEBUG source{component_kind="source" component_id=vdc component_type=http_server component_name=vdc}: vector::topology::builder: Source pump finished normally.
2023-04-10T22:31:06.270696Z DEBUG source{component_kind="source" component_id=vdc component_type=http_server component_name=vdc}: vector::topology::builder: Source pump supervisor task finished normally.
2023-04-10T22:31:06.270761Z DEBUG sink{component_kind="sink" component_id=sink1 component_type=blackhole component_name=sink1}: vector::topology::builder: Sink finished normally.
2023-04-10T22:31:06.270938Z  INFO vector::sinks::blackhole::sink: Collected events. events=124 raw_bytes_collected=62868
2023-04-10T22:31:06.271231Z DEBUG hyper::server::shutdown: signal received, starting graceful shutdown
```
