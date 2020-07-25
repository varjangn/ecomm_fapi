## ECommerce FAPI

### Setting up environment

1. You may activate virtualenv.

```
$ source env_path/path_to_script_or_bin/activate
```

2. install dependencies from requirements.txt file

```
$ pip install -r requirements.txt
```

### Running the application

Assuming you're in virtualenv with all the dependencies installed and currently in project directory.

1. Import sql file from data folder into sql database after creating database

2. Set appropriate connection string in application.py providing database's username and password

3. Setting an environment variable

```
$ export FLASK_APP=application.py
```

4. Run the application

```
$ flask run
```
