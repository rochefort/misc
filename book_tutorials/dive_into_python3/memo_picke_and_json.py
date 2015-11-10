# chap 13

----
shell = 1
entry = {}
entry['title'] = 'Dive into history, 2009 edition'
entry['article_link'] = 'http://diveintomark.org/archives/2009/03/27/dive-into-history-2009-edtion'
entry['comments_link'] = None
entry['internal_id'] = b'\xDE\xD5\xB4\xF8'
entry['tags'] = ('diveintopython', 'docbook', 'html')
entry['published'] = True
import time
entry['published_date'] = time.strptime('Fri Mar 27 22:20:42 2009')
entry['published_date']

import pickle
with open('entry.pickle', 'wb') as f:
  pickle.dump(entry, f)

----
shell = 2
import pickle
with open('entry.pickle', 'rb') as f:
  entry = pickle.load(f)

----
# shell 1
with open('entry.pickle', 'rb') as f:
  entry2 = pickle.load(f)

entry2 == entry
entry2 is entry

entry2['internal_id']

----
# shell 1
b = pickle.dumps(entry)
type(b)
entry3 = pickle.loads(b)
entry3 == entry

----
# shell 1
import pickletools
with open('entry.pickle', 'rb') as f:
  pickletools.dis(f)

import pickletools
def protocol_version(file_object):
  maxproto = -1
  for opcode, arg, pos in pickletools.genops(file_object):
    maxproto = max(maxproto, opcode.proto)
    return maxproto

import pickversion
with open('entry.pickle', 'rb') as f:
  v = pickversion.protocol_version(f)
v

---
# to JSON
# shell 1
basic_entry = {}
basic_entry['id'] = 256
basic_entry['title'] = 'Dive into history, 2009 edition'
basic_entry['tags'] = ('diveintopython', 'docbook', 'html')
basic_entry['published'] = True
basic_entry['comments_link'] = None
import json
with open('basic.json', mode='w', encoding='utf-8') as f:
  json.dump(basic_entry, f)
with open('basic-pretty.json', mode='w', encoding='utf-8') as f:
  json.dump(basic_entry, f, indent=2)

----
# binary to JSON
# shell 1
entry
import json
with open('entry.json', 'w', encoding='utf-8') as f:
  json.dump(entry, f)
# error occured

import time
def to_json(python_object):
  if isinstance(python_object, time.struct_time):
    return {'__class__': 'time.asctime', '__value__': time.asctime(python_object)}
  if isinstance(python_object, bytes):
    return {'__class__': 'bytes', '__value__': list(python_object)}
  raise TypeError(repr(python_object) + ' is not JSON serializable')

import customserializer
with open('entry.json', 'w', encoding='utf-8') as f:
  json.dump(entry, f, default=customserializer.to_json)

# time.struct_time なのにserializeされてしまっている。

----
# read JSON
# shell 2
del entry
entry

import json
with open('entry.json', 'r', encoding='utf-8') as f:
  entry = json.load(f)

entry

def from_json(json_object):
  if '__class__' in json_object:
    if json_object['__class__'] == 'time.asctime':
      return time.strptime(json.object['__vlaue__'])
    if json_object['__class__'] == 'bytes':
      return bytes(json_object['__value__'])
  return json_object

import customserializer
with open('entry.json', 'r', encoding='utf-8') as f:
  entry = json.load(f, object_hook=customserializer.from_json)

----
# shell 1
import customserializer
with open('entry.json', 'r', encoding='utf-8') as f:
  entry2 = json.load(f, object_hook=customserializer.from_json)

entry2 == entry
entry['tags']
entry2['tags']
