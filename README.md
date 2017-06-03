# learning-python

### Machine scope

* On Ubuntu 17.04 Python3 should be installed by default.
* Install pip: `sudo apt install -y python3-pip` and check it: `pip3 --version`
* Install virtualenv: `sudo pip3 install virtualenv` and check it: `virtualenv --version`

### Project scope

* Create environment: `virtualenv myenv1` -- this will create a directory `myenv1`
* Activate environment: `source myenv1/bin/activate`
* Deactivate environment: `deactivate`
* Delete environment: `rm -rf ./myenv1`

### Development scope

* Add a library: `pip install requests`
* Remember libraries: `pip freeze >requirements.txt`
* Remove a library: `pip uninstall requests`
