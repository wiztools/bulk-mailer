# Installation Instruction For bMailer

Extract the files from the tar.gz archive into a temporary folder:

    $ tar -zxvf bMailer-VERSION.tgz ~/

The above command will create a directory bMailer in your home directory. Go into that directory, and make the file _bmail.pl_ executable:

    $ chmod 744 bmail.pl

Now open the bmail.pl in any text editor and change the configuration as per your system requirements. Now test the file:

    $ ./bmail.pl -t

The default message should be displayed. For information on
how to work with this application, view the file README.
