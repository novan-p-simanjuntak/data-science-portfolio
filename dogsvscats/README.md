
# DogsVSCats

### Problem
The problem is taken from [Kaggle Dogs vs. Cats Redux: Kernels Edition](https://www.kaggle.com/c/dogs-vs-cats-redux-kernels-edition#evaluation)
It is an object recognition problem to determine is it a cat or a dog given a picture.

### Getting Started
1. Install [virtualenv](http://conda.pydata.org/miniconda.html) if you have not done so
`python -m pip install -U pip venv`
2. Create environment in .env
`venv .env`                  
3. Activate virtual environment
`source .env/bin/activate` 

### Managing Dependencies
1. Activate the env: `source .env/bin/activate`
2. Update `requirements.txt`
3. Update the env: `conda env update`

### Install Spacy id model
1. Go to spacy_id folder: `cd rasa_server/spacy_id`
2. Fetch latest submodule: `git submodule init` then `git submodule update`
3. Install spacy requirements: `pip install -r requirements.txt`
4. Install this library as dependency: `pip install -e .`
5. Create data directory: `mkdir spacy/data`
6. Make it a python package: `echo "" > spacy/data/__init__.py`
6. Symlink to model: `python -m spacy link <path-to-id-model>  id` 
(Ask the model from Novan (novan.p.simanjuntak@gdplabs.id))

### Contributing
All code must follow PEP 8 with code E501 that limits all lines to a maximum of 79 characters ignored. 120 characters limit is exercised.

### Running
1. rasa_server
    1. Change directory to rasa_server/
    2. Run rasa server: `python -m rasa_nlu.server`
    3. To validate rasa, send request using this command `curl RASA_HOST:RASA_PORT/status`, it must return http response status 200/OK
    
### Deployment
1. rasa_server
    ##### Environment Variables
    * RASA_HOST
    * RASA_PORT

### Accuracy Testing
Adding module to evaluate model's accuracy by using jarvis's bca data.
1. In order to use it there are some things to be prepared:
    1. Make sure id language model is available for spacy
    2. Prepare model in this following path tests/accuracy/accuracy_projects/test Model can also be trained by set "do_train" in tests/accuracy/config_model_accuracy.json to true. The model will be trained using from tests/accuracy/data/jarvis_data_for_rasa.json
    3. data for do the model testing need to be prepared and placed in tests/accuracy/data/rasa_dummy.json
    4. create folder for output in path tests/accuracy/accuracy_projects
    5. name for the project name can be customized in tests/accuracy/config_model_accuracy.json by edit
2. Run it by using pytest
3. Output: json file that gives the correct and false prediction for every entity and intent from the example in testing file. File will be saved in tests/accuracy/report/{timestamp}.json
