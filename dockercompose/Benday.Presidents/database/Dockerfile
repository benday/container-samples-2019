FROM mcr.microsoft.com/mssql/server
COPY create-presidents-user.sql /initial-scripts/create-presidents-user.sql

# set environment variables
ENV MSSQL_SA_PASSWORD=P@ssw0rd
ENV ACCEPT_EULA=Y

# COPY run-scripts.sh /initial-scripts/run-scripts.sh
# RUN /initial-scripts/run-scripts.sh
# RUN ["/opt/mssql-tools/bin/sqlcmd", "-S", "localhost", "-U", "sa", "-P", "$SA_PASSWORD", "-i", "/initial-scripts/create-presidents-user.sql", "-o", "/tmp/sqllog.txt"]
# RUN ["/opt/mssql-tools/bin/sqlcmd", "-S", "localhost", "-U", "sa", "-P", "$SA_PASSWORD", "-i", "/initial-scripts/create-presidents-user.sql"]


RUN ( /opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'P@ssw0rd' -i /initial-scripts/create-presidents-user.sql \
    && pkill sqlservr 