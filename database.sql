-- ==========================================
-- PowerLock Database Schema
-- ==========================================

-- 1. Landlord Table (Identity Management)
CREATE TABLE IF NOT EXISTS landlord (
    landlord_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tenant Table (Credit Tracking & Room Assignment)
CREATE TABLE IF NOT EXISTS tenant (
    tenant_id INT AUTO_INCREMENT PRIMARY KEY,
    landlord_id INT,
    name VARCHAR(100) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    current_balance DECIMAL(10, 2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (landlord_id) REFERENCES landlord(landlord_id) ON DELETE CASCADE
);

-- 3. Meter Table (Hardware Device Association)
CREATE TABLE IF NOT EXISTS meter (
    meter_id INT AUTO_INCREMENT PRIMARY KEY,
    tenant_id INT,
    device_id VARCHAR(50) UNIQUE NOT NULL,
    relay_status BOOLEAN DEFAULT TRUE,
    installed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tenant_id) REFERENCES tenant(tenant_id) ON DELETE SET NULL
);

-- 4. Meter Telemetry Table (Real-time Power Consumption Data)
CREATE TABLE IF NOT EXISTS meter_telemetry (
    telemetry_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    meter_id INT NOT NULL,
    voltage DECIMAL(6, 2) NOT NULL,
    current DECIMAL(6, 2) NOT NULL,
    active_power DECIMAL(8, 2) NOT NULL,
    total_kwh DECIMAL(10, 3) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (meter_id) REFERENCES meter(meter_id) ON DELETE CASCADE
);