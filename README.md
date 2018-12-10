# CUSUR-Control de eventos

This application is the cms and api for the easy event register app

* Ruby version
  `ruby-2.5.3`

* Configuration
  * ***Cloudinary setup:***
    - Copy the example file
      ```bash
        cp app/config/cloudinary.example.yml app/config/cloudinary.yml
      ```
    - Fill it wit your own values.

* Database creation.<br/>
  * Run the migrations: 

    ```bash
    $ rails db:migrate
    ```

* Database initialization
  * For development, run the seeds
    ```bash
    $ rails db:seed
    ```
* Run it <br />
  
  Run the local server:
    ```bash
    $ rails s
    ```
  go to `localhost:3000/admin` and log in with the following credentials
    ```
      username: admin@example.com
      password: password
    ```

  ***Enjoy it!***
