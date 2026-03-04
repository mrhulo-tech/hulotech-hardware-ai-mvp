-- HuloTech Hardware AI Platform
-- MVP Database Schema

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--------------------------------------------------
-- USERS
--------------------------------------------------

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email TEXT UNIQUE,
    role TEXT DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- SESSIONS
--------------------------------------------------

CREATE TABLE sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id),
    postal_code TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- PRODUCTS
--------------------------------------------------

CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sku TEXT UNIQUE,
    title TEXT,
    brand TEXT,
    category TEXT,
    price NUMERIC,
    attributes JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- STORES
--------------------------------------------------

CREATE TABLE stores (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT,
    city TEXT,
    postal_code TEXT,
    lat FLOAT,
    lng FLOAT,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- INVENTORY
--------------------------------------------------

CREATE TABLE inventory (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    store_id UUID REFERENCES stores(id),
    sku TEXT REFERENCES products(sku),
    quantity INTEGER,
    updated_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- PROJECTS
--------------------------------------------------

CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id UUID REFERENCES sessions(id),
    title TEXT,
    prompt TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- PROJECT ITEMS
--------------------------------------------------

CREATE TABLE project_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id),
    sku TEXT,
    description TEXT,
    quantity INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- CARTS
--------------------------------------------------

CREATE TABLE carts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id UUID REFERENCES sessions(id),
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- CART ITEMS
--------------------------------------------------

CREATE TABLE cart_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    cart_id UUID REFERENCES carts(id),
    sku TEXT,
    quantity INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- IMAGE SCANS
--------------------------------------------------

CREATE TABLE image_scans (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id UUID REFERENCES sessions(id),
    image_url TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- VISION RESULTS
--------------------------------------------------

CREATE TABLE vision_results (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    image_scan_id UUID REFERENCES image_scans(id),
    result JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);

--------------------------------------------------
-- ANALYTICS EVENTS
--------------------------------------------------

CREATE TABLE events (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_id UUID,
    event_name TEXT,
    data JSONB,
    created_at TIMESTAMP DEFAULT NOW()
);
