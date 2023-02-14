Reproduction of https://github.com/vectordotdev/vector/issues/16309.

Run:

* `DD_API_KEY=<valid API key> vector --config vector.yaml` in one window
* `vector top` in another window
* `DD_API_KEY=<valid API key> datadog-agent -c datadog.yaml` in the last
* Wait for the Agent to publish metrics through Vector and observe if the events
  in/out for the `datadog_agent` source increment correctly
