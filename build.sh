#!/bin/bash
# download BeautifulSoup
curl -O http://www.crummy.com/software/BeautifulSoup/bs3/download//3.x/BeautifulSoup-3.2.1.tar.gz
# extract BeautifulSoup
tar xvf BeautifulSoup-3.2.1.tar.gz BeautifulSoup-3.2.1/BeautifulSoup.py
mv BeautifulSoup-3.2.1/BeautifulSoup.py ./BeautifulSoup.py
# download area centroid
curl -O https://raw.githubusercontent.com/9SQ/jma-eqarea-centroid/master/jma_area_centroid.csv
# download city centroid
curl -O https://raw.githubusercontent.com/9SQ/jma-eqarea-centroid/master/jma_city_centroid.csv

# make aws lambda function package
zip -r ./lambda.zip index.py eqxml2geojson.py BeautifulSoup.py jma_area_centroid.csv jma_city_centroid.csv
