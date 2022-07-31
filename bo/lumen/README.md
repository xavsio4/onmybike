```
docker-compose up
```

The previous command starts 3 docker containers:

-   mySql database
-   admin interface for mySql database (localhost:8080)
    -   user: root
    -   password: root
-   a php container for lumen (localhost:8000)

Make sure to create a table "customer" in the database before trying to call the default route (/) or update the routes/web.php file and remove the query to the customer table.
