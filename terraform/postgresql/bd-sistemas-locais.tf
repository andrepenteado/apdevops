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

resource "postgresql_role" "nfe" {
  name     = "nfe"
  login    = true
  password = "nfe,,.."
}

resource "postgresql_role" "cte" {
  name     = "cte"
  login    = true
  password = "cte,,.."
}

resource "postgresql_role" "mdfe" {
  name     = "mdfe"
  login    = true
  password = "mdfe,,.."
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

resource "postgresql_database" "nfe" {
  name              = "nfe"
  owner             = "nfe"
  allow_connections = true
  depends_on = [ postgresql_role.nfe ]
}

resource "postgresql_database" "cte" {
  name              = "cte"
  owner             = "cte"
  allow_connections = true
  depends_on = [ postgresql_role.cte ]
}

resource "postgresql_database" "mdfe" {
  name              = "mdfe"
  owner             = "mdfe"
  allow_connections = true
  depends_on = [ postgresql_role.mdfe ]
}