from flask import Flask, render_template, request, send_from_directory
import os.path
import datetime
import inspect
from enum import Enum
import psycopg2
import sys, yaml, json
from pathlib import Path

app = Flask(__name__, static_url_path='/static')

con = psycopg2.connect(database="administrativehierarchydata", user="postgres", password="Dev@123", host="127.0.0.1", port="5432")
cursor = con.cursor()
#cursor.execute("SELECT * FROM Firsthierarchy;")
#result = cursor.fetchall()
cursor.execute("SELECT * FROM fieldname;")
field_name = cursor.fetchall()

db_dict = {"State" : "Firsthierarchy", "District" : "Secondhierarchy", "Tehsil" : "Thirdhierarchy", "Village" : "Fourthhierarchy", "Khewat" : "Fifthhierarchy", "Murrabba" : "Sixthhierarchy", "Khasra" : "Sevenhierarchy"}

@app.route('/')
def Adminstrative(): 

    fields_data  = serialize_sets(field_name)
    print(fields_data)    
    return render_template('Adminstrative.html', state = "State")  


@app.route('/getNextHierarchy')
def getNextHierarchy():

    selected_val = int(request.args.get('value'))
    selecteddropdown = request.args.get('selectedhier')
    print(type(selected_val))
    print(selecteddropdown)    
    
    db_name = db_dict[selecteddropdown]    
    check_condition = ""
    
    if(selected_val == -1):
        check_condition = ""
    else:
        check_condition = " WHERE PrevioushierarchyID = " + str(selected_val)       
        
    
    cursor.execute("SELECT * FROM " + db_name + check_condition +";")
    result = cursor.fetchall()
    print("result ", result)
    hierarchyId = 0
    if len(result) != 0:
        hierarchyId = result[0][2]
        
    
    label_name = ""
    for tup in field_name:
        if tup[0] == hierarchyId:
            label_name = tup[1]
    
    result.append(label_name)
    
    response = app.response_class(
    response=json.dumps(result, default=serialize_sets, indent=None),
    status=200,
    mimetype='application/json'
    )
    print(type(response))
    return response
    
def serialize_sets(obj):
    if isinstance(obj, set):
        return list(obj)

    return obj

if __name__ == '__main__':
    app.run(port=7777)