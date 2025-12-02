CREATE TABLE team (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(150) NOT NULL,
  bio TEXT,
  expertise VARCHAR(150)
);

INSERT INTO team (name, role, bio, expertise)
VALUES ('Muzzammil', 'CEO', '10+ years leading tech companies', 'Leadership');

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    image VARCHAR(255),
    title VARCHAR(200) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    tags TEXT[],                      -- Array of tags
    users_metric VARCHAR(50),         -- e.g., '50K+'
    revenue_metric VARCHAR(50),       -- e.g., '+200%'
    performance_metric VARCHAR(20)    -- e.g., '98%'
);

INSERT INTO projects 
(image, title, category, description, tags, users_metric, revenue_metric, performance_metric)
VALUES (
    'project1.jpg',
    'E-Commerce Platform',
    'Web Development',
    'A comprehensive e-commerce solution with advanced inventory management, payment integration, and analytics dashboard. Built with React, Node.js, and PostgreSQL.',
    ARRAY['React', 'Node.js', 'PostgreSQL', 'Stripe'],
    '50K+',
    '+200%',
    '98%'
);


CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    icon VARCHAR(100),            -- store icon name or icon identifier
    title VARCHAR(150) NOT NULL,
    description TEXT,
    features TEXT[]               -- array of features
);

INSERT INTO services (icon, title, description, features)
VALUES (
    'Code',
    'Web Development',
    'Custom web applications built with modern frameworks and best practices',
    ARRAY['React & Next.js', 'Full-Stack Solutions', 'API Development', 'Performance Optimization']
);

CREATE TABLE plans (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price VARCHAR(20),
    period VARCHAR(20),
    description TEXT,
    icon VARCHAR(100),
    features TEXT[],       -- Array of features
    popular BOOLEAN DEFAULT false
);
