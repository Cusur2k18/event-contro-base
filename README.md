# CUSUR-Control de eventos

This application is the cms and api for the easy event register app

* Ruby version
  `ruby-2.5.3`

* Configuration

  We use [Rails Credentials](https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2) for all the environment configuration.

  First ask the administrator for the ***master key***.
  
  Put the master key in the file `master.key` under `app/config/`. (You can create one if doesn't exists).

  To add or edit the credentials run:

  ```bash 
    EDITOR=vim bin/rails credentials:edit
  ```
  edit or remove the credentials as you wish.


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
