# more fun @ http://dev.mysql.com/doc/refman/5.5/en/source-configuration-options.html

cmake . \
  -DWITH_ARCHIVE_STORAGE_ENGINE=1 \
  -DWITH_FEDERATED_STORAGE_ENGINE=1 \
  -DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
  -DMYSQL_DATADIR=/usr/local/mysql/data/ \
  -DCMAKE_INSTALL_PREFIX=/usr/local/mysql \
  -DINSTALL_LAYOUT=STANDALONE \
  -DENABLED_PROFILING=ON \
  -DMYSQL_MAINTAINER_MODE=OFF \
  -DWITH_DEBUG=OFF \
  -DDEFAULT_CHARSET=utf8 \
  -DDEFAULT_COLLATION=utf8_general_ci \
  -DWITH_SSL=no \
  -DMYSQL_TCP_PORT=3306

# the following seems to fuck with ruby gems in some disturbingly deep way. fucking ruby.
# -DWITH_SSL=yes \
