# MySQL-specific code to create tables for doit server.


# di_site_details contains details about this node.
CREATE TABLE di_site_details (
  uuid               CHAR(36)       NOT NULL,   # UUID identifying this site.
  name               VARCHAR(64)    NOT NULL,   # Name for this site.
  uri                VARCHAR(256)               # URI at which the server is available to its users.
);


# di_users contains users registered with this site.
CREATE TABLE di_users (
  uuid               CHAR(36)       NOT NULL,   # User UUID.
  login              VARCHAR(32)    NOT NULL,   # User login.
  password           CHAR(32)       NOT NULL,   # Password hash.
  name               VARCHAR(64)    NOT NULL,   # User name.
  email              VARCHAR(64)    NOT NULL,   # User email.
  PRIMARY KEY (login)
);


# di_projects contains projects (jobs, or gigs) known to this site (local and remote).
CREATE TABLE di_projects (
  uuid               CHAR(36)       NOT NULL,   # UUID of the auction, generated by the site.
  origin             CHAR(36)       NOT NULL,   # Originating node UUID.
  owner_uuid         CHAR(36)       NOT NULL,   # Project owner UUID.
  name               VARCHAR(256)   NOT NULL,   # Project name.
  description        TEXT           NOT NULL,   # Project description.
  image_uri          VARCHAR(256),              # Image URI.
  created_timestamp  CHAR(19)       NOT NULL,   # Creation timestamp in format like "2016-04-08 15:00:10".
  close_timestamp    CHAR(19)       NOT NULL,   # Close timestamp in format like "2016-04-15 15:00:10".
  currency           CHAR(3)        NOT NULL,   # Currency: USD, CAD, NZD, etc.
  budget             NUMERIC(15,2),             # Project initial budget.
  status             INTEGER,                   # Project status.
  PRIMARY KEY (uuid)
);
# TODO: add indexes.


# di_project_comments contans comments (such as questions and answers) about the project.
CREATE TABLE di_project_comments(
  uuid               CHAR(36)       NOT NULL,   # UUID of the project comment.
  parent_uuid        CHAR(36)       NOT NULL,   # UUID of a parent comment.
  project_uuid       CHAR(36)       NOT NULL,   # Project UUID.
  user_uuid          CHAR(36)       NOT NULL,   # User UUID.
  origin             CHAR(36),                  # Site UUID for comment origin.
  comment            TEXT           NOT NULL,   # A text of the comment.
  created_timestamp  CHAR(19)       NOT NULL,   # Comment creation timestamp in format like "2016-04-08 15:01:10".
  status             INTEGER,                   # Status of the comment.
  PRIMARY KEY (uuid)
);


# di_bids contains bids known to ths server.
CREATE TABLE di_bids (
  uuid               CHAR(36)       NOT NULL,   # UUID of the bid.
  origin             CHAR(36),                  # Site UUID for the bid origin.
  project_uuid       CHAR(36)       NOT NULL,   # Project UUID.
  project_origin     CHAR(36),                  # Site UUID for project origin.
  price              NUMERIC(15,2),             # Price of the pid.
  user_uuid          CHAR(36)       NOT NULL,   # User UUID who placed the bid.
  created_timestamp  CHAR(19)       NOT NULL,   # Bid creation timestamp in format like "2016-04-08 15:01:10".
  comment            TEXT           NOT NULL,   # User comment.
  days               INTEGER,                   # Number of days required to complete ptoject.
  status             INTEGER,                   # Status of the bid.
  PRIMARY KEY (uuid)
);
# TODO: add indexes.
