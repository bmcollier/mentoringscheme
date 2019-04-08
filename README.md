# cobol-dev-env

Mount folder for COBOL dev: docker run -d -p 9090:80 -v $(pwd)/scripts:/usr/local/apache2/cgi-bin cobol
Get bash shell for running cobc: docker exec -it <container name> /bin/bash
