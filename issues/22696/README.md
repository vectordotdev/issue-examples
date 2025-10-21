# Issue 22696: OpenTelemetry HTTP OTLP Decoding Error

* **Issue Link:** https://github.com/vectordotdev/vector/issues/22696
* **Related Comment:** https://github.com/vectordotdev/vector/issues/22696#issuecomment-3362346028

## Problem

Vector fails to decode OTLP protobuf data when using `use_otlp_decoding: true` on an `opentelemetry` source, resulting in:

```
Error parsing protobuf: DecodeError { description: "invalid wire type value: 7"...
```

## Reproduction

```bash
# Stop any existing containers
docker-compose down 2>/dev/null || true

# Start the stack in detached mode
docker-compose up -d

# Wait for services to be ready
sleep 2

# Send test logs
telemetrygen logs --otlp-insecure --otlp-http --logs=100 --rate=0

sleep 2

# Check logs for the error
docker-compose logs otel-collector-source
```

You should see an export error from the OTEL collector source like:
```
error exporting items, request to http://vector:4320/v1/logs responded with HTTP Status Code 400,
Message=Invalid OTLP data: expected one of {Logs}
```

This error occurs because **Vector is rejecting the OTLP protobuf data** it receives.

## Expected vs Actual

**Expected:** Vector receives OTLP logs, decodes them, and forwards to the downstream collector.

**Actual:** Vector fails with a protobuf wire type error and returns HTTP 400.

---

## Appendix

### Architecture

```
┌──────────────┐         ┌─────────────────────┐         ┌────────┐         ┌─────────────────────┐
│ telemetrygen │  OTLP   │ OTEL Collector      │  OTLP   │ Vector │  OTLP   │ OTEL Collector      │
│              │────────>│ (Source)            │────────>│        │────────>│ (Sink)              │
│              │ :4318   │                     │ :4320   │        │ :5318   │ debug + file        │
└──────────────┘  HTTP   └─────────────────────┘  HTTP   └────────┘  HTTP   └─────────────────────┘
```

### Prerequisites

- Docker and Docker Compose
- `telemetrygen` (see installation below)

### Installing telemetrygen

**macOS:**
```bash
brew install telemetrygen
```

**Linux/Other:**
```bash
# Download from releases
# https://github.com/open-telemetry/opentelemetry-collector-contrib/releases

# Or build from source:
git clone https://github.com/open-telemetry/opentelemetry-collector-contrib.git
cd opentelemetry-collector-contrib/cmd/telemetrygen
go install .
```
