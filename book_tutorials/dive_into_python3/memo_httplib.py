# not good
import urllib.request
a_url = 'http://diveintopython3.org/examples/feed.xml'
data = urllib.request.urlopen(a_url).read()
type(data)
print(data)

----
from http.client import HTTPConnection
HTTPConnection.debuglevel = 1
from urllib.request import urlopen
response = urlopen('http://diveintopython3.org/exapmle/feed.xml')

print(response.headers.as_string())
data = response.read()
len(data)


# 何度やっても同じリクエストを返す
response2 = urlopen('http://diveintopython3.org/exapmle/feed.xml')

----

import httplib2
h = httplib2.Http('.cache')
response, content = h.request('http://diveintopython3.org/exapmle/feed.xml')
response.status
content[:52]
len(content)

respons2, content2 = h.request('http://diveintopython3.org/exapmle/feed.xml')
response2.status
content2[:52]
len(content2)


# restart shell
import httplib2
httplib2.debuglevel = 1
h = httplib2.Http('.cache')
response, content = h.request('http://diveintopython3.org/exapmle/feed.xml')
len(content)
response.status
response.fromcache


----
import httplib2
httplib2.debuglevel = 1
h = httplib2.Http('.cache')
response, content = h.request('http://example.com/')
