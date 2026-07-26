USE defaultdb;

-- 1. Insert a Dummy Landlord
INSERT INTO landlord (name, email, phone_number) VALUES
('Ramesh Gupta', 'ramesh.gupta@example.com', '9876543210');

-- 2. Insert Dummy Tenants (Assigned to Landlord #1)
INSERT INTO tenant (landlord_id, name, room_number, current_balance) VALUES
(1, 'Arijit Sen', 'Room 101', 500.00),   -- Healthy balance
(1, 'Priya Das', 'Room 102', 20.50),     -- Low balance warning
(1, 'Karan Singh', 'Room 103', -15.00);  -- Negative balance (Power should be cut)

-- 3. Insert Dummy Meters (Assigned to Tenants 1, 2, and 3)
INSERT INTO meter (tenant_id, device_id, relay_status) VALUES
(1, 'ESP32_METER_101', TRUE),            -- Power ON
(2, 'ESP32_METER_102', TRUE),            -- Power ON
(3, 'ESP32_METER_103', FALSE);           -- Power OFF (Relay triggered due to balance)

-- 4. Insert Dummy Telemetry Data (Simulating hardware readings)
INSERT INTO meter_telemetry (meter_id, voltage, current, active_power, total_kwh) VALUES
(1, 228.5, 4.2, 959.7, 124.500),
(1, 229.1, 4.3, 985.1, 124.550),
(2, 230.0, 1.2, 276.0, 45.100),
(2, 229.8, 1.1, 252.7, 45.120);