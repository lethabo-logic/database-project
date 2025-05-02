-- Create table: Specialization
CREATE TABLE Specialization (
    specialization_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Create table: Doctor
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Junction table for Doctor <-> Specialization (M-M)
CREATE TABLE DoctorSpecialization (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(specialization_id)
);

-- Create table: Patient
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE
);

-- Create table: Appointment
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    appointment_date DATETIME NOT NULL,
    notes TEXT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Sample Data
INSERT INTO Specialization (name) VALUES ('Cardiology'), ('Dermatology'), ('Pediatrics');

INSERT INTO Doctor (name, email) VALUES 
('Dr. Smith', 'smith@example.com'),
('Dr. Jones', 'jones@example.com');

INSERT INTO DoctorSpecialization (doctor_id, specialization_id) VALUES 
(1, 1), (2, 2), (2, 3);

INSERT INTO Patient (name, phone) VALUES 
('Alice Johnson', '1234567890'),
('Bob Lee', '0987654321');

INSERT INTO Appointment (doctor_id, patient_id, appointment_date, notes) VALUES
(1, 1, '2025-05-10 10:00:00', 'Routine checkup'),
(2, 2, '2025-05-12 14:30:00', 'Skin rash consultation');
