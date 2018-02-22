FROM continuumio/anaconda3:5.0.1

RUN conda install jupyter -y
RUN conda install xgboost -y -c conda-forge

RUN pip install plotly
RUN pip install plotnine

# must be off VPN for this IME, else you get `ssl.SSLEOFError: EOF occurred in violation of protocol`
RUN pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.5.0-cp36-cp36m-linux_x86_64.whl
