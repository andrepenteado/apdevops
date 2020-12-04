provider "postgresql" {
  host            = "localhost"
  port            = 5432
  database        = "postgres"
  username        = "postgres"
  password        = "postgres"
  sslmode         = "disable"
  connect_timeout = 15
}

resource "postgresql_role" "servicedesk_v2" {
  name     = "servicedesk_v2"
  login    = true
  password = "iNgohl6L"
}

resource "postgresql_role" "webportaria" {
  name     = "webportaria"
  login    = true
  password = "webportaria"
}

resource "postgresql_role" "cpa" {
  name     = "cpa"
  login    = true
  password = "szJM7HbX"
}

resource "postgresql_database" "servicedesk_v2" {
  name              = "servicedesk_v2"
  owner             = "servicedesk_v2"
  allow_connections = true
  depends_on = [ postgresql_role.servicedesk_v2 ]
}

resource "postgresql_database" "servicedesk_v2_test" {
  name              = "servicedesk_v2_test"
  owner             = "servicedesk_v2"
  allow_connections = true
  depends_on = [ postgresql_role.servicedesk_v2 ]
}

resource "postgresql_database" "webportaria" {
  name              = "webportaria"
  owner             = "webportaria"
  allow_connections = true
  depends_on = [ postgresql_role.webportaria ]
}

resource "postgresql_database" "cpa" {
  name              = "cpa"
  owner             = "cpa"
  allow_connections = true
  depends_on = [ postgresql_role.cpa ]
}

