#!/usr/bin/python3

import cgi
import subprocess
import requests
import xmltodict
import json

print("content-type: text/html")
print("Access-Control-Allow-Origin: *")
print()

f = cgi.FieldStorage()

plate_no = f.getvalue("Number")


r = requests.get("http://www.regcheck.org.uk/api/reg.asmx/CheckIndia?RegistrationNumber={0}&username=harsh_00".format(str(plate_no)))

data = xmltodict.parse(r.content)
jdata = json.dumps(data)
df = json.loads(jdata)
df1 = json.loads(df['Vehicle']['vehicleJson'])
print("Description		:		 ",df1["Description"])
print()
print("Owner			:		 ",df1["Owner"])
print()
print("RegistrationDate		:		 ",df1["RegistrationDate"])
print()
print("Location        		:		 ",df1["Location"])
print()
print("NumberOfSeats   		:		 ",df1["NumberOfSeats"]["CurrentTextValue"])
print()
print("Identification Number	:		 ",df1["VechileIdentificationNumber"])
print()
print("EngineNumber   		:		 ",df1["EngineNumber"])
print()
print("Vehicle Type      	:		 ",df1["VehicleType"])
print()
print("FuelType        		:		 ",df1["FuelType"]["CurrentTextValue"])


