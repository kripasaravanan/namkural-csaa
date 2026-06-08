-- ============================================================
-- NamKural — நம் குரல் Database Schema
-- MySQL 8.0+
-- ============================================================

CREATE DATABASE IF NOT EXISTS namkural CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE namkural;

-- Users (admin and registered participants)
CREATE TABLE users (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(200)  NOT NULL,
  email      VARCHAR(255)  NOT NULL UNIQUE,
  role       VARCHAR(50)   NOT NULL DEFAULT 'user',
  created_at DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_email (email),
  INDEX idx_role  (role)
);

-- Cybersecurity assessments
CREATE TABLE assessments (
  id                INT AUTO_INCREMENT PRIMARY KEY,
  user_id           INT           NULL,
  organization_name VARCHAR(255)  NULL,
  industry          VARCHAR(100)  NULL,
  profile_type      VARCHAR(50)   NULL COMMENT 'small_business|nonprofit|senior|student|immigrant|general',
  score             INT           NOT NULL DEFAULT 0,
  risk_level        VARCHAR(50)   NOT NULL DEFAULT 'unknown' COMMENT 'low|medium|high',
  answers_json      JSON          NULL COMMENT 'Raw question answers',
  ai_report_json    JSON          NULL COMMENT 'VAI-generated report content',
  created_at        DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
  INDEX idx_score      (score),
  INDEX idx_risk_level (risk_level),
  INDEX idx_profile    (profile_type),
  INDEX idx_created    (created_at)
);

-- Volunteer network
CREATE TABLE volunteers (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(255) NOT NULL,
  email      VARCHAR(255) NOT NULL UNIQUE,
  state      VARCHAR(100) NOT NULL,
  skills     TEXT         NULL,
  why_text   TEXT         NULL,
  status     VARCHAR(50)  NOT NULL DEFAULT 'pending' COMMENT 'pending|active|ambassador',
  created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_state  (state),
  INDEX idx_status (status)
);

-- Workshops and community events
CREATE TABLE workshops (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  title          VARCHAR(255) NOT NULL,
  description    TEXT         NULL,
  workshop_date  DATE         NOT NULL,
  location       VARCHAR(255) NULL,
  format         VARCHAR(50)  NULL COMMENT 'online|in-person|hybrid',
  participants   INT          NOT NULL DEFAULT 0,
  created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_date (workshop_date)
);

-- Workshop registrations
CREATE TABLE workshop_registrations (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  workshop_id INT          NOT NULL,
  name        VARCHAR(255) NOT NULL,
  email       VARCHAR(255) NOT NULL,
  registered_at DATETIME   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (workshop_id) REFERENCES workshops(id) ON DELETE CASCADE,
  UNIQUE KEY uq_workshop_email (workshop_id, email)
);
