#!/usr/bin/perl -w

#user configuration begin#

$mailprg = "/usr/sbin/sendmail"; 		#path to your mail program
$delay = 0.25; 					#delay in seconds
$from = 'Coname<somename@domain.com>'; 		#from address in your mail
$subject = 'Trial send'; 			#subject of newsletter. u can add the spl code $USERNAME$
$maildata = "mail.dat";				#mail address file
$msgtemplate = "message.template";		#message template file

#user configuration end#

if(@ARGV){
	$i = 0;
	while($ARGV[$i]){
		if($ARGV[$i] eq "--help"){
			print "Command Line Options:\n\n";
			print "-t\tTest how the message will be formatted\n";
			print "-d\tData file listing the email addresses\n";
			print "-m\tMessage template file\n";
			print "-s\tSubject\n";
			print "-f\tFrom address. Quote for security reasons\n";
			die "\nMore information at indiWiz.com\n";
		}
		elsif($ARGV[$i]=~/^-/){
			$arr = substr($ARGV[$i],1,1);
			if($arr eq "d"){
				$maildata = $ARGV[$i+1];
				$i+=2;
			}
			elsif($arr eq "m"){
				$msgtemplate = $ARGV[$i+1];
				$i+=2;
			}
			elsif($arr eq "t"){
				$testflag = 1;
				$i++;
			}
			elsif($arr eq "s"){
				$subject = $ARGV[$i+1];
				$i+=2;
			}
			elsif($arr eq "f"){
				$from = $ARGV[$i+1];
				$i+=2;
			}
			else{
				die "Wrong argument!";
			}
		}
	}
}

open TEMPLATE, $msgtemplate || die "Cannot open template file!\n";
while(<TEMPLATE>){
	$msg .= $_;
}
close TEMPLATE || die "Cannot close template file!\n";

open MAILFILE,"$maildata" || die "Cannot open data file!\n";
while(<MAILFILE>){
    chomp($_);
    @arr = split(/\@/,$_);
    $arr[0] = ucfirst($arr[0]);
    $tmp = $msg;
    $tmp =~ s/\$USERNAME\$/$arr[0]/g;
    $subject =~ s/\$USERNAME\$/$arr[0]/g;
    $temp = "To: $arr[0]<$_>\n";
    $temp .= "From: $from\n";
    $temp .= "Subject: $subject\n\n\n";
    $temp .= $tmp;
    if($testflag){
	    print $temp;
	    last;
    }
    else{
    	open MAILPRG,"|$mailprg -t" || die "Cannot open mail program!\n";
    	print MAILPRG $temp;
    	close MAILPRG || die "Cannot close mailprogram!\n";
	if($delay < 0){
		$delay = 1;
		sleep $delay;
	}
	elsif($delay < 1){
		select(undef,undef,undef,$delay);
	}
	else{
    		sleep $delay;
	}
	print $_,"\n";
    }
}
close MAILFILE || die "Cannot close data file!\n";
