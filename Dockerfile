# Using the 5.7 base as required by the application, 
# though for future iterations, an upgrade to MySQL 8.0 is recommended due to EOL.
FROM mysql:5.7

# Create a directory for custom configurations
RUN mkdir -p /etc/mysql/conf.d

# Copy custom MySQL configuration (Optional: if you have a my.cnf for buffer pool tuning)
# COPY my-production.cnf /etc/mysql/conf.d/

# Copy the initialization script. 
# In a true enterprise setup, schema creation is often handled by tools like Flyway or Liquibase,
# but initdb.d is perfectly fine for container-native initialization.
COPY shipping.sql /docker-entrypoint-initdb.d/shipping.sql

# Best practice: explicitly document the exposed port
EXPOSE 3306