-- ************************************************************
-- Project: Database Security & Maintenance Script
-- Focus: User Roles and Data Safety
-- ************************************************************

-- 1. Create specialized roles for Supermarket Staff
-- Cashier: Can only see products and create sales
CREATE ROLE Cashier_Role;
GRANT SELECT ON Products TO Cashier_Role;
GRANT INSERT ON Sales TO Cashier_Role;

-- Manager: Full access to reports and inventory
CREATE ROLE Manager_Role;
GRANT ALL PRIVILEGES TO Manager_Role;

-- 2. Audit Trail Table
-- To track who changed the prices (Important for security)
CREATE TABLE Price_Audit_Log (
    log_id INT PRIMARY KEY,
    product_id INT,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(50)
);

-- 3. Optimization: Creating Indexes
-- Makes searching for products by Barcode much faster
CREATE INDEX idx_product_barcode ON Products(barcode);
