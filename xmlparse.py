#!/usr/bin/env python

from xml.etree import ElementTree as ET
import os
import sys

def add():
    if len(sys.argv) < 4:
        print "Error: Not enough arguments"
        return
    print "Adding AP"
    db_file = os.path.abspath(__file__)
    db_file = os.path.dirname(db_file)
    db_file = os.path.join(db_file, "db.xml")
    tree = ET.parse(db_file)
    ap = ET.SubElement(tree.getroot(), "ap")
    ap.set("essid", sys.argv[2])
    ap.set("pw", sys.argv[3])
    tree.write(db_file)

def get():
    if len(sys.argv) < 3:
        print "Error: Not enough arguments"
        return
    print "TODO, happy new year"
    return
    db_file = os.path.abspath(__file__)
    db_file = os.path.dirname(db_file)
    db_file = os.path.join(db_file, "db.xml")
    tree = ET.parse(db_file)
    

def main():
    if sys.argv[1] == "add":
        add()
        return
    if sys.argv[1] == "get":
        get()
        return
    db = ET.Element("db")
    ap = ET.SubElement(db, "ap")
    ap.set("essid", "testo")
    ap.set("pw", "topsecr3t")
    ap = ET.SubElement(db, "ap")
    ap.set("essid", "popcorn")
    ap.set("pw", "cola")

#    print ET.tostring(db)

    db_file = os.path.abspath(__file__)
    db_file = os.path.dirname(db_file)
    db_file = os.path.join(db_file, "db.xml")

    tree = ET.ElementTree(db)

    if not os.path.exists(db_file) :
        open(db_file, 'w').close()
    
    try:
        tree.write(db_file)
    except Exception, inst:
        print "Unexpected error %s: %s" % (db_file, inst)
        return
    
    


if __name__ == "__main__":
    main()
