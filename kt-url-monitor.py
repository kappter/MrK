#!/usr/bin/python
################################################################################
## Kontrollkit
## NAME: kt-url-monitor.py
## DATE: 2010-02-24
## AUTHOR: Matt Reid
## WEBSITE: http://kontrollsoft.com
## EMAIL: support@kontrollsoft.com
## LICENSE: BSD http://www.opensource.org/licenses/bsd-license.php
################################################################################
## Copyright 2010-present Matt Reid
## All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# 3. The name of the author may not be used to endorse or promote products
# derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
# IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
##################################################################################
## WHAT THIS SCRIPT DOES #########################################################
## Purpose: Checks URL for valid page and emails if failed.
##################################################################################
## EDIT THE FOLLOWING AS NEEDED
email = "email@email.com" ##Email address to send alert to
host = "hostname.com" ##Hostname base URL without http://
port = "80" ##Port - 80 for http, 443 for https
url = "/index.html" ##Page to look for on host
SENDMAIL = "/usr/sbin/sendmail" ##Binary location for sendmail
logfile = "/var/log/kt-url-monitor.log" ##Logfile to write actions to
## END OF EDITABLE OPTIONS
##################################################################################
import sys
import os
import os.path
import datetime
from httplib import HTTP

def wfile(detail):
fstate = os.path.exists(logfile)
if(fstate == 0):
print "Logfile does not exist. Attempting to create..."
try:
file = open(logfile,"a+")
file.writelines(detail)
file.close()

except IOError:
print "Cannot open logfile for writing. Exiting."
sys.exit(1)

else:
print "Logfile exists, writing...\n"
file = open(logfile,"a+")
file.writelines(detail)
file.close()

def get(host,port,url):
concaturl = host+url
print "Checking Host:",concaturl
h = HTTP(host, port)
h.putrequest('GET', url)
h.putheader('Host', host)
h.putheader('User-agent', 'python-httplib')
h.endheaders()

(returncode, returnmsg, headers) = h.getreply()
if returncode != 200:
print returncode,returnmsg
return returncode

else:
f = h.getfile()
# return f.read() #returns content of page for further parsing
print returncode, returnmsg
return returncode

if __name__ == '__main__':
now = datetime.datetime.now()
date = now.strftime("%Y-%m-%d %H:%M:%S")
dmsg = date+" - URL verification starting - "
wfile(dmsg)
concaturl = "http://"+host+url
state = get(host,port,url)

if(state != 200):
msg = "Link (%s) is broken or unavailable. Return code: %s" % (concaturl,state)+"\n"
wfile(msg)
to = "To: "+email+"\n"
print msg,"\n"
p = os.popen("%s -t" % SENDMAIL, "w")
p.write(to)
p.write("Subject: Demo Server Status\n")
p.write("\n")
p.write(msg)
sts = p.close()
if sts != 0:
print "Sendmail exit status", sts
else:
msg = "Link (%s) is good. Return code: %s" % (concaturl,state)+"\n"
wfile(msg)
print msg+"\n"
