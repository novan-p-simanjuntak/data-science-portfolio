
# DogsVSCats

### Problem
The problem is taken from [Kaggle Dogs vs. Cats Redux: Kernels Edition](https://www.kaggle.com/c/dogs-vs-cats-redux-kernels-edition#evaluation)
It is an object recognition problem to determine is it a cat or a dog given a picture.

### Virtual Environment
1. Install [virtualenv](http://conda.pydata.org/miniconda.html) if you have not done so
`python -m pip install -U pip venv`
2. Create environment in .env
`venv .env`                  
3. Activate virtual environment
`source .env/bin/activate` 

### Managing Dependencies
1. Activate the env: `source .env/bin/activate`
2. Update `requirements.txt`
3. Update the env: `pip install -r requirements.txt`

### Download data
1. Download [kaggle data](`https://www.kaggle.com/c/dogs-vs-cats-redux-kernels-edition/data`)
2. in dogsvscats/nbs/data folder, create a dogscats folder containing:
    - test1 folder, contains test set from kaggle
    - train folder, contains training set from kaggle
    - valid folder, like train folder, there are 2 folders (cats and dogs), sample 1000 images for each class
    - (optional) sample folder, containing test1, train, and valid folder, but only a little, this is for testing code only.
3. Set `path` in the notebook to the folder that contains train, valid and test1 folder.
    

### Contributing
All code must follow PEP 8 with code E501 that limits all lines to a maximum of 79 characters ignored. 120 characters limit is exercised.

### Build docker
1. Set your working directory to dogsvscats. This folder contains Dockerfile.
2. Build docker using command `sudo docker build --build-arg GIT_VER=<unique_number> -t vgg16_dogsvscats:<tag> .`
Set git_ver as unique number to update github and tag as images tag.

### Run using docker
There is a need using docker when training in cloud using GPU.
To do this:
1. Download installer script.
`curl -fsSL get.docker.com -o get-docker.sh`
2. Run installer script. 
`sudo sh get-docker.sh`
3. Add current user to docker group so that we can run docker cli without sudo.
`sudo usermod -aG docker $USER`
4. Close current terminal window and open a new one.
5. Run `docker info` to verify the installation.
6. Download docker images in [dockerhub](`https://hub.docker.com/r/novanps/vgg16_dogsvscats/`)
`docker pull novanps/vgg16_dogsvscats:0.1`
7. Run docker using command 
`sudo docker run --rm -it -p 8888:8888 novanps/vgg16_dogsvscats:0.1 bash`

### Run Jupyter Notebook
1. Run jupyter notebook with dogsvscats as working directory.
`jupyter notebook --no-browser --allow-root --ip=0.0.0.0 --port=8888`
2. Visit Jupyter notebook server at http://<VM Public IP>:8888/. You will see token to access notebook in the terminal.
3. Fill in the Password or token field with value from previous step.
3. open `NPS-dogsvscats-kaggle.ipynb`. This will create a submission file in the sample_path.
You can submit it to kaggle.
