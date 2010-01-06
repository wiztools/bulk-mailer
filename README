bMailer 1.0
===========

bMailer is a bulk mailer program writen in Perl. This product
uses sendmail program to send bulk mail. The email addresses
are read from a file, called the Data File. The message is
sent from a template file, called the Message Template File.

Data File
=========

The data file holds the list of email addresses, where the
mail has to be sent. The addresses are separated by new lines.

Message Template File
=====================

This file contains the message template to be sent. You can
have a special variable $USERNAME$, which will be translated
to the name before "@" symbol of the receiver.

Usage
=====

You can either directly edit the file bmail.pl, and modify the
contents in the user configuration section or use command line
options to specify the details about Data File and Message
Template File.

Command Line Options
====================

-t	Test how the message will be formatted
-d	Data file listing the email addresses
-m	Message template file
-s	Subject
-f	From address. Quote for security reasons
--help	Display Help

Example usages:

$./bmail.pl -d addr.dat -m msg.template -s "Hello $USERNAME$" -f "CoName<co@domain.com>"

$./bmail.pl -t

Download
========

Download this application from:
http://wiztools.googlecode.com/

Licence
=======

This application is distributed under Apache License v2:

http://www.apache.org/licenses/LICENSE-2.0

Bugs
====

Report bugs at:

http://code.google.com/p/wiztools/issues/list

