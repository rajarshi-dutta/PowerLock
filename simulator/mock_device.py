import time
import random
import requests

API_URL = "http://localhost:8000/api/hardware/telemetry"
device_id = "ESP32_METER_101"

print(f"Starting Mock Hardware Device for {device_id}...")

while True:
    # THIS IS WHERE THE JSON IS CREATED AUTOMATICALLY BY PYTHON
    payload = {
        "device_id": device_id,
        "voltage": round(random.uniform(220.0, 235.0), 2),
        "current": round(random.uniform(1.0, 5.0), 2),
        "active_power": round(random.uniform(200.0, 1100.0), 2),
        "total_kwh": 124.500
    }

    try:
        # Python takes that 'payload' and converts it into JSON to send it
        response = requests.post(API_URL, json=payload)
        if response.status_code == 200:
            print(f"Data sent successfully: {payload}")
        else:
            print(f"Server responded with status {response.status_code}")
    except Exception as e:
        print(f"Connection failed: {e}")

    time.sleep(5)