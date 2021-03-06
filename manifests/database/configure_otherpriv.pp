class creamce::database::configure_otherpriv inherits creamce::params {
  #
  # privileges
  #
  exec {"setup minpriv localhost":
    command => "/usr/bin/mysql -h ${cream_db_host} -u root --password=\"${mysql_password}\" -e \"GRANT SELECT (submissionEnabled,startUpTime) on ${cream_db_name}.db_info to ${cream_db_minpriv_user}@localhost IDENTIFIED BY '${cream_db_minpriv_password}' WITH GRANT OPTION;\"",
    loglevel => notice,
  }
  exec {"setup minpriv hostname":
    command =>"/usr/bin/mysql -h ${cream_db_host} -u root --password=\"${mysql_password}\" -e \"GRANT SELECT (submissionEnabled,startUpTime) on ${cream_db_name}.db_info to ${cream_db_minpriv_user}@'${hostname}' IDENTIFIED BY '${cream_db_minpriv_password}' WITH GRANT OPTION;\"",
    loglevel => notice,
  }
  exec {"setup minpriv fqdn":
    command => "/usr/bin/mysql -h ${cream_db_host} -u root --password=\"${mysql_password}\" -e \"GRANT SELECT (submissionEnabled,startUpTime) on ${cream_db_name}.db_info to ${cream_db_minpriv_user}@'${fqdn}' IDENTIFIED BY '${cream_db_minpriv_password}' WITH GRANT OPTION;\"",
    loglevel => notice,
  }
}
