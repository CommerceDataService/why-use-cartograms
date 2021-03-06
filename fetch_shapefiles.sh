#!/bin/sh

year=2014

# Download the state-by-state tract files and unzip. We're using TIGER from
# the same year as the ACS data. Not sure if that lines up exactly but should
# be pretty close since tract geography doesn't change too much from year to
# year?

mkdir -p shapefiles_tract
for fips in 01 02 04 05 06 08 09 10 11 12 13 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 44 45 46 47 48 49 50 51 53 54 55 56 60 66 69 72 78
do
	echo $fips...
	wget -q -nc -P shapefiles_tract ftp://ftp2.census.gov/geo/tiger/TIGER$year/TRACT/tl_${year}_${fips}_tract.zip
	unzip -d shapefiles_tract -o shapefiles_tract/tl_${year}_${fips}_tract.zip
done

# Download & extract the whole-U.S. file for counties.

mkdir -p shapefiles_county
echo counties...
wget -q -nc -P shapefiles_county ftp://ftp2.census.gov/geo/tiger/TIGER$year/COUNTY/tl_${year}_us_county.zip
unzip -d shapefiles_county -o shapefiles_county/tl_${year}_us_county.zip
