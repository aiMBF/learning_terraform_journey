resource "google_sql_database_instance" "blog_db_instance" {
  name             = "blog-db-instance"
  database_version = "MYSQL_8_0"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "blog_database" {
  name     = "peripeties_db"
  instance = google_sql_database_instance.blog_db_instance.name
}

resource "google_sql_user" "blog_user" {
  name     = "peripeties_user"
  instance = google_sql_database_instance.blog_db_instance.name
  password = var.db_password
}
