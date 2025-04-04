-- Drop database if exists and create new one
DROP DATABASE IF EXISTS portfolio_db;
CREATE DATABASE portfolio_db;

-- Switch to using the portfolio database
USE portfolio_db;

-- Create table for contact messages
CREATE TABLE contact_messages
(
    id INT NOT NULL
    AUTO_INCREMENT,
    name VARCHAR
    (100) NOT NULL,
    email VARCHAR
    (100) NOT NULL,
    subject VARCHAR
    (200) NOT NULL,
    (200) NOT NULL,
    phone VARCHAR
    (20),
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
    (id)
);

    -- Create table for projects/portfolio items
    CREATE TABLE projects
    (
        id INT NOT NULL
        AUTO_INCREMENT,
    title VARCHAR
        (200) NOT NULL,
    description TEXT,
    image_url VARCHAR
        (255),
    project_url VARCHAR
        (255),
    github_url VARCHAR
        (255),
    category VARCHAR
        (50),
    technologies VARCHAR
        (255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON
        UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY
        (id)
);

        -- Create table for skills
        CREATE TABLE skills
        (
            id INT NOT NULL
            AUTO_INCREMENT,
    name VARCHAR
            (100) NOT NULL,
    category VARCHAR
            (50),
    proficiency INT,
    icon_class VARCHAR
            (50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
            (id),
    CONSTRAINT check_proficiency CHECK
            (proficiency BETWEEN 0 AND 100)
);

            -- Create table for testimonials
            CREATE TABLE testimonials
            (
                id INT NOT NULL
                AUTO_INCREMENT,
    client_name VARCHAR
                (100) NOT NULL,
    client_position VARCHAR
                (100),
    company VARCHAR
                (100),
    testimonial TEXT NOT NULL,
    client_image VARCHAR
                (255),
    rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
                (id),
    CONSTRAINT check_rating CHECK
                (rating BETWEEN 1 AND 5)
);

                -- Create table for education
                CREATE TABLE education
                (
                    id INT NOT NULL
                    AUTO_INCREMENT,
    institution VARCHAR
                    (200) NOT NULL,
    degree VARCHAR
                    (200) NOT NULL,
    field_of_study VARCHAR
                    (200),
                    (200),
    start_date DATE,
    end_date DATE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
                    (id)
);

                    -- Create table for experience
                    CREATE TABLE experience
                    (
                        id INT NOT NULL
                        AUTO_INCREMENT,
    company VARCHAR
                        (200) NOT NULL,
    position VARCHAR
                        (200) NOT NULL,
    location VARCHAR
                        (200),
                        (200),
    start_date DATE,
    end_date DATE,
    description TEXT,
    responsibilities TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
                        (id)
);

                        -- Create table for certifications
                        CREATE TABLE certifications
                        (
                            id INT NOT NULL
                            AUTO_INCREMENT,
    name VARCHAR
                            (200) NOT NULL,
    issuing_organization VARCHAR
                            (200) NOT NULL,
    issue_date DATE,
    expiry_date DATE,
    credential_id VARCHAR
                            (100),
    credential_url VARCHAR
                            (255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY
                            (id)
);

                            -- Create indexes for better performance
                            CREATE INDEX idx_email ON contact_messages(email);
                            CREATE INDEX idx_project_category ON projects(category);
                            CREATE INDEX idx_skill_category ON skills(category);
                            CREATE INDEX idx_experience_company ON experience(company);
