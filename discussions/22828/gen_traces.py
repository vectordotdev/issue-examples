import time
from ddtrace import tracer

def send_fake_trace():
    with tracer.trace("fake.span", service="pront", resource="GET /example") as span:
        span.set_tag("env", "local")
        print("Sent a fake trace")

if __name__ == "__main__":
    while True:
        send_fake_trace()
        time.sleep(10)
